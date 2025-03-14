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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    diameter_km integer NOT NULL,
    composition character varying(255) NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_type character varying(255) NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    description text
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean NOT NULL
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    planet_type character varying(255) NOT NULL,
    distance_from_earth numeric NOT NULL
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 1, 940, 'Rocky/Ice');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 1, 525, 'Rocky');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 1, 512, 'Rocky/Ice');
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 1, 430, 'Rocky/Ice');
INSERT INTO public.asteroid VALUES (5, 'Interamnia', 1, 340, 'Rocky/Ice');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13610, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10010, 'Closest spiral galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 8000, 'Third largest galaxy in our local group');
INSERT INTO public.galaxy VALUES (4, 'Canis Major Dwarf', 'Dwarf Elliptical', 11000, 'Closest known dwarf galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Elliptical', 12000, 'Contains a supermassive black hole');
INSERT INTO public.galaxy VALUES (6, 'Virgo A', 'Elliptical', 11000, 'Largest galaxy in the Virgo Cluster');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 4500, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 4600, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 4600, true);
INSERT INTO public.moon VALUES (4, 'Io', 3, 4600, true);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 4600, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 4600, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4600, true);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 4600, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 4600, true);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, 4600, true);
INSERT INTO public.moon VALUES (11, 'Dione', 4, 4600, true);
INSERT INTO public.moon VALUES (12, 'Tethys', 4, 4600, true);
INSERT INTO public.moon VALUES (13, 'Enceladus', 4, 4600, true);
INSERT INTO public.moon VALUES (14, 'Mimas', 4, 4600, true);
INSERT INTO public.moon VALUES (15, 'Miranda', 5, 4600, true);
INSERT INTO public.moon VALUES (16, 'Ariel', 5, 4600, true);
INSERT INTO public.moon VALUES (17, 'Umbriel', 5, 4600, true);
INSERT INTO public.moon VALUES (18, 'Titania', 5, 4600, true);
INSERT INTO public.moon VALUES (19, 'Oberon', 5, 4600, true);
INSERT INTO public.moon VALUES (20, 'Triton', 6, 4600, true);
INSERT INTO public.moon VALUES (21, 'Nereid', 6, 4, true);
INSERT INTO public.moon VALUES (22, 'Proximacentaureib I', 7, 4850, true);
INSERT INTO public.moon VALUES (23, 'Sirius B I', 8, 7, true);
INSERT INTO public.moon VALUES (24, 'Betelgeuse Aa I', 9, 10, true);
INSERT INTO public.moon VALUES (25, 'Rigel A I', 10, 8, true);
INSERT INTO public.moon VALUES (26, 'Aldebaran A I', 11, 6500, true);
INSERT INTO public.moon VALUES (27, 'V711 Tauri A I', 12, 12, true);
INSERT INTO public.moon VALUES (28, 'NGC 4564 A I', 13, 10000, true);
INSERT INTO public.moon VALUES (29, 'M87 A I', 14, 12000, true);
INSERT INTO public.moon VALUES (30, 'NGC 4486B A I', 15, 11000, true);
INSERT INTO public.moon VALUES (31, 'M87 B I', 16, 12000, true);
INSERT INTO public.moon VALUES (32, 'NGC 4486B B I', 17, 11000, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 'Terrestrial', 0.000015813);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 'Terrestrial', 0.000019226);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, false, 'Gas Giant', 0.0048388);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, false, 'Gas Giant', 0.0088591);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, false, 'Ice Giant', 0.01784);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, false, 'Ice Giant', 0.02793);
INSERT INTO public.planet VALUES (7, 'Proxima Centauri b', 2, false, 'Terrestrial', 0.000042465);
INSERT INTO public.planet VALUES (8, 'Sirius B', 3, false, 'White Dwarf', 0.00860);
INSERT INTO public.planet VALUES (9, 'Betelgeuse Aa', 4, false, 'Red Supergiant', 0.00643);
INSERT INTO public.planet VALUES (10, 'Rigel A', 5, false, 'Blue Supergiant', 0.00864);
INSERT INTO public.planet VALUES (11, 'Aldebaran A', 6, false, 'Orange Giant', 0.00681);
INSERT INTO public.planet VALUES (12, 'V711 Tauri A', 7, false, 'Red Dwarf', 0.00129);
INSERT INTO public.planet VALUES (13, 'NGC 4564 A', 8, false, 'Yellow Dwarf', 0.00578);
INSERT INTO public.planet VALUES (14, 'M87 A', 9, false, 'Yellow Dwarf', 0.00578);
INSERT INTO public.planet VALUES (15, 'NGC 4486B A', 10, false, 'Yellow Dwarf', 0.00578);
INSERT INTO public.planet VALUES (16, 'M87 B', 11, false, 'Yellow Dwarf', 0.00578);
INSERT INTO public.planet VALUES (17, 'NGC 4486B B', 12, false, 'Yellow Dwarf', 0.00578);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4850, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 230, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 10, false);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 8, false);
INSERT INTO public.star VALUES (6, 'Aldebaran', 1, 6500, true);
INSERT INTO public.star VALUES (7, 'Alpha Andromedae', 2, 7, true);
INSERT INTO public.star VALUES (8, 'Delta Trianguli', 3, 5, true);
INSERT INTO public.star VALUES (9, 'V711 Tauri', 4, 12, true);
INSERT INTO public.star VALUES (10, 'NGC 4564', 5, 10000, true);
INSERT INTO public.star VALUES (11, 'M87', 6, 12000, true);
INSERT INTO public.star VALUES (12, 'NGC 4486B', 6, 11000, true);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 32, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

