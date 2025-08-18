import { getConnection } from "../database/connection.js";

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
    return res.json(result.rows[0]);
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