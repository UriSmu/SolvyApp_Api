import app from "./src/app.js";
import { createServer } from "http";
import { parse } from "url";

export default function handler(req, res) {
  const server = createServer(app);
  server.emit("request", req, res);
}