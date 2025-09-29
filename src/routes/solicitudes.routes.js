import { Router } from "express";
import {
  createSolicitud,
  asignarSolver,
  iniciarServicio,
  finalizarServicio,
  getSolicitudesBySolver,
  getSolicitudesByCliente,
  getCodigoConfirmacion,
  getCodigoInicio,
  agregarProductos
} from "../controllers/solicitudes.controllers.js";

const router = Router();

// 1. Crear solicitud
router.post("/nuevasolicitud", createSolicitud);

// 2. Asignar solver y código de confirmación
router.put("/:idsolicitud/asignar", asignarSolver);

// 3. Iniciar servicio
router.put("/:idsolicitud/iniciar", iniciarServicio);

// 4. Finalizar servicio
router.put("/:idsolicitud/finalizar", finalizarServicio);

// 5. Solicitudes por solver
router.get("/solver/:idsolver", getSolicitudesBySolver);

// 6. Solicitudes por cliente
router.get("/cliente/:idcliente", getSolicitudesByCliente);

router.get("/codigo/:idsolicitud", getCodigoConfirmacion);

router.get("/iniciar/:idsolicitud", getCodigoInicio);

router.put("/agregar-productos/:idsolicitud", agregarProductos);

router.use((req, res) => {
  res.status(404).send('<img src="https://http.cat/404.jpg" alt="404 Not Found" />');
});

export default router;