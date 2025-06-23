import { Router } from "express";
import {
  getClientes,
  createNewClientes,
  getProductById,
  deleteProductById,
  getTotalProducts,
  updateProductById,
} from "../controllers/clientes.controllers.js";

const router = Router();

router.get("/clientes", getClientes);

router.post("/clientes", createNewClientes);

router.get("/productos/count", getTotalProducts);

router.get("/productos/:id", getProductById);

router.delete("/productos/:id", deleteProductById);

router.put("/productos/:id", updateProductById);

router.use((req, res) => {
    res
      .status(404)
      .send('<img src="https://http.cat/404.jpg" alt="404 Not Found" />');
  });


export default router;