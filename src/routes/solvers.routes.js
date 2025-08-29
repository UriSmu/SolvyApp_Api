import { Router } from "express";
import {
  getSolvers,
  createNewSolvers,
  getSolverByData,
  getActividadesBySolver,
  getSolverById,
  resetPasswordSolver,
  addServicioToSolver, // <-- nuevo
  addSubservicioToSolverServicio, // <-- nuevo
  getServiciosBySolver, // <-- nuevo
  getSubserviciosBySolverServicio, // <-- nuevo
  getSolverServicioBySolverAndServicio // <-- nuevo
} from "../controllers/solvers.controllers.js";

import { verifyToken } from "../middlewares/auth.js";

const router = Router();

router.get("/solvers", verifyToken, getSolvers);

router.post("/solvers", createNewSolvers);

router.get("/solvers/:data/:password", getSolverByData);

router.get("/actividades/:id", verifyToken, getActividadesBySolver);

router.get("/solver/:id", verifyToken, getSolverById)

router.put("/solvers/reset-password", verifyToken, resetPasswordSolver);

router.post("/solverservicio", verifyToken, addServicioToSolver);

router.post("/solverservicio/subservicio", verifyToken, addSubservicioToSolverServicio);

router.get("/solverservicio/:idsolver", verifyToken, getServiciosBySolver);

router.get("/solverservicio/subservicio/:idsolverservicio", verifyToken, getSubserviciosBySolverServicio);

router.get("/solverservicio/:idsolver/:idservicio", verifyToken, getSolverServicioBySolverAndServicio);

router.use((req, res) => {
    res
      .status(404)
      .send('<img src="https://http.cat/404.jpg" alt="404 Not Found" />');
  });


export default router;