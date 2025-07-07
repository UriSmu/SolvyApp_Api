import { getConnection } from "../database/connection.js";

// 1. Traer todos los servicios
export const getServicios = async (req, res) => {
  try {
    const pool = getConnection();
    const result = await pool.query("SELECT * FROM servicios");
    res.json(result.rows);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

// 2. Traer todos los subservicios de un servicio
export const getSubserviciosByServicio = async (req, res) => {
  try {
    const pool = getConnection();
    const { idservicio } = req.params;
    const result = await pool.query(
      "SELECT * FROM subservicios WHERE idservicio = $1",
      [idservicio]
    );
    res.json(result.rows);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

// 3. Buscar precio base y por tiempo de un subservicio
export const getPreciosSubservicio = async (req, res) => {
  try {
    const pool = getConnection();
    const { idsubservicio } = req.params;
    const result = await pool.query(
      "SELECT tarifabase, precioportiempo FROM subservicios WHERE idsubservicio = $1",
      [idsubservicio]
    );
    if (result.rows.length === 0) return res.sendStatus(404);
    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).send(error.message);
  }
};