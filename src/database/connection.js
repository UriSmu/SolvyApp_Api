import pkg from "pg";
const { Pool } = pkg;
import { DB_SERVER, PORT, DB_DATABASE, DB_USER, DB_PASSWORD } from "../config.js";

export const dbSettings = {
    host: DB_SERVER,
    port: PORT,
    database: DB_DATABASE,
    user: DB_USER,
    password: DB_PASSWORD,
    ssl: { rejectUnauthorized: false }, // Si tu proveedor lo requiere
};


const pool = new Pool(dbSettings);

export const getConnection = () => pool;

export { pkg as pg };