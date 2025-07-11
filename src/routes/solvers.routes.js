import { Router } from "express";
import {
  getSolvers,
  createNewSolvers,
  getSolverByData,
  getActividadesBySolver
} from "../controllers/solvers.controllers.js";

const router = Router();

router.get("/solvers", getSolvers);

router.post("/solvers", createNewSolvers);

router.get("/solvers/:data/:password", getSolverByData);

router.get("/actividades/:id", getActividadesBySolver);

router.use((req, res) => {
    res
      .status(404)
      .send('<img src="https://http.cat/404.jpg" alt="404 Not Found" />');
  });


export default router;