import { getConnection } from "../database/connection.js";

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
    return res.json(result.rows[0]);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

export const getActividadesByCliente = async (req, res) => {
  try {
    const pool = getConnection();
    const result = await pool.query("SELECT * FROM Solicitudes WHERE idcliente = $1", [req.params.idcliente]);
    res.json({ total: parseInt(result.rows[0].count, 10) });
  } catch (error) {
    res.status(500).send(error.message);
  }
}