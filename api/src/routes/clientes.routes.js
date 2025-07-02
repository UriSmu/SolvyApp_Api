import { Router } from "express";
import {
  getClientes,
  createNewClientes,
  getClienteByData
} from "../controllers/clientes.controllers.js";

const router = Router();

router.get("/clientes", getClientes);

router.post("/clientes", createNewClientes);

router.get("/clientes/:data/:password", getClienteByData);

router.use((req, res) => {
    res
      .status(404)
      .send('<img src="https://http.cat/404.jpg" alt="404 Not Found" />');
  });


export default router;