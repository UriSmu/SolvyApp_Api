import { getConnection } from "../database/connection.js";

export const createNewResenia = async (req, res) => {
  const {
    idsolicitud,
    idsolver,
    puntuacion,
    idcliente,
    comentario
  } = req.body;

  if (
    idsolver == null ||
    puntuacion == null ||
    idcliente == null ||
    comentario == null
  ) {
    return res.status(400).json({ msg: "Bad Request. Please fill all fields" });
  }

  try {
    const pool = getConnection();
    const result = await pool.query(
      "INSERT INTO Reseniasolver (idsolicitud, idsolver, puntuacion, idcliente, comentario) VALUES ($1, $2, $3, $4, $5) RETURNING *",
      [idsolicitud, idsolver, puntuacion, idcliente, comentario]
    );
    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).send(error.message);
  }
};