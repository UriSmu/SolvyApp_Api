import { Router } from "express";
import {
  getClientes,
  createNewClientes,
} from "../controllers/clientes.controllers.js";

const router = Router();

router.get("/clientes", getClientes);

router.post("/clientes", createNewClientes);

router.use((req, res) => {
    res
      .status(404)
      .send('<img src="https://http.cat/404.jpg" alt="404 Not Found" />');
  });


export default router;