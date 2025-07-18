import { Router } from "express";
import {
  getServicios,
  getSubserviciosByServicio,
  getPreciosSubservicio,
  getNombreSubServicio,
  getSolversPorServicio
} from "../controllers/servicios.controllers.js";
import { verifyToken } from "../middlewares/auth.js";

const router = Router();

// 1. Traer todos los servicios
router.get("/servicios", getServicios);

// 2. Traer todos los subservicios de un servicio
router.get("/:idservicio/subservicios", getSubserviciosByServicio);

// 3. Buscar precio base y por tiempo de un subservicio
router.get("/subservicio/:idsubservicio/precios", getPreciosSubservicio);

router.get("/nombresubservicio/:id", getNombreSubServicio);

router.get("/solvers/:id", verifyToken, getSolversPorServicio);

export default router;