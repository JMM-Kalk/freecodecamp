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
    name character varying(60),
    number_of_stars integer NOT NULL,
    number_of_black_holes integer,
    distance_from_earth_lightyears numeric(10,1) NOT NULL,
    galaxy_type text,
    has_life boolean,
    visited_by_man boolean
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
    name character varying(60),
    distance_from_planet integer NOT NULL,
    moon_description text,
    planet_id integer NOT NULL
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
-- Name: moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_id_seq OWNED BY public.moon.planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60),
    distance_from_star_km integer NOT NULL,
    number_of_moons integer,
    planet_description text,
    has_water boolean,
    has_life boolean,
    visited_by_man boolean,
    base_established boolean,
    equatorial_circumference_km numeric(10,1) NOT NULL,
    part_of_starsystem character varying(60),
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_description; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_description (
    planet_description_id integer NOT NULL,
    name character varying(60) NOT NULL,
    has_water boolean,
    has_life boolean,
    inhabitants integer
);


ALTER TABLE public.planet_description OWNER TO freecodecamp;

--
-- Name: planet_description_planet_description_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_description_planet_description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_description_planet_description_id_seq OWNER TO freecodecamp;

--
-- Name: planet_description_planet_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_description_planet_description_id_seq OWNED BY public.planet_description.planet_description_id;


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
-- Name: planet_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_star_id_seq OWNER TO freecodecamp;

--
-- Name: planet_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_star_id_seq OWNED BY public.planet.star_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60),
    number_of_planets integer NOT NULL,
    mass_ton integer NOT NULL,
    surface_temp_k numeric(8,2),
    star_type text,
    has_life boolean,
    visited_by_man boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


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
-- Name: moon planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN planet_id SET DEFAULT nextval('public.moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN star_id SET DEFAULT nextval('public.planet_star_id_seq'::regclass);


--
-- Name: planet_description planet_description_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_description ALTER COLUMN planet_description_id SET DEFAULT nextval('public.planet_description_planet_description_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Hunter', 1123355, 400, 8523.1, 'wheelbarrow', true, false);
INSERT INTO public.galaxy VALUES (2, 'Nemisis', 2057361, 1400, 85.8, 'Spiral', true, true);
INSERT INTO public.galaxy VALUES (4, 'Something else', 57361, 100, 5.8, 'Spiral', true, true);
INSERT INTO public.galaxy VALUES (5, 'Jeeeeens', 65463213, 6434, 864.7, 'circular', false, false);
INSERT INTO public.galaxy VALUES (6, 'Hellhole 1', 65460, 46345, 5465.0, 'spiraæ', true, true);
INSERT INTO public.galaxy VALUES (7, 'Andromeda', 2564673, 157674, 200.8, 'sprial', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Hermes', 1000000, 'A rock', 12);
INSERT INTO public.moon VALUES (2, 'Ares', 21000000, 'A rock', 12);
INSERT INTO public.moon VALUES (3, 'Uril', 200054621, 'A rock', 12);
INSERT INTO public.moon VALUES (4, 'Mette', 154306543, 'A dead rock', 12);
INSERT INTO public.moon VALUES (5, 'Anker', 4315462, 'An oasis', 12);
INSERT INTO public.moon VALUES (6, 'Svend', 465512, 'So much energy', 12);
INSERT INTO public.moon VALUES (7, 'Inger', 654000, 'So much gas', 12);
INSERT INTO public.moon VALUES (8, 'Lars B', 7054621, 'Literally full of shit', 12);
INSERT INTO public.moon VALUES (9, 'Pia K', 1506543, 'Hostile environment', 12);
INSERT INTO public.moon VALUES (10, 'Elle-Bellemann', 434562, 'A rock', 12);
INSERT INTO public.moon VALUES (11, 'Lille Lars', 466551, 'Deceptive', 12);
INSERT INTO public.moon VALUES (12, 'Liedegaard', 6550400, 'Waste of space', 12);
INSERT INTO public.moon VALUES (13, 'Rosenkrantz', 7054451, 'Very unstable', 12);
INSERT INTO public.moon VALUES (14, 'MEsserschmidt', 55506543, 'Hostile environment', 12);
INSERT INTO public.moon VALUES (15, 'OBO III', 98734562, 'SO much noise', 12);
INSERT INTO public.moon VALUES (16, 'Pape', 4678051, 'Intensely dull', 12);
INSERT INTO public.moon VALUES (17, 'Johanne', 6550425, 'our only hope', 12);
INSERT INTO public.moon VALUES (18, 'Tesfaye', 754451, 'Once promising', 12);
INSERT INTO public.moon VALUES (19, 'Hedegaard', 5550623, 'Broken', 12);
INSERT INTO public.moon VALUES (20, 'Bertel', 134562, 'highly volatile', 12);
INSERT INTO public.moon VALUES (21, 'schluter', 4228051, 'bonedry', 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury 2', 1532000, 2, 'lush green with salt- and seawater', true, true, true, true, 20045.5, 'Promise', 6);
INSERT INTO public.planet VALUES (2, 'Venus 2', 15364000, 0, 'Wasteland acid atmosphere', false, false, false, false, 52545.5, 'Desolation', 3);
INSERT INTO public.planet VALUES (3, 'Mars 2', 2465406, 3, 'Lush and junglelike. INhabited by giant squids', true, true, false, false, 5464736.1, 'Krypton', 1);
INSERT INTO public.planet VALUES (4, 'Jupiter 2', 634065, 4, 'Nothing to see here', true, false, true, false, 20464.7, 'Promise', 6);
INSERT INTO public.planet VALUES (5, 'Saturn 2', 15364000, 520, 'Gas giant', false, false, false, false, 500005.5, 'Blumen', 7);
INSERT INTO public.planet VALUES (6, 'Uranus 2', 25645406, 23, 'Home of the Kree empire', true, true, true, false, 5464736.1, 'Desolation', 3);
INSERT INTO public.planet VALUES (7, 'Neptune 2', 63645, 1, 'Snowball', false, false, false, false, 2487.7, 'Imagine', 4);
INSERT INTO public.planet VALUES (8, 'Pluto 2', 6463687, 3, 'Another snowball', false, false, true, false, 5004.9, 'Imagine', 4);
INSERT INTO public.planet VALUES (9, 'Jupiter 3', 531643, 82, 'Gas giant', false, true, false, false, 600876.8, 'Small Japatus', 5);
INSERT INTO public.planet VALUES (10, 'Alderan', 752456165, 3, 'A forrest, evergreen', true, true, true, true, 15765.4, 'Hellhole 1', 4);
INSERT INTO public.planet VALUES (11, 'Jeremiah', 2456165, 6, 'Postapocalyptic wasteland', true, false, true, false, 55765.4, 'Hellhole 1', 6);
INSERT INTO public.planet VALUES (12, 'Ungabunga', 45646165, 42, 'Home of Kong', true, true, false, false, 765.4, 'Something else', 4);


--
-- Data for Name: planet_description; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_description VALUES (2, 'Alderan', true, true, 1500);
INSERT INTO public.planet_description VALUES (3, 'Pluto 2', false, false, 0);
INSERT INTO public.planet_description VALUES (4, 'Mars 2', true, true, 200547);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Krypton', 5, 18000000, 6000.00, 'Red', true, false, 6);
INSERT INTO public.star VALUES (2, 'Big Japetus', 6, 2000000, 10084.80, 'Blue giant', true, false, 1);
INSERT INTO public.star VALUES (3, 'Desolation', 4, 65400064, 46134.10, 'Red Dwarf', true, true, 2);
INSERT INTO public.star VALUES (4, 'Imagine', 0, 555551, 1530.10, 'Dead Blue', false, false, 5);
INSERT INTO public.star VALUES (5, 'Small Japatus', 3, 2000500, 8084.80, 'Yelloq class I', true, false, 1);
INSERT INTO public.star VALUES (6, 'Promise', 8, 65400064, 7134.10, 'Yellow Class II', true, true, 7);
INSERT INTO public.star VALUES (7, 'Blumen', 2, 520555551, 20000.60, 'Pulsar', false, false, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_id_seq', 1, false);


--
-- Name: planet_description_planet_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_description_planet_description_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_star_id_seq', 1, false);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: planet_description planet_description_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_description
    ADD CONSTRAINT planet_description_pkey PRIMARY KEY (planet_description_id);


--
-- Name: planet_description planet_description_planet_description_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_description
    ADD CONSTRAINT planet_description_planet_description_id_key UNIQUE (planet_description_id);


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
-- Name: planet_description planet_description_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_description
    ADD CONSTRAINT planet_description_name_fkey FOREIGN KEY (name) REFERENCES public.planet(name);


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

