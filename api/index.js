import app from '../src/app.js';
import { createServer } from 'http';

export default function handler(req, res) {
  // Vercel ejecuta esta función por cada request
  app(req, res);
}