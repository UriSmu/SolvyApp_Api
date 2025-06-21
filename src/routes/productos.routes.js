import { Router } from "express";
import {
  getProducts,
  createNewProduct,
  getProductById,
  deleteProductById,
  getTotalProducts,
  updateProductById,
} from "../controllers/productos.controllers.js";

const router = Router();

router.get("/productos", getProducts);

router.post("/productos", createNewProduct);

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