--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-06-21 20:03:16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 16399)
-- Name: carrito; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carrito (
    idcarrito integer NOT NULL,
    idcliente integer NOT NULL,
    subtotal double precision NOT NULL,
    cantidadproductos integer NOT NULL,
    idmediodepago integer,
    direccionentrega character varying(150)
);


ALTER TABLE public.carrito OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16398)
-- Name: carrito_idcarrito_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carrito_idcarrito_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carrito_idcarrito_seq OWNER TO postgres;

--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 219
-- Name: carrito_idcarrito_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carrito_idcarrito_seq OWNED BY public.carrito.idcarrito;


--
-- TOC entry 222 (class 1259 OID 16406)
-- Name: carrito_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carrito_producto (
    idcarritoproducto integer NOT NULL,
    idcarrito integer NOT NULL,
    idproducto integer NOT NULL,
    cantidad integer NOT NULL,
    precio double precision NOT NULL
);


ALTER TABLE public.carrito_producto OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16405)
-- Name: carrito_producto_idcarritoproducto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carrito_producto_idcarritoproducto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carrito_producto_idcarritoproducto_seq OWNER TO postgres;

--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 221
-- Name: carrito_producto_idcarritoproducto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carrito_producto_idcarritoproducto_seq OWNED BY public.carrito_producto.idcarritoproducto;


--
-- TOC entry 218 (class 1259 OID 16390)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    idcliente integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    direccion character varying(150) NOT NULL,
    email character varying(150) NOT NULL,
    telefono character varying(50) NOT NULL,
    nombre_usuario character varying(50) NOT NULL,
    "contraseña" character varying(50) NOT NULL,
    fotodnifrente character varying(255) NOT NULL,
    fotodnidorso character varying(255) NOT NULL,
    fotopersonal character varying(255) NOT NULL
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16389)
-- Name: clientes_idcliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_idcliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_idcliente_seq OWNER TO postgres;

--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 217
-- Name: clientes_idcliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_idcliente_seq OWNED BY public.clientes.idcliente;


--
-- TOC entry 224 (class 1259 OID 16413)
-- Name: mediodepago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mediodepago (
    idmediodepago integer NOT NULL,
    tipo character varying(50) NOT NULL,
    datos character varying(255) NOT NULL,
    nrodecuenta character varying(50) NOT NULL,
    idcliente integer
);


ALTER TABLE public.mediodepago OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16412)
-- Name: mediodepago_idmediodepago_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mediodepago_idmediodepago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mediodepago_idmediodepago_seq OWNER TO postgres;

--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 223
-- Name: mediodepago_idmediodepago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mediodepago_idmediodepago_seq OWNED BY public.mediodepago.idmediodepago;


--
-- TOC entry 226 (class 1259 OID 16420)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    idproducto integer NOT NULL,
    imagen_url character varying(255) NOT NULL,
    nombre character varying(50) NOT NULL,
    preciounitario numeric(18,2) NOT NULL,
    descripcion text NOT NULL
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16419)
-- Name: productos_idproducto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_idproducto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productos_idproducto_seq OWNER TO postgres;

--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 225
-- Name: productos_idproducto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_idproducto_seq OWNED BY public.productos.idproducto;


--
-- TOC entry 228 (class 1259 OID 16429)
-- Name: reseniacliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reseniacliente (
    idreseniacliente integer NOT NULL,
    idsolicitud integer NOT NULL,
    idcliente integer NOT NULL,
    idsolver integer NOT NULL,
    puntuacion double precision NOT NULL,
    comentario character varying(255) NOT NULL
);


ALTER TABLE public.reseniacliente OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16428)
-- Name: reseniacliente_idreseniacliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reseniacliente_idreseniacliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reseniacliente_idreseniacliente_seq OWNER TO postgres;

--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 227
-- Name: reseniacliente_idreseniacliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reseniacliente_idreseniacliente_seq OWNED BY public.reseniacliente.idreseniacliente;


--
-- TOC entry 230 (class 1259 OID 16436)
-- Name: reseniasolver; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reseniasolver (
    idreseniasolver integer NOT NULL,
    idsolicitud integer NOT NULL,
    idsolver integer NOT NULL,
    puntuacion double precision NOT NULL,
    idcliente integer NOT NULL,
    comentario character varying(255) NOT NULL
);


ALTER TABLE public.reseniasolver OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16435)
-- Name: reseniasolver_idreseniasolver_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reseniasolver_idreseniasolver_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reseniasolver_idreseniasolver_seq OWNER TO postgres;

--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 229
-- Name: reseniasolver_idreseniasolver_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reseniasolver_idreseniasolver_seq OWNED BY public.reseniasolver.idreseniasolver;


--
-- TOC entry 232 (class 1259 OID 16443)
-- Name: servicios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicios (
    idservicio integer NOT NULL,
    nombre character varying(50) NOT NULL,
    icono_url character varying(255) NOT NULL
);


ALTER TABLE public.servicios OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16442)
-- Name: servicios_idservicio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servicios_idservicio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servicios_idservicio_seq OWNER TO postgres;

--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 231
-- Name: servicios_idservicio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servicios_idservicio_seq OWNED BY public.servicios.idservicio;


--
-- TOC entry 236 (class 1259 OID 16459)
-- Name: solicitudes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solicitudes (
    idsolicitud integer NOT NULL,
    idcliente integer NOT NULL,
    idsolver integer NOT NULL,
    idservicio integer NOT NULL,
    direccion_servicio character varying(150) NOT NULL,
    duracion_servicio numeric(18,2) NOT NULL,
    horainicial timestamp without time zone NOT NULL,
    horafinal timestamp without time zone NOT NULL,
    monto double precision NOT NULL,
    fechasolicitud date NOT NULL,
    fechaacordada date NOT NULL,
    fechaservicio date NOT NULL,
    idreseniasolver integer,
    idreseniacliente integer,
    idsubservicio integer NOT NULL
);


ALTER TABLE public.solicitudes OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16458)
-- Name: solicitudes_idsolicitud_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solicitudes_idsolicitud_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solicitudes_idsolicitud_seq OWNER TO postgres;

--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 235
-- Name: solicitudes_idsolicitud_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solicitudes_idsolicitud_seq OWNED BY public.solicitudes.idsolicitud;


--
-- TOC entry 234 (class 1259 OID 16450)
-- Name: solvers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solvers (
    idsolver integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    dni character varying(50) NOT NULL,
    nacionalidad character varying(50) NOT NULL,
    telefono character varying(50) NOT NULL,
    email character varying(150) NOT NULL,
    direccion character varying(150) NOT NULL,
    movilidad_propia boolean NOT NULL,
    tipo_vehiculo character varying(50),
    fotodnifrente character varying(255) NOT NULL,
    fotodnidorso character varying(255) NOT NULL,
    fotopersonal character varying(255) NOT NULL,
    certificadoantecedentesp character varying(50) NOT NULL,
    cuil_o_cuit character varying(50)
);


ALTER TABLE public.solvers OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16449)
-- Name: solvers_idsolver_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solvers_idsolver_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solvers_idsolver_seq OWNER TO postgres;

--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 233
-- Name: solvers_idsolver_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solvers_idsolver_seq OWNED BY public.solvers.idsolver;


--
-- TOC entry 238 (class 1259 OID 16466)
-- Name: solverservicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solverservicio (
    idsolverservicio integer NOT NULL,
    idservicio integer NOT NULL,
    idsolver integer NOT NULL,
    estudios boolean NOT NULL,
    certificadoestudios character varying(255),
    experiencia integer NOT NULL
);


ALTER TABLE public.solverservicio OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16465)
-- Name: solverservicio_idsolverservicio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solverservicio_idsolverservicio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solverservicio_idsolverservicio_seq OWNER TO postgres;

--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 237
-- Name: solverservicio_idsolverservicio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solverservicio_idsolverservicio_seq OWNED BY public.solverservicio.idsolverservicio;


--
-- TOC entry 240 (class 1259 OID 16473)
-- Name: subservicios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subservicios (
    idsubservicio integer NOT NULL,
    nombre character varying(50) NOT NULL,
    icono_url character varying(255) NOT NULL,
    idservicio integer NOT NULL,
    tarifabase double precision NOT NULL,
    precioportiempo double precision NOT NULL
);


ALTER TABLE public.subservicios OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16472)
-- Name: subservicios_idsubservicio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subservicios_idsubservicio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subservicios_idsubservicio_seq OWNER TO postgres;

--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 239
-- Name: subservicios_idsubservicio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subservicios_idsubservicio_seq OWNED BY public.subservicios.idsubservicio;


--
-- TOC entry 4751 (class 2604 OID 16402)
-- Name: carrito idcarrito; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito ALTER COLUMN idcarrito SET DEFAULT nextval('public.carrito_idcarrito_seq'::regclass);


--
-- TOC entry 4752 (class 2604 OID 16409)
-- Name: carrito_producto idcarritoproducto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito_producto ALTER COLUMN idcarritoproducto SET DEFAULT nextval('public.carrito_producto_idcarritoproducto_seq'::regclass);


--
-- TOC entry 4750 (class 2604 OID 16393)
-- Name: clientes idcliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN idcliente SET DEFAULT nextval('public.clientes_idcliente_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 16416)
-- Name: mediodepago idmediodepago; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mediodepago ALTER COLUMN idmediodepago SET DEFAULT nextval('public.mediodepago_idmediodepago_seq'::regclass);


--
-- TOC entry 4754 (class 2604 OID 16423)
-- Name: productos idproducto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN idproducto SET DEFAULT nextval('public.productos_idproducto_seq'::regclass);


--
-- TOC entry 4755 (class 2604 OID 16432)
-- Name: reseniacliente idreseniacliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reseniacliente ALTER COLUMN idreseniacliente SET DEFAULT nextval('public.reseniacliente_idreseniacliente_seq'::regclass);


--
-- TOC entry 4756 (class 2604 OID 16439)
-- Name: reseniasolver idreseniasolver; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reseniasolver ALTER COLUMN idreseniasolver SET DEFAULT nextval('public.reseniasolver_idreseniasolver_seq'::regclass);


--
-- TOC entry 4757 (class 2604 OID 16446)
-- Name: servicios idservicio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios ALTER COLUMN idservicio SET DEFAULT nextval('public.servicios_idservicio_seq'::regclass);


--
-- TOC entry 4759 (class 2604 OID 16462)
-- Name: solicitudes idsolicitud; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes ALTER COLUMN idsolicitud SET DEFAULT nextval('public.solicitudes_idsolicitud_seq'::regclass);


--
-- TOC entry 4758 (class 2604 OID 16453)
-- Name: solvers idsolver; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solvers ALTER COLUMN idsolver SET DEFAULT nextval('public.solvers_idsolver_seq'::regclass);


--
-- TOC entry 4760 (class 2604 OID 16469)
-- Name: solverservicio idsolverservicio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solverservicio ALTER COLUMN idsolverservicio SET DEFAULT nextval('public.solverservicio_idsolverservicio_seq'::regclass);


--
-- TOC entry 4761 (class 2604 OID 16476)
-- Name: subservicios idsubservicio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subservicios ALTER COLUMN idsubservicio SET DEFAULT nextval('public.subservicios_idsubservicio_seq'::regclass);


--
-- TOC entry 4954 (class 0 OID 16399)
-- Dependencies: 220
-- Data for Name: carrito; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4956 (class 0 OID 16406)
-- Dependencies: 222
-- Data for Name: carrito_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4952 (class 0 OID 16390)
-- Dependencies: 218
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clientes VALUES (1, 'Uriel', 'Smucler', 'Av Diaz Velez 5469 1a', 'urismu07@gmail.com', '+54 9 11 23895698', 'UriSmu', 'Popi2025', 'wdosdwu', 'ubcuscbusbcs', 'BCUSBCUSBCSU');


--
-- TOC entry 4958 (class 0 OID 16413)
-- Dependencies: 224
-- Data for Name: mediodepago; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4960 (class 0 OID 16420)
-- Dependencies: 226
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.productos VALUES (1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpHYJhpMJOLA_DTGVAIFAKrLGP8cQGq_m3BQ&s', 'Quitamanchas Vanish', 10499.99, 'Quitamanchas triple acción en polvo para la ropa. 450gr');
INSERT INTO public.productos VALUES (2, 'https://www.skip.com.ar/images/h0nadbhvm6m4/4p6zJSQisSPh13wT8u3y8P/3dfe38135a7d7b7e862b5f92655f8800/SmFib19uX0xpcXVpZG9fU2tpcF9CSU8tRU5aSU1BU19wYXJhX0RpbHVpci5wbmc/1080w-1080h/jab%C3%B3n-l%C3%ADquido-skip-fibercare-para-diluir-(rinde-3l).jpg', 'Jabón para diluir Skip', 8999.99, 'Jabón líquido para la ropa para diluir x500ml. Rinde 3lts.');
INSERT INTO public.productos VALUES (3, 'https://carrefourar.vtexassets.com/arquivos/ids/166397-1200-auto?v=637467726867770000&width=1200&height=auto&aspect=true', 'Escoba Virulana', 5240.00, 'Escoba clásica marca Virulana x1u');


--
-- TOC entry 4962 (class 0 OID 16429)
-- Dependencies: 228
-- Data for Name: reseniacliente; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4964 (class 0 OID 16436)
-- Dependencies: 230
-- Data for Name: reseniasolver; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4966 (class 0 OID 16443)
-- Dependencies: 232
-- Data for Name: servicios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4970 (class 0 OID 16459)
-- Dependencies: 236
-- Data for Name: solicitudes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4968 (class 0 OID 16450)
-- Dependencies: 234
-- Data for Name: solvers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4972 (class 0 OID 16466)
-- Dependencies: 238
-- Data for Name: solverservicio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4974 (class 0 OID 16473)
-- Dependencies: 240
-- Data for Name: subservicios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 219
-- Name: carrito_idcarrito_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carrito_idcarrito_seq', 1, false);


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 221
-- Name: carrito_producto_idcarritoproducto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carrito_producto_idcarritoproducto_seq', 1, false);


--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 217
-- Name: clientes_idcliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_idcliente_seq', 1, false);


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 223
-- Name: mediodepago_idmediodepago_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mediodepago_idmediodepago_seq', 1, false);


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 225
-- Name: productos_idproducto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_idproducto_seq', 3, true);


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 227
-- Name: reseniacliente_idreseniacliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reseniacliente_idreseniacliente_seq', 1, false);


--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 229
-- Name: reseniasolver_idreseniasolver_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reseniasolver_idreseniasolver_seq', 1, false);


--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 231
-- Name: servicios_idservicio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servicios_idservicio_seq', 1, false);


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 235
-- Name: solicitudes_idsolicitud_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solicitudes_idsolicitud_seq', 1, false);


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 233
-- Name: solvers_idsolver_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solvers_idsolver_seq', 1, false);


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 237
-- Name: solverservicio_idsolverservicio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solverservicio_idsolverservicio_seq', 1, false);


--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 239
-- Name: subservicios_idsubservicio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subservicios_idsubservicio_seq', 1, false);


--
-- TOC entry 4765 (class 2606 OID 16404)
-- Name: carrito carrito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_pkey PRIMARY KEY (idcarrito);


--
-- TOC entry 4767 (class 2606 OID 16411)
-- Name: carrito_producto carrito_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito_producto
    ADD CONSTRAINT carrito_producto_pkey PRIMARY KEY (idcarritoproducto);


--
-- TOC entry 4763 (class 2606 OID 16397)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (idcliente);


--
-- TOC entry 4769 (class 2606 OID 16418)
-- Name: mediodepago mediodepago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mediodepago
    ADD CONSTRAINT mediodepago_pkey PRIMARY KEY (idmediodepago);


--
-- TOC entry 4771 (class 2606 OID 16427)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (idproducto);


--
-- TOC entry 4773 (class 2606 OID 16434)
-- Name: reseniacliente reseniacliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reseniacliente
    ADD CONSTRAINT reseniacliente_pkey PRIMARY KEY (idreseniacliente);


--
-- TOC entry 4775 (class 2606 OID 16441)
-- Name: reseniasolver reseniasolver_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reseniasolver
    ADD CONSTRAINT reseniasolver_pkey PRIMARY KEY (idreseniasolver);


--
-- TOC entry 4777 (class 2606 OID 16448)
-- Name: servicios servicios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios
    ADD CONSTRAINT servicios_pkey PRIMARY KEY (idservicio);


--
-- TOC entry 4781 (class 2606 OID 16464)
-- Name: solicitudes solicitudes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes
    ADD CONSTRAINT solicitudes_pkey PRIMARY KEY (idsolicitud);


--
-- TOC entry 4779 (class 2606 OID 16457)
-- Name: solvers solvers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solvers
    ADD CONSTRAINT solvers_pkey PRIMARY KEY (idsolver);


--
-- TOC entry 4783 (class 2606 OID 16471)
-- Name: solverservicio solverservicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solverservicio
    ADD CONSTRAINT solverservicio_pkey PRIMARY KEY (idsolverservicio);


--
-- TOC entry 4785 (class 2606 OID 16478)
-- Name: subservicios subservicios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subservicios
    ADD CONSTRAINT subservicios_pkey PRIMARY KEY (idsubservicio);


--
-- TOC entry 4786 (class 2606 OID 16479)
-- Name: carrito fk_carrito_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT fk_carrito_cliente FOREIGN KEY (idcliente) REFERENCES public.clientes(idcliente) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4787 (class 2606 OID 16484)
-- Name: carrito fk_carrito_mediodepago; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT fk_carrito_mediodepago FOREIGN KEY (idmediodepago) REFERENCES public.mediodepago(idmediodepago);


--
-- TOC entry 4788 (class 2606 OID 16489)
-- Name: carrito_producto fk_carrito_producto_carrito; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito_producto
    ADD CONSTRAINT fk_carrito_producto_carrito FOREIGN KEY (idcarrito) REFERENCES public.carrito(idcarrito) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4789 (class 2606 OID 16494)
-- Name: carrito_producto fk_carrito_producto_productos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito_producto
    ADD CONSTRAINT fk_carrito_producto_productos FOREIGN KEY (idproducto) REFERENCES public.productos(idproducto) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4790 (class 2606 OID 16499)
-- Name: mediodepago fk_mediodepago_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mediodepago
    ADD CONSTRAINT fk_mediodepago_cliente FOREIGN KEY (idcliente) REFERENCES public.clientes(idcliente) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4791 (class 2606 OID 16504)
-- Name: reseniacliente fk_reseniacliente_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reseniacliente
    ADD CONSTRAINT fk_reseniacliente_cliente FOREIGN KEY (idcliente) REFERENCES public.clientes(idcliente) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4792 (class 2606 OID 16509)
-- Name: reseniacliente fk_reseniacliente_solicitudes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reseniacliente
    ADD CONSTRAINT fk_reseniacliente_solicitudes FOREIGN KEY (idsolicitud) REFERENCES public.solicitudes(idsolicitud);


--
-- TOC entry 4793 (class 2606 OID 16514)
-- Name: reseniacliente fk_reseniacliente_solvers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reseniacliente
    ADD CONSTRAINT fk_reseniacliente_solvers FOREIGN KEY (idsolver) REFERENCES public.solvers(idsolver) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4794 (class 2606 OID 16519)
-- Name: reseniasolver fk_reseniasolver_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reseniasolver
    ADD CONSTRAINT fk_reseniasolver_cliente FOREIGN KEY (idcliente) REFERENCES public.clientes(idcliente) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4795 (class 2606 OID 16524)
-- Name: reseniasolver fk_reseniasolver_solicitudes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reseniasolver
    ADD CONSTRAINT fk_reseniasolver_solicitudes FOREIGN KEY (idsolicitud) REFERENCES public.solicitudes(idsolicitud);


--
-- TOC entry 4796 (class 2606 OID 16529)
-- Name: reseniasolver fk_reseniasolver_solvers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reseniasolver
    ADD CONSTRAINT fk_reseniasolver_solvers FOREIGN KEY (idsolver) REFERENCES public.solvers(idsolver) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4797 (class 2606 OID 16534)
-- Name: solicitudes fk_solicitudes_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes
    ADD CONSTRAINT fk_solicitudes_cliente FOREIGN KEY (idcliente) REFERENCES public.clientes(idcliente) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4798 (class 2606 OID 16539)
-- Name: solicitudes fk_solicitudes_reseniacliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes
    ADD CONSTRAINT fk_solicitudes_reseniacliente FOREIGN KEY (idreseniacliente) REFERENCES public.reseniacliente(idreseniacliente);


--
-- TOC entry 4799 (class 2606 OID 16544)
-- Name: solicitudes fk_solicitudes_reseniasolver; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes
    ADD CONSTRAINT fk_solicitudes_reseniasolver FOREIGN KEY (idreseniasolver) REFERENCES public.reseniasolver(idreseniasolver);


--
-- TOC entry 4800 (class 2606 OID 16549)
-- Name: solicitudes fk_solicitudes_servicio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes
    ADD CONSTRAINT fk_solicitudes_servicio FOREIGN KEY (idservicio) REFERENCES public.servicios(idservicio) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4801 (class 2606 OID 16554)
-- Name: solicitudes fk_solicitudes_solver; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes
    ADD CONSTRAINT fk_solicitudes_solver FOREIGN KEY (idsolver) REFERENCES public.solvers(idsolver) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4802 (class 2606 OID 16559)
-- Name: solicitudes fk_solicitudes_subservicio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes
    ADD CONSTRAINT fk_solicitudes_subservicio FOREIGN KEY (idsubservicio) REFERENCES public.subservicios(idsubservicio) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4803 (class 2606 OID 16564)
-- Name: solverservicio fk_solverservicio_servicio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solverservicio
    ADD CONSTRAINT fk_solverservicio_servicio FOREIGN KEY (idservicio) REFERENCES public.servicios(idservicio) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4804 (class 2606 OID 16569)
-- Name: solverservicio fk_solverservicio_solver; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solverservicio
    ADD CONSTRAINT fk_solverservicio_solver FOREIGN KEY (idsolver) REFERENCES public.solvers(idsolver) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4805 (class 2606 OID 16574)
-- Name: subservicios fk_subservicio_servicio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subservicios
    ADD CONSTRAINT fk_subservicio_servicio FOREIGN KEY (idservicio) REFERENCES public.servicios(idservicio) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2025-06-21 20:03:16

--
-- PostgreSQL database dump complete
--

