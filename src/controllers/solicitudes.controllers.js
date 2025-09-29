import { getConnection } from "../database/connection.js";

// 1. Crear una solicitud
export const createSolicitud = async (req, res) => {
  const {
    idsubservicio,
    idcliente,
    direccion_servicio,
    fechasolicitud,
    horainicial,
    duracion_servicio,
    monto
  } = req.body;

  if (
    !idsubservicio || !idcliente || !direccion_servicio ||
    !fechasolicitud || !horainicial || !duracion_servicio || !monto
  ) {
    return res.status(400).json({ msg: "Faltan campos obligatorios" });
  }

  try {
    const pool = getConnection();
    const result = await pool.query(
      `INSERT INTO solicitudes 
      (idsubservicio, idcliente, direccion_servicio, fechasolicitud, horainicial, duracion_servicio, monto) 
      VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *`,
      [idsubservicio, idcliente, direccion_servicio, fechasolicitud, horainicial, duracion_servicio, monto]
    );
    res.json(result.rows[0]);
  } catch (error) {
    console.error('Error al crear solicitud:', error); // <-- Agrega este log
    res.status(500).send(error.message);
  }
};

// 2. Update: asignar solver, fecha acordada y código de confirmación
export const asignarSolver = async (req, res) => {
  const { idsolicitud } = req.params;
  const { idsolver, fechaacordada } = req.body;
  if (!idsolicitud || !idsolver || !fechaacordada) {
    return res.status(400).json({ msg: "Faltan campos obligatorios" });
  }
  // Generar código de confirmación de 4 dígitos
  const codigo_confirmacion = Math.floor(1000 + Math.random() * 9000).toString();
  try {
    const pool = getConnection();
    const result = await pool.query(
      `UPDATE solicitudes SET idsolver = $1, fechaacordada = $2, codigo_confirmacion = $3 WHERE idsolicitud = $4 RETURNING *`,
      [idsolver, fechaacordada, codigo_confirmacion, idsolicitud]
    );
    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

// 3. Update: iniciar servicio (hora inicial y fecha servicio)
export const iniciarServicio = async (req, res) => {
  const { idsolicitud } = req.params;
  const fecha_servicio = new Date().toISOString().slice(0, 10); // YYYY-MM-DD
  const hora_inicial = new Date();
  try {
    const pool = getConnection();
    const result = await pool.query(
      `UPDATE solicitudes SET horainicial = $1, fechaservicio = $2 WHERE idsolicitud = $3 RETURNING *`,
      [hora_inicial, fecha_servicio, idsolicitud]
    );
    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

// 4. Finalizar servicio: guardar descarga y hora final
export const finalizarServicio = async (req, res) => {
  const { idsolicitud } = req.params;
  const { parte_trabajo } = req.body;
  const { hora_final } = req.body;
  try {
    const pool = getConnection();
    const result = await pool.query(
      `UPDATE solicitudes SET parte_trabajo = $1, horafinal = $2 WHERE idsolicitud = $3 RETURNING *`,
      [parte_trabajo, hora_final, idsolicitud]
    );
    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

// 5. Traer todas las solicitudes de un solver
export const getSolicitudesBySolver = async (req, res) => {
  const { idsolver } = req.params;
  try {
    const pool = getConnection();
    const result = await pool.query(
      `SELECT * FROM solicitudes WHERE idsolver = $1`,
      [idsolver]
    );
    res.json(result.rows);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

// 6. Traer todas las solicitudes de un cliente
export const getSolicitudesByCliente = async (req, res) => {
  const { idcliente } = req.params;
  try {
    const pool = getConnection();
    const result = await pool.query(
      `SELECT * FROM solicitudes WHERE idcliente = $1`,
      [idcliente]
    );
    res.json(result.rows);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

// 7. Obtener código de confirmación de una solicitud
export const getCodigoConfirmacion = async (req, res) => {
  const { idsolicitud } = req.params;
  try {
    const pool = getConnection();
    const result = await pool.query(
      `SELECT codigo_confirmacion FROM solicitudes WHERE idsolicitud = $1`,
      [idsolicitud]
    );
    res.json(result.rows);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

// 8. Obtener código de inicio de una solicitud
export const getCodigoInicio = async (req, res) => {
  const { idsolicitud } = req.params;
  try {
    const pool = getConnection();
    const result = await pool.query(
      `SELECT codigo_inicial FROM solicitudes WHERE idsolicitud = $1`,
      [idsolicitud]
    );
    res.json(result.rows);
  } catch (error) {
    res.status(500).send(error.message);
  }
};