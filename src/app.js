import express from "express";
import cors from "cors";
import morgan from "morgan";

import productRoutes from "./routes/productos.routes.js";
import clientRoutes from "./routes/clientes.routes.js";
import serviciosRoutes from "./routes/servicios.routes.js";
import solverRoutes from "./routes/solvers.routes.js"
import reseniasSolverRoutes from "./routes/resenias-solver.routes.js";
import logosAppRoutes from "./routes/logos-app.routes.js";

import { verifyToken } from "./middlewares/auth.js";

const app = express();

app.use(cors());
app.use(morgan("dev"));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

app.use("/prod", verifyToken, productRoutes);
app.use("/cli", clientRoutes);
app.use("/ser", verifyToken, serviciosRoutes);
app.use("/sol", solverRoutes);
app.use("/ressol", verifyToken, reseniasSolverRoutes);
app.use("/logos", logosAppRoutes);

app.use((req, res, next) => {
    res.status(404).send('Asegúrese de usar https://solvy-app-api.vercel.app/[directorio]/[solicitud]');
});

export default app;