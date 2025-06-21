import sql from "mssql";
import { DB_SERVER, PORT, DB_DATABASE, DB_USER, DB_PASSWORD } from "../config.js";

export const dbSettings = {
    server: DB_SERVER,
    port: 1433, // Especifica el puerto aquí
    database: DB_DATABASE,
    options: {
        encrypt: false,
        trustServerCertificate: true,
    },
    authentication: {
        type: "default",
        options: {
            userName: DB_USER,
            password: DB_PASSWORD,
        },
    },
};

export const getConnection = async () => {
    try {
        const pool = await sql.connect(dbSettings);
        return pool;
    } catch (error) {
        console.error("Database connection failed:", error.message);
        throw error;
    }
};

export { sql };