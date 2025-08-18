import { Router } from "express";
import {
  getClientes,
  createNewClientes,
  getClienteByData,
  getActividadesByCliente,
  resetPasswordCliente
} from "../controllers/clientes.controllers.js";
import { verifyToken } from "../middlewares/auth.js";

const router = Router();

router.get("/clientes", verifyToken, getClientes); // protegida
router.post("/clientes", createNewClientes); // pública (registro)
router.get("/clientes/:data/:password", getClienteByData); // pública (login)
router.get("/actividades/:id", verifyToken, getActividadesByCliente); // protegida
router.put("/reset-password", resetPasswordCliente); // pública (reset de contraseña)


router.use((req, res) => {
    res
      .status(404)
      .send('<img src="https://http.cat/404.jpg" alt="404 Not Found" />');
  });


export default router;