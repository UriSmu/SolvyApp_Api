import express from "express";
import cors from "cors";
import morgan from "morgan";

import productRoutes from "./routes/productos.routes.js";
import clientRoutes from "./routes/clientes.routes.js";
import serviciosRoutes from "./routes/servicios.routes.js";
import solverRoutes from "./routes/solvers.routes.js"

const app = express();

app.use(cors());
app.use(morgan("dev"));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

app.use("/prod", productRoutes);
app.use("/cli", clientRoutes);
app.use("/ser", serviciosRoutes);
app.use("/sol", solverRoutes);

app.use((req, res, next) => {
    res.status(404).send('Asegúrese de usar https://solvy-app-api.vercel.app/[directorio]/[solicitud]');
});

export default app;