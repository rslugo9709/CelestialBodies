--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    habitable boolean NOT NULL,
    type character varying(30) NOT NULL,
    distance numeric,
    black_hole boolean
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
    population integer,
    name character varying(30) NOT NULL,
    habitable boolean NOT NULL,
    lifespan numeric,
    planet_id integer NOT NULL,
    resources_available boolean NOT NULL
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
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    name character varying(30),
    descripcion text,
    resources text,
    settled boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: mor_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.mor_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mor_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: mor_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.mor_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    habitable boolean NOT NULL,
    lifespan numeric NOT NULL,
    star_id integer NOT NULL,
    population integer,
    colonized boolean
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
    lifespan numeric NOT NULL,
    galaxy_id integer NOT NULL,
    type character varying(30),
    n_planets integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.mor_info_more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', true, 'barred spirals', 0, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', true, 'barred spirals', 2537, true);
INSERT INTO public.galaxy VALUES (3, 'triangle', true, 'eliptical', 75000, true);
INSERT INTO public.galaxy VALUES (4, 'segue 1', true, 'spiral', 750000, true);
INSERT INTO public.galaxy VALUES (5, 'hydrus 1', true, 'spiral', 90000, true);
INSERT INTO public.galaxy VALUES (6, 'willman 1', true, 'irregular', 1240000, true);
INSERT INTO public.galaxy VALUES (7, 'reticulum 2', true, 'irregular', 1020000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, NULL, 'moon', true, NULL, 3, true);
INSERT INTO public.moon VALUES (2, NULL, 'deimos', true, NULL, 4, true);
INSERT INTO public.moon VALUES (3, NULL, 'phobos', true, NULL, 4, true);
INSERT INTO public.moon VALUES (4, NULL, 'callisto', true, NULL, 4, true);
INSERT INTO public.moon VALUES (5, NULL, 'europa', true, NULL, 4, true);
INSERT INTO public.moon VALUES (6, NULL, 'ganymede', true, NULL, 4, true);
INSERT INTO public.moon VALUES (7, NULL, 'Io', true, NULL, 4, true);
INSERT INTO public.moon VALUES (8, NULL, 'dione', true, NULL, 6, true);
INSERT INTO public.moon VALUES (9, NULL, 'enceladus', true, NULL, 6, true);
INSERT INTO public.moon VALUES (10, NULL, 'lapetus', true, NULL, 6, true);
INSERT INTO public.moon VALUES (11, NULL, 'mimas', true, NULL, 6, true);
INSERT INTO public.moon VALUES (12, NULL, 'rhea', true, NULL, 6, true);
INSERT INTO public.moon VALUES (13, NULL, 'tethys', true, NULL, 6, true);
INSERT INTO public.moon VALUES (14, NULL, 'titan', true, NULL, 6, true);
INSERT INTO public.moon VALUES (15, NULL, 'ariel', true, NULL, 7, true);
INSERT INTO public.moon VALUES (16, NULL, 'miranda', true, NULL, 7, true);
INSERT INTO public.moon VALUES (17, NULL, 'oberon', true, NULL, 7, true);
INSERT INTO public.moon VALUES (18, NULL, 'titania', true, NULL, 7, true);
INSERT INTO public.moon VALUES (19, NULL, 'umbriel', true, NULL, 7, true);
INSERT INTO public.moon VALUES (20, NULL, 'triton', true, NULL, 7, true);
INSERT INTO public.moon VALUES (21, NULL, 'charon', true, NULL, 7, true);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, NULL, 'This is our homeland', NULL, true, 3);
INSERT INTO public.more_info VALUES (2, NULL, 'The first planet in the solar system', NULL, false, 1);
INSERT INTO public.more_info VALUES (3, NULL, 'Our next home', NULL, false, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercury', false, 50000, 1, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'venus', true, 50000, 1, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'earth', true, 50000, 1, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'mars', true, 50000, 1, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'jupiter', false, 50000, 1, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'saturn', false, 50000, 1, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'uranus', false, 50000, 1, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'neptune', false, 50000, 1, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'pluto', true, 50000, 1, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'altair 1', true, 50000, 1, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'altair 2', true, 50000, 1, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'altair 3', true, 50000, 1, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'altair 4', true, 50000, 1, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 70000, 1, 'yellow dwarf', 12);
INSERT INTO public.star VALUES (2, 'altair', 5000, 1, ' dwarf', 12);
INSERT INTO public.star VALUES (3, 'kappa', 5000, 1, ' dwarf', 12);
INSERT INTO public.star VALUES (4, 'cannus', 5000, 1, ' dwarf', 12);
INSERT INTO public.star VALUES (5, 'mutant', 5000, 1, ' dwarf', 12);
INSERT INTO public.star VALUES (6, 'alpha', 5000, 1, ' dwarf', 12);
INSERT INTO public.star VALUES (7, 'testra', 5000, 1, ' dwarf', 12);
INSERT INTO public.star VALUES (8, 'laika', 5000, 1, ' dwarf', 12);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: mor_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.mor_info_more_info_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: more_info mor_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT mor_info_pkey PRIMARY KEY (more_info_id);


--
-- Name: more_info more_info_body_int_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_body_int_key UNIQUE (planet_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: more_info more_info_body_int_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_body_int_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

