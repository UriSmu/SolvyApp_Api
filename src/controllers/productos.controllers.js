import { getConnection } from "../database/connection.js";

// Obtener todos los productos
export const getProducts = async (req, res) => {
  try {
    const pool = getConnection();
    const result = await pool.query("SELECT * FROM Productos");
    res.json(result.rows);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

// Crear un nuevo producto
export const createNewProduct = async (req, res) => {
  const { imagen_url, descripcion, nombre = "", precioUnitario } = req.body;

  if (descripcion == null || imagen_url == null || nombre == null || precioUnitario == null) {
    return res.status(400).json({ msg: "Bad Request. Please fill all fields" });
  }

  try {
    const pool = getConnection();
    const result = await pool.query(
      "INSERT INTO Productos (imagen_url, descripcion, nombre, precioUnitario) VALUES ($1, $2, $3, $4) RETURNING *",
      [imagen_url, descripcion, nombre, precioUnitario]
    );
    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

// Obtener producto por ID
export const getProductById = async (req, res) => {
  try {
    const pool = getConnection();
    const result = await pool.query(
      "SELECT * FROM Productos WHERE IdProducto = $1",
      [req.params.id]
    );
    if (result.rows.length === 0) return res.sendStatus(404);
    return res.json(result.rows[0]);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

// Eliminar producto por ID
export const deleteProductById = async (req, res) => {
  try {
    const pool = getConnection();
    const result = await pool.query(
      "DELETE FROM Productos WHERE IdProducto = $1",
      [req.params.id]
    );
    if (result.rowCount === 0) return res.sendStatus(404);
    return res.sendStatus(204);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

// Obtener el total de productos
export const getTotalProducts = async (req, res) => {
  try {
    const pool = getConnection();
    const result = await pool.query("SELECT COUNT(*) FROM Productos");
    res.json({ total: parseInt(result.rows[0].count, 10) });
  } catch (error) {
    res.status(500).send(error.message);
  }
};

// Actualizar producto por ID
export const updateProductById = async (req, res) => {
  const { descripcion, imagen_url, nombre = "", precioUnitario } = req.body;

  if (
    descripcion == null ||
    imagen_url == null ||
    nombre == null ||
    precioUnitario == null
  ) {
    return res.status(400).json({ msg: "Bad Request. Please fill all fields" });
  }

  try {
    const pool = getConnection();
    const result = await pool.query(
      "UPDATE Productos SET imagen_url = $1, descripcion = $2, nombre = $3, precioUnitario = $4 WHERE IdProducto = $5 RETURNING *",
      [imagen_url, descripcion, nombre, precioUnitario, req.params.id]
    );
    if (result.rowCount === 0) return res.sendStatus(404);
    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).send(error.message);
  }
};