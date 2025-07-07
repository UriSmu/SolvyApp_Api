import { Router } from "express";
import {
  getServicios,
  getSubserviciosByServicio,
  getPreciosSubservicio,
} from "../controllers/servicios.controllers.js";

const router = Router();

// 1. Traer todos los servicios
router.get("/", getServicios);

// 2. Traer todos los subservicios de un servicio
router.get("/:idservicio/subservicios", getSubserviciosByServicio);

// 3. Buscar precio base y por tiempo de un subservicio
router.get("/subservicio/:idsubservicio/precios", getPreciosSubservicio);

export default router;