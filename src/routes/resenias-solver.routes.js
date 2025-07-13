import { Router } from "express";
import {
  createNewResenia
} from "../controllers/resenias-solver.controllers.js";

const router = Router();

router.post("/resenia", createNewResenia);

export default router;