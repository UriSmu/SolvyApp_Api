import { config } from "dotenv";
config();

// config.js
export const DB_SERVER = process.env.DB_SERVER;
export const DB_DATABASE = process.env.DB_DATABASE;
export const DB_USER = process.env.DB_USER;
export const DB_PASSWORD = process.env.DB_PASSWORD;
export const PORT = process.env.PORT || 5432;