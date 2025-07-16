import { getConnection } from "../database/connection.js";

export const getLogos = async (req, res) => {
    try {
        const pool = getConnection();
        const result = await pool.query("SELECT * FROM logos_app");
        res.json(result.rows);
    } catch (error) {
        res.status(500).send(error.message);
    }
};

export const getLogosBySubservicio = async (req, res) => {
    try {
        const pool = getConnection();
        const result = await pool.query("SELECT * FROM logos_app WHERE idsubservicio = $1", [req.params.id]);
        res.json(result.rows);
    } 
    catch (error) {
        res.status(500).send(error.message);
    }
};

export const getLogosByServicio = async (req, res) => {
    try {
        const pool = getConnection();
        const result = await pool.query("SELECT * FROM logos_app WHERE idservicio = $1", [req.params.id]);
        res.json(result.rows);
    } 
    catch (error) {
        res.status(500).send(error.message);
    }
};