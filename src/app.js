import express from "express";
import cors from "cors";
import morgan from "morgan";

import productRoutes from "./routes/productos.routes.js";

const app = express();

app.use(cors());
app.use(morgan("dev"));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

app.use("/api", productRoutes);

app.use((req, res, next) => {
    res.status(404).send('Asegúrese de usar localhost..../api/');
});

export default app;