
ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
ALTER TABLE ONLY public.tutor DROP CONSTRAINT tutor_pkey;
ALTER TABLE ONLY public.sesiones DROP CONSTRAINT sesiones_pkey;
ALTER TABLE ONLY public.reporte DROP CONSTRAINT reporte_pkey;
ALTER TABLE ONLY public.profesor DROP CONSTRAINT profesor_pkey;
ALTER TABLE ONLY public.post DROP CONSTRAINT post_pkey;
ALTER TABLE ONLY public.listaalumnos DROP CONSTRAINT listaalumnos_pkey;
ALTER TABLE ONLY public.grupo DROP CONSTRAINT grupo_pkey;
ALTER TABLE ONLY public.escuela DROP CONSTRAINT escuela_pkey;
ALTER TABLE ONLY public.emergencia DROP CONSTRAINT emergencia_pkey;
ALTER TABLE ONLY public.chatconfig DROP CONSTRAINT chatconfig_pkey;
ALTER TABLE ONLY public.alumno DROP CONSTRAINT alumno_pkey;
ALTER TABLE ONLY public.administrador DROP CONSTRAINT administrador_pkey;
ALTER TABLE public.usuario ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.tutor ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.sesiones ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.reporte ALTER COLUMN idreporte DROP DEFAULT;
ALTER TABLE public.profesor ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.post ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.listaalumnos ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.grupo ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.escuela ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.emergencia ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.chatconfig ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.alumno ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.administrador ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.usuario_id_seq;
DROP TABLE public.usuario;
DROP SEQUENCE public.tutor_id_seq;
DROP TABLE public.tutor;
DROP SEQUENCE public.sesion_id_seq;
DROP TABLE public.sesiones;
DROP SEQUENCE public.reporte_idreporte_seq;
DROP TABLE public.reporte;
DROP SEQUENCE public.profesor_id_seq;
DROP TABLE public.profesor;
DROP SEQUENCE public.post_id_seq;
DROP TABLE public.post;
DROP SEQUENCE public.listaalumnos_id_seq;
DROP TABLE public.listaalumnos;
DROP SEQUENCE public.grupo_id_seq;
DROP TABLE public.grupo;
DROP SEQUENCE public.escuela_id_seq;
DROP TABLE public.escuela;
DROP SEQUENCE public.emergencia_id_seq;
DROP TABLE public.emergencia;
DROP SEQUENCE public.chatconfig_id_seq;
DROP TABLE public.chatconfig;
DROP SEQUENCE public.alumno_id_seq;
DROP TABLE public.alumno;
DROP SEQUENCE public.administrador_id_seq;
DROP TABLE public.administrador;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: administrador; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.administrador (
    id integer NOT NULL,
    idusuario integer,
    idescuela character varying(4),
    escuelaregistrada boolean DEFAULT false
);


ALTER TABLE public.administrador OWNER TO admin;

--
-- Name: administrador_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.administrador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.administrador_id_seq OWNER TO admin;

--
-- Name: administrador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.administrador_id_seq OWNED BY public.administrador.id;


--
-- Name: alumno; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.alumno (
    id integer NOT NULL,
    idusuario integer,
    codigo character varying(4)
);


ALTER TABLE public.alumno OWNER TO admin;

--
-- Name: alumno_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.alumno_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alumno_id_seq OWNER TO admin;

--
-- Name: alumno_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.alumno_id_seq OWNED BY public.alumno.id;


--
-- Name: chatconfig; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.chatconfig (
    id integer NOT NULL,
    idescuela integer,
    alumno_alumno boolean DEFAULT true,
    alumno_profesor boolean DEFAULT true,
    profesor_profesor boolean DEFAULT true,
    profesor_tutor boolean DEFAULT true,
    profesor_admin boolean DEFAULT true,
    galumno_profesor boolean DEFAULT true
);


ALTER TABLE public.chatconfig OWNER TO admin;

--
-- Name: chatconfig_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.chatconfig_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chatconfig_id_seq OWNER TO admin;

--
-- Name: chatconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.chatconfig_id_seq OWNED BY public.chatconfig.id;


--
-- Name: emergencia; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.emergencia (
    id integer NOT NULL,
    asunto character varying(200),
    descripcion character varying(500),
    lugar character varying(500),
    fecha timestamp without time zone,
    idescuela integer,
    dentro boolean,
    latitude character varying(200),
    longitude character varying(200)
);


ALTER TABLE public.emergencia OWNER TO admin;

--
-- Name: emergencia_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.emergencia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.emergencia_id_seq OWNER TO admin;

--
-- Name: emergencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.emergencia_id_seq OWNED BY public.emergencia.id;


--
-- Name: escuela; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.escuela (
    id integer NOT NULL,
    nombre character varying(100),
    colonia character varying(100),
    calle character varying(100),
    numexterior character varying(10),
    numiterior character varying(5),
    codigopostal character varying(5),
    sitioweb character varying(100),
    codigo character varying(4),
    validada boolean DEFAULT false,
    manualpdf bytea,
    mapa bytea
);


ALTER TABLE public.escuela OWNER TO admin;

--
-- Name: escuela_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.escuela_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.escuela_id_seq OWNER TO admin;

--
-- Name: escuela_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.escuela_id_seq OWNED BY public.escuela.id;


--
-- Name: grupo; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.grupo (
    id integer NOT NULL,
    nombre character varying(60),
    profesorid integer,
    codigo character varying(4)
);


ALTER TABLE public.grupo OWNER TO admin;

--
-- Name: grupo_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.grupo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupo_id_seq OWNER TO admin;

--
-- Name: grupo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.grupo_id_seq OWNED BY public.grupo.id;


--
-- Name: listaalumnos; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.listaalumnos (
    id integer NOT NULL,
    grupoid integer,
    alumnoid integer
);


ALTER TABLE public.listaalumnos OWNER TO admin;

--
-- Name: listaalumnos_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.listaalumnos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.listaalumnos_id_seq OWNER TO admin;

--
-- Name: listaalumnos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.listaalumnos_id_seq OWNED BY public.listaalumnos.id;


--
-- Name: post; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.post (
    id integer NOT NULL,
    titulo character varying(100),
    contenido character varying(280),
    idusuario integer,
    imagen bytea,
    idescuela integer,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.post OWNER TO admin;

--
-- Name: post_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_id_seq OWNER TO admin;

--
-- Name: post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.post_id_seq OWNED BY public.post.id;


--
-- Name: profesor; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.profesor (
    id integer NOT NULL,
    idusuario integer,
    idescuela character varying(4)
);


ALTER TABLE public.profesor OWNER TO admin;

--
-- Name: profesor_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.profesor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profesor_id_seq OWNER TO admin;

--
-- Name: profesor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.profesor_id_seq OWNED BY public.profesor.id;


--
-- Name: reporte; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.reporte (
    idreporte integer NOT NULL,
    userid integer,
    mensaje text,
    mensajeid integer,
    escuelaid integer
);


ALTER TABLE public.reporte OWNER TO admin;

--
-- Name: reporte_idreporte_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.reporte_idreporte_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporte_idreporte_seq OWNER TO admin;

--
-- Name: reporte_idreporte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.reporte_idreporte_seq OWNED BY public.reporte.idreporte;


--
-- Name: sesiones; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.sesiones (
    id integer NOT NULL,
    user_id integer NOT NULL,
    ip_session character varying(16),
    json_web_token character varying(160),
    expire character varying(60)
);


ALTER TABLE public.sesiones OWNER TO admin;

--
-- Name: sesion_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.sesion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sesion_id_seq OWNER TO admin;

--
-- Name: sesion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.sesion_id_seq OWNED BY public.sesiones.id;


--
-- Name: tutor; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.tutor (
    id integer NOT NULL,
    idusuario integer,
    idalumno integer
);


ALTER TABLE public.tutor OWNER TO admin;

--
-- Name: tutor_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.tutor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tutor_id_seq OWNER TO admin;

--
-- Name: tutor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.tutor_id_seq OWNED BY public.tutor.id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    usuario character varying(30),
    pass text,
    email character varying(100),
    nombre character varying(50),
    apellidopaterno character varying(50),
    apellidomaterno character varying(50),
    tipo character(1),
    idescuela integer,
    two_factor boolean
);


ALTER TABLE public.usuario OWNER TO admin;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_seq OWNER TO admin;

--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- Name: administrador id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.administrador ALTER COLUMN id SET DEFAULT nextval('public.administrador_id_seq'::regclass);


--
-- Name: alumno id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.alumno ALTER COLUMN id SET DEFAULT nextval('public.alumno_id_seq'::regclass);


--
-- Name: chatconfig id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.chatconfig ALTER COLUMN id SET DEFAULT nextval('public.chatconfig_id_seq'::regclass);


--
-- Name: emergencia id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.emergencia ALTER COLUMN id SET DEFAULT nextval('public.emergencia_id_seq'::regclass);


--
-- Name: escuela id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.escuela ALTER COLUMN id SET DEFAULT nextval('public.escuela_id_seq'::regclass);


--
-- Name: grupo id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.grupo ALTER COLUMN id SET DEFAULT nextval('public.grupo_id_seq'::regclass);


--
-- Name: listaalumnos id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.listaalumnos ALTER COLUMN id SET DEFAULT nextval('public.listaalumnos_id_seq'::regclass);


--
-- Name: post id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.post ALTER COLUMN id SET DEFAULT nextval('public.post_id_seq'::regclass);


--
-- Name: profesor id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.profesor ALTER COLUMN id SET DEFAULT nextval('public.profesor_id_seq'::regclass);


--
-- Name: reporte idreporte; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reporte ALTER COLUMN idreporte SET DEFAULT nextval('public.reporte_idreporte_seq'::regclass);


--
-- Name: sesiones id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.sesiones ALTER COLUMN id SET DEFAULT nextval('public.sesion_id_seq'::regclass);


--
-- Name: tutor id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.tutor ALTER COLUMN id SET DEFAULT nextval('public.tutor_id_seq'::regclass);


--
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- Name: administrador administrador_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.administrador
    ADD CONSTRAINT administrador_pkey PRIMARY KEY (id);


--
-- Name: alumno alumno_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT alumno_pkey PRIMARY KEY (id);


--
-- Name: chatconfig chatconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.chatconfig
    ADD CONSTRAINT chatconfig_pkey PRIMARY KEY (id);


--
-- Name: emergencia emergencia_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.emergencia
    ADD CONSTRAINT emergencia_pkey PRIMARY KEY (id);


--
-- Name: escuela escuela_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.escuela
    ADD CONSTRAINT escuela_pkey PRIMARY KEY (id);


--
-- Name: grupo grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id);


--
-- Name: listaalumnos listaalumnos_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.listaalumnos
    ADD CONSTRAINT listaalumnos_pkey PRIMARY KEY (id);


--
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


--
-- Name: profesor profesor_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT profesor_pkey PRIMARY KEY (id);


--
-- Name: reporte reporte_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reporte
    ADD CONSTRAINT reporte_pkey PRIMARY KEY (idreporte);


--
-- Name: sesiones sesiones_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.sesiones
    ADD CONSTRAINT sesiones_pkey PRIMARY KEY (id);


--
-- Name: tutor tutor_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.tutor
    ADD CONSTRAINT tutor_pkey PRIMARY KEY (id);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

