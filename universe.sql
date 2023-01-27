--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    distance numeric,
    reference_no integer NOT NULL,
    visible boolean NOT NULL,
    milky_way boolean NOT NULL,
    dimension integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    description text NOT NULL,
    distance numeric,
    reference_no integer NOT NULL,
    visible boolean NOT NULL,
    milky_way boolean NOT NULL,
    dimension integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    description text NOT NULL,
    distance numeric,
    reference_no integer NOT NULL,
    visible boolean NOT NULL,
    milky_way boolean NOT NULL,
    dimension integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    description text NOT NULL,
    distance numeric,
    reference_no integer NOT NULL,
    visible boolean NOT NULL,
    milky_way boolean NOT NULL,
    dimension integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.system (
    system_id integer NOT NULL,
    name character varying(30),
    description text NOT NULL,
    reference_id integer NOT NULL,
    dimension integer NOT NULL,
    visible boolean NOT NULL,
    mapped boolean NOT NULL,
    distance numeric
);


ALTER TABLE public.system OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.system_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_system_id_seq OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.system_system_id_seq OWNED BY public.system.system_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: system system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system ALTER COLUMN system_id SET DEFAULT nextval('public.system_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 'home galaxy', 0.0, 1, true, true, 100);
INSERT INTO public.galaxy VALUES (3, 'M32', 'ellictic galaxy', 10.0, 2, true, false, 50);
INSERT INTO public.galaxy VALUES (4, 'NGC 253', 'spiral galaxy', 18.0, 3, true, false, 150);
INSERT INTO public.galaxy VALUES (5, 'M 104', 'sombrero galaxy', 25.0, 4, true, false, 120);
INSERT INTO public.galaxy VALUES (6, 'NGC 4650A', 'polar ring  galaxy', 12.0, 5, true, false, 180);
INSERT INTO public.galaxy VALUES (7, 'NGC 1316', 'lenticular  galaxy', 2.0, 6, true, false, 280);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4, 'Our moon', 0, 1, true, true, 10);
INSERT INTO public.moon VALUES (2, 'Metis', 6, 'metis', 0, 2, true, true, 10);
INSERT INTO public.moon VALUES (3, 'Adrastea', 6, 'adra', 0, 3, true, true, 10);
INSERT INTO public.moon VALUES (4, 'Amaltea', 6, 'ama', 0, 4, true, true, 10);
INSERT INTO public.moon VALUES (5, 'tebe', 6, 'tebe ', 0, 5, true, true, 10);
INSERT INTO public.moon VALUES (6, 'ganimede', 6, 'coppiere ', 0, 6, true, true, 10);
INSERT INTO public.moon VALUES (7, 'callisto', 6, 'amico di evaristo ', 0, 7, true, true, 10);
INSERT INTO public.moon VALUES (8, 'io', 6, 'me medesimo ', 0, 8, true, true, 10);
INSERT INTO public.moon VALUES (10, 'europa', 6, 'basta la parola ', 0, 9, true, true, 10);
INSERT INTO public.moon VALUES (11, 'temisto', 6, 'irreegolare ', 0, 10, true, true, 10);
INSERT INTO public.moon VALUES (12, 'Carpo', 6, 'esterno', 0, 11, true, true, 10);
INSERT INTO public.moon VALUES (13, 'Carme', 6, 'catturato', 0, 12, true, true, 10);
INSERT INTO public.moon VALUES (15, 'Mneme', 6, '??', 0, 13, false, true, 10);
INSERT INTO public.moon VALUES (16, 'Ortosia', 6, '???', 0, 14, false, true, 10);
INSERT INTO public.moon VALUES (17, 'Euante', 6, 'xxx', 0, 15, false, true, 10);
INSERT INTO public.moon VALUES (18, 'Arpalice', 6, 'xxxx', 0, 16, false, true, 10);
INSERT INTO public.moon VALUES (19, 'Prassidice', 6, 'sa ghe?', 0, 17, false, true, 10);
INSERT INTO public.moon VALUES (20, 'Tione', 6, 'anake ', 0, 18, false, true, 10);
INSERT INTO public.moon VALUES (21, 'Telsione', 6, 'xy', 0, 19, false, true, 10);
INSERT INTO public.moon VALUES (22, 'Giocasta', 6, 'gio', 0, 20, false, true, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 1, 'primo  ', 0, 1, true, true, 10);
INSERT INTO public.planet VALUES (2, 'Venere', 1, 'sec  ', 0, 2, true, true, 10);
INSERT INTO public.planet VALUES (4, 'terra', 1, 'casa', 0, 3, true, true, 10);
INSERT INTO public.planet VALUES (5, 'marte', 1, 'omini verdi', 0, 4, true, true, 10);
INSERT INTO public.planet VALUES (6, 'giove', 1, 'il grosso', 0, 5, true, true, 10);
INSERT INTO public.planet VALUES (7, 'saturno', 1, 'ad anello', 0, 6, true, true, 10);
INSERT INTO public.planet VALUES (8, 'urano', 1, 'lontanuccio', 0, 7, true, true, 10);
INSERT INTO public.planet VALUES (9, 'nettuno', 1, 'ultimo', 0, 8, true, true, 10);
INSERT INTO public.planet VALUES (10, 'plujtone', 1, 'ex', 0, 9, true, true, 10);
INSERT INTO public.planet VALUES (11, 'cerere', 1, ' un ciccinino fuori', 0, 10, true, true, 10);
INSERT INTO public.planet VALUES (12, 'eris', 1, 'primo eso pianeta', 0, 11, true, true, 10);
INSERT INTO public.planet VALUES (13, 'salacia', 1, 'boh', 0, 12, true, true, 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Our Sun', 0, 1, true, true, 100);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 3, 'beet n', 0, 2, true, true, 100);
INSERT INTO public.star VALUES (7, 'Altair', 4, 'altai', 0, 3, true, true, 100);
INSERT INTO public.star VALUES (8, 'Rigel', 5, 'riggi pop', 0, 4, false, true, 100);
INSERT INTO public.star VALUES (9, 'Aldebaran', 6, 'Aldebyi', 0, 5, false, false, 100);
INSERT INTO public.star VALUES (10, 'Sirio', 7, 'Sirione ', 0, 6, false, true, 100);


--
-- Data for Name: system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.system VALUES (1, 'Solare', 'Il nostro', 1, 100, true, true, 0);
INSERT INTO public.system VALUES (2, 'Pippo', 'Pippoide', 2, 120, true, true, 0);
INSERT INTO public.system VALUES (3, 'Pluto', 'Plutoide', 3, 140, true, true, 0);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: system_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.system_system_id_seq', 3, true);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_reference_no_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_reference_no_key UNIQUE (reference_no);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_reference_no_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_reference_no_key UNIQUE (reference_no);


--
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_reference_no_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_reference_no_key UNIQUE (reference_no);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_reference_no_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_reference_no_key UNIQUE (reference_no);


--
-- Name: system system_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_description_key UNIQUE (description);


--
-- Name: system system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_pkey PRIMARY KEY (system_id);


--
-- Name: system system_reference_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_reference_id_key UNIQUE (reference_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

