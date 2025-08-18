import { getConnection } from "../database/connection.js";
import jwt from "jsonwebtoken";
import { JWT_SECRET } from "../config.js";

// Obtener todos los clientes
export const getClientes = async (req, res) => {
  try {
    const pool = getConnection();
    const result = await pool.query("SELECT * FROM Clientes");
    res.json(result.rows);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

// Crear un nuevo cliente
export const createNewClientes = async (req, res) => {
  const {
    nombre,
    apellido,
    direccion,
    email,
    telefono,
    nombre_usuario,
    contraseña,
    dni
  } = req.body;

  if (
    nombre == null ||
    apellido == null ||
    direccion == null ||
    email == null ||
    telefono == null ||
    nombre_usuario == null ||
    contraseña == null ||
    dni == null
  ) {
    return res.status(400).json({ msg: "Bad Request. Please fill all fields" });
  }

  try {
    const pool = getConnection();
    const result = await pool.query(
      "INSERT INTO Clientes (nombre, apellido, direccion, email, telefono, nombre_usuario, contraseña, dni) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *",
      [nombre, apellido, direccion, email, telefono, nombre_usuario, contraseña, dni]
    );
    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

export const getClienteByData = async (req, res) => {
  try {
    const pool = getConnection();
    const { data, password } = req.params;
    const result = await pool.query(
      "SELECT * FROM Clientes WHERE (email = $1 or telefono = $1 or nombre_usuario = $1 or dni = $1) and contraseña = $2",
      [data, password]
    );
    if (result.rows.length === 0) return res.sendStatus(404);

    // Generar el token JWT
    const user = result.rows[0];
    const token = jwt.sign(
      { id: user.idcliente, email: user.email, nombre: user.nombre },
      JWT_SECRET,
      { expiresIn: "30d" }
    );

    return res.json({ user, token });
  } catch (error) {
    res.status(500).send(error.message);
  }
};

export const getActividadesByCliente = async (req, res) => {
  try {
    const pool = getConnection();
    const result = await pool.query("SELECT * FROM Solicitudes WHERE idcliente = $1", [req.params.id]);
    res.json(result.rows);
  } catch (error) {
    res.status(500).send(error.message);
  }
}

export const resetPasswordCliente = async (req, res) => {
  const { data, newPassword } = req.body;
  if (!data || !newPassword) {
    return res.status(400).json({ msg: "Bad Request. Please provide data and newPassword" });
  }
  try {
    const pool = getConnection();
    const result = await pool.query(
      "UPDATE Clientes SET contraseña = $2 WHERE email = $1 OR telefono = $1 OR nombre_usuario = $1 OR dni = $1 RETURNING *",
      [data, newPassword]
    );
    if (result.rows.length === 0) return res.sendStatus(404);
    res.json({ msg: "Contraseña actualizada correctamente" });
  } catch (error) {
    res.status(500).send(error.message);
  }
}