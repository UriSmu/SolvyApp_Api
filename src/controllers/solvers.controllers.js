import { getConnection } from "../database/connection.js";
import jwt from "jsonwebtoken";
import { JWT_SECRET } from "../config.js";

// Obtener todos los Solvers
export const getSolvers = async (req, res) => {
  try {
    const pool = getConnection();
    const result = await pool.query("SELECT * FROM Solvers");
    res.json(result.rows);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

// Crear un nuevo Solver
export const createNewSolvers = async (req, res) => {
  const {
    nombre,
    apellido,
    direccion,
    nacionalidad,
    email,
    telefono,
    nombre_usuario,
    contraseña,
    dni,
    movilidad_propia,
    tipo_vehiculo,
    cuil_o_cuit,
    fotodnifrente,
    fotodnidorso,
    fotopersonal,
    certificadoantecedentesp,
    edad
  } = req.body;

  if (
    nombre == null ||
    apellido == null ||
    direccion == null ||
    nacionalidad == null ||
    email == null ||
    telefono == null ||
    nombre_usuario == null ||
    contraseña == null ||
    dni == null ||
    movilidad_propia == null ||
    edad == null
  ) {
    return res.status(400).json({ msg: "Bad Request. Please fill all fields" });
  }

  try {
    const pool = getConnection();
    const result = await pool.query(
      `INSERT INTO Solvers 
      (nombre, apellido, direccion, nacionalidad, email, telefono, nombre_usuario, contraseña, dni, movilidad_propia, tipo_vehiculo, cuil_o_cuit, fotodnifrente, fotodnidorso, fotopersonal, certificadoantecedentesp, edad) 
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17) RETURNING *`,
      [nombre, apellido, direccion, nacionalidad, email, telefono, nombre_usuario, contraseña, dni, movilidad_propia, tipo_vehiculo, cuil_o_cuit, fotodnifrente, fotodnidorso, fotopersonal, certificadoantecedentesp, edad]
    );
    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

export const getSolverByData = async (req, res) => {
  try {
    const pool = getConnection();
    const { data, password } = req.params;
    const result = await pool.query(
      "SELECT * FROM Solvers WHERE (email = $1 or telefono = $1 or nombre_usuario = $1 or dni = $1) and contraseña = $2",
      [data, password]
    );
    if (result.rows.length === 0) return res.sendStatus(404);

    // Generar el token JWT
    const user = result.rows[0];
    const token = jwt.sign(
      { id: user.idsolver, email: user.email, nombre: user.nombre },
      JWT_SECRET,
      { expiresIn: "30d" }
    );

    return res.json({ user, token });
  } catch (error) {
    res.status(500).send(error.message);
  }
};

export const getActividadesBySolver = async (req, res) => {
  try {
    const pool = getConnection();
    const result = await pool.query("SELECT * FROM Solicitudes WHERE idsolver = $1", [req.params.id]);
    res.json(result.rows);
  } catch (error) {
    res.status(500).send(error.message);
  }
}

export const getSolverById = async (req, res) => {
  try {
    const pool = getConnection();
    const result = await pool.query("SELECT * FROM Solvers WHERE idsolver = $1", [req.params.id]);
    res.json(result.rows);
  } catch (error) {
    res.status(500).send(error.message);
  }
}

export const resetPasswordSolver = async (req, res) => {
  const { data, newPassword } = req.body;
  if (!data || !newPassword) {
    return res.status(400).json({ msg: "Bad Request. Please provide data and newPassword" });
  }
  try {
    const pool = getConnection();
    const result = await pool.query(
      "UPDATE Solvers SET contraseña = $2 WHERE email = $1 OR telefono = $1 OR nombre_usuario = $1 OR dni = $1 RETURNING *",
      [data, newPassword]
    );
    if (result.rows.length === 0) return res.sendStatus(404);
    res.json({ msg: "Contraseña actualizada correctamente" });
  } catch (error) {
    res.status(500).send(error.message);
  }
}

// 1. Agregar servicio a un solver
export const addServicioToSolver = async (req, res) => {
  const { idsolver, idservicio, estudios, certificadoestudios, experiencia } = req.body;
  if (
    idsolver == null ||
    idservicio == null ||
    estudios == null ||
    experiencia == null ||
    (estudios === true && !certificadoestudios)
  ) {
    return res.status(400).json({ msg: "Faltan campos obligatorios" });
  }
  try {
    const pool = getConnection();
    const result = await pool.query(
      `INSERT INTO solverservicio (idsolver, idservicio, estudios, certificadoestudios, experiencia)
       VALUES ($1, $2, $3, $4, $5) RETURNING *`,
      [idsolver, idservicio, estudios, certificadoestudios || null, experiencia]
    );
    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

// 2. Agregar subservicio a un servicio de un solver
export const addSubservicioToSolverServicio = async (req, res) => {
  const { idsolverservicio, idsubservicio } = req.body;
  if (!idsolverservicio || !idsubservicio) {
    return res.status(400).json({ msg: "Faltan campos obligatorios" });
  }
  try {
    const pool = getConnection();
    const result = await pool.query(
      `INSERT INTO solvserv_subservicio (idsolverservicio, idsubservicio)
       VALUES ($1, $2) RETURNING *`,
      [idsolverservicio, idsubservicio]
    );
    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

// 3. Traer todos los servicios que puede hacer un solver
export const getServiciosBySolver = async (req, res) => {
  const { idsolver } = req.params;
  try {
    const pool = getConnection();
    const result = await pool.query(
      `SELECT ss.*, s.nombre AS nombre_servicio
       FROM solverservicio ss
       JOIN servicios s ON ss.idservicio = s.idservicio
       WHERE ss.idsolver = $1`,
      [idsolver]
    );
    res.json(result.rows);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

// 4. Traer todos los subservicios de un servicio que puede hacer un solver
export const getSubserviciosBySolverServicio = async (req, res) => {
  const { idsolverservicio } = req.params;
  try {
    const pool = getConnection();
    const result = await pool.query(
      `SELECT ss.*, sub.nombre AS nombre_subservicio
       FROM solvserv_subservicio ss
       JOIN subservicios sub ON ss.idsubservicio = sub.idsubservicio
       WHERE ss.idsolverservicio = $1`,
      [idsolverservicio]
    );
    res.json(result.rows);
  } catch (error) {
    res.status(500).send(error.message);
  }
};