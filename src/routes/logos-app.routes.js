import { Router } from "express";
import {
  getLogos,
  getLogosByServicio,
  getLogosBySubservicio,
  getLogoById
} from "../controllers/logos-app.controllers.js";

const router = Router();

router.get("/todos", getLogos);
router.get("/serv/:id", getLogosByServicio);
router.get("/subserv/:id", getLogosBySubservicio);
router.get("/logo/:id", getLogoById);

router.use((req, res) => {
    res
      .status(404)
      .send('<img src="https://http.cat/404.jpg" alt="404 Not Found" />');
  });


export default router;