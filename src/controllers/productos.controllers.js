import { getConnection, sql } from "../database/connection.js";

export const getProducts = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM Productos");
    res.json(result.recordset);
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

export const createNewProduct = async (req, res) => {
  const { imagen_url, descripcion, nombre = 0, precioUnitario } = req.body;

  if (descripcion == null || imagen_url == null) {
    return res.status(400).json({ msg: "Bad Request. Please fill all fields" });
  }

  try {
    const pool = await getConnection();

    const result = await pool
      .request()
      .input("imagen_url", sql.VarChar, imagen_url)
      .input("descripcion", sql.Text, descripcion)
      .input("nombre", sql.VarChar, nombre)
      .input("precioUnitario", sql.Decimal, precioUnitario)
      .query(
        "INSERT INTO Productos (imagen_url, descripcion, nombre, precioUnitario) VALUES (@imagen_url,@descripcion,@nombre,@precioUnitario); SELECT SCOPE_IDENTITY() as id"
      );

    res.json({
      imagen_url,
      descripcion,
      nombre,
      precioUnitario,
    });
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

export const getProductById = async (req, res) => {
  try {
    const pool = await getConnection();

    const result = await pool
      .request()
      .input("id", req.params.id)
      .query("SELECT * FROM Productos WHERE IdProducto = @id");

    return res.json(result.recordset[0]);
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

export const deleteProductById = async (req, res) => {
  try {
    const pool = await getConnection();

    const result = await pool
      .request()
      .input("id", req.params.id)
      .query("DELETE FROM Productos WHERE IdProducto = @id");

    if (result.rowsAffected[0] === 0) return res.sendStatus(404);

    return res.sendStatus(204);
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

export const getTotalProducts = async (req, res) => {
  const pool = await getConnection();
  const result = await pool.request().query("SELECT COUNT(*) FROM Productos");
  res.json(result.recordset[0][""]);
};

export const updateProductById = async (req, res) => {
  const { descripcion, imagen_url, nombre = 0, precioUnitario } = req.body;

  if (
    descripcion == null ||
    imagen_url == null ||
    nombre == null ||
    precioUnitario == null
  ) {
    return res.status(400).json({ msg: "Bad Request. Please fill all fields" });
  }

  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("id", req.params.id)
      .input("imagen_url", sql.VarChar, imagen_url)
      .input("descripcion", sql.Text, descripcion)
      .input("nombre", sql.Int, nombre)
      .input("precioUnitario", sql.Decimal, precioUnitario)
      .query(
        "UPDATE Productos SET imagen_url = @imagen_url, descripcion = @descripcion, nombre = @nombre, precioUnitario = @precioUnitario WHERE IdProducto = @id"
      );

    if (result.rowsAffected[0] === 0) return res.sendStatus(404);

    res.json({ imagen_url, descripcion, nombre, precioUnitario, id: req.params.id });
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};