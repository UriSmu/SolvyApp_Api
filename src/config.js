import { config } from "dotenv";
config();

export const PORT = process.env.PORT || 1433;
export const DB_SERVER = "PC-URI\\SQLEXPRESS";
export const DB_DATABASE = "Solvy";
export const DB_USER = "solvy_user";
export const DB_PASSWORD = "Solvy2025";