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
-- Name: asteroids; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroids (
    name character varying(60) NOT NULL,
    diameter_km integer,
    orbit_period_days double precision,
    asteroids_id integer NOT NULL
);


ALTER TABLE public.asteroids OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroids_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroids_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroids_asteroid_id_seq OWNED BY public.asteroids.asteroids_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(60) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth_in_light_years numeric,
    galaxy_id integer NOT NULL,
    number_of_stars_in_billions numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(60) NOT NULL,
    moon_id integer DEFAULT nextval('public.moon_moon_id_seq'::regclass) NOT NULL,
    diameter_km integer,
    orbit_period_days double precision,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    type character varying(50),
    diameter_km numeric,
    distance_from_sun_in_millions_km numeric,
    has_rings boolean,
    radius_km integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    mass numeric,
    brightness numeric,
    galaxy_id integer,
    temperature numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_star_id_seq OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroids asteroids_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids ALTER COLUMN asteroids_id SET DEFAULT nextval('public.asteroids_asteroid_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.stars_star_id_seq'::regclass);


--
-- Data for Name: asteroids; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroids VALUES ('Ceres', 940, 1680, 1);
INSERT INTO public.asteroids VALUES ('Vesta', 525, 1325, 2);
INSERT INTO public.asteroids VALUES ('Pallas', 512, 1686, 3);
INSERT INTO public.asteroids VALUES ('Hygiea', 434, 2172, 4);
INSERT INTO public.asteroids VALUES ('Eros', 17, 1.76, 5);
INSERT INTO public.asteroids VALUES ('Davida', 326, 1540, 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Andromeda', 'The nearest spiral galaxy to the Milky Way.', false, true, 10000, 2537000, 2, 100);
INSERT INTO public.galaxy VALUES ('Milky Way', 'The galaxy that contains our Solar System.', true, true, 13800, 4250, 1, 300);
INSERT INTO public.galaxy VALUES ('Triangulum Galaxy', 'A small spiral galaxy near the Milky Way.', false, false, 3000, 3000000, 3, 40);
INSERT INTO public.galaxy VALUES ('Whirlpool Galaxy', 'A grand-design spiral galaxy located in the constellation Canes Venatici.', false, false, 1000, 23000000, 4, 60);
INSERT INTO public.galaxy VALUES ('Sombrero Galaxy', 'A spiral galaxy in the constellation Virgo.', false, false, 1000, 28000000, 5, 800);
INSERT INTO public.galaxy VALUES ('Pinwheel Galaxy', 'A spiral galaxy in the constellation Ursa Major.', false, false, 1500, 21000000, 6, 120);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 3474, 27.3, 2);
INSERT INTO public.moon VALUES ('Phobos', 2, 22, 0.3, 3);
INSERT INTO public.moon VALUES ('Deimos', 3, 12, 1.3, 3);
INSERT INTO public.moon VALUES ('Io', 4, 3643, 1.8, 4);
INSERT INTO public.moon VALUES ('Europa', 5, 3121, 3.5, 4);
INSERT INTO public.moon VALUES ('Ganymede', 6, 5268, 7.2, 4);
INSERT INTO public.moon VALUES ('Callisto', 7, 4821, 16.7, 4);
INSERT INTO public.moon VALUES ('Titan', 8, 5150, 15.9, 5);
INSERT INTO public.moon VALUES ('Rhea', 9, 764, 4.5, 5);
INSERT INTO public.moon VALUES ('Iapetus', 10, 1469, 79.3, 5);
INSERT INTO public.moon VALUES ('Enceladus', 11, 504, 1.4, 5);
INSERT INTO public.moon VALUES ('Tethys', 12, 1060, 1.9, 5);
INSERT INTO public.moon VALUES ('Mimas', 13, 396, 0.9, 5);
INSERT INTO public.moon VALUES ('Miranda', 14, 472, 1.4, 6);
INSERT INTO public.moon VALUES ('Ariel', 15, 1158, 2.5, 6);
INSERT INTO public.moon VALUES ('Umbriel', 16, 1169, 4.1, 6);
INSERT INTO public.moon VALUES ('Titania', 17, 1578, 8.7, 6);
INSERT INTO public.moon VALUES ('Oberon', 18, 1523, 13.5, 6);
INSERT INTO public.moon VALUES ('Triton', 19, 2706, 5.9, 7);
INSERT INTO public.moon VALUES ('Nereid', 20, 170, 360, 7);
INSERT INTO public.moon VALUES ('Proteus', 21, 418, 1.1, 7);
INSERT INTO public.moon VALUES ('Charon', 22, 1212, 6.4, 8);
INSERT INTO public.moon VALUES ('Styx', 23, 16, 0.6, 8);
INSERT INTO public.moon VALUES ('Nix', 24, 45, 0.8, 8);
INSERT INTO public.moon VALUES ('Kerberos', 25, 19, 0.6, 8);
INSERT INTO public.moon VALUES ('Hydra', 26, 61, 1.3, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Venus', 1, 'Terrestrial', 12104, 108200000, false, 6051, 1);
INSERT INTO public.planet VALUES ('Earth', 2, 'Terrestrial', 12742, 149600000, false, 6371, 2);
INSERT INTO public.planet VALUES ('Mars', 3, 'Terrestrial', 6779, 227900000, false, 3389, 3);
INSERT INTO public.planet VALUES ('Jupiter', 4, 'Gas Giant', 139820, 778300000, true, 69911, 4);
INSERT INTO public.planet VALUES ('Saturn', 5, 'Gas Giant', 116460, 1427000000, true, 58232, 5);
INSERT INTO public.planet VALUES ('Uranus', 6, 'Ice Giant', 50724, 2871000000, true, 25362, 6);
INSERT INTO public.planet VALUES ('Neptune', 7, 'Ice Giant', 49244, 4495000000, true, 24622, 1);
INSERT INTO public.planet VALUES ('Pluto', 8, 'Dwarf Planet', 2376, 5913000000, false, 1188, 2);
INSERT INTO public.planet VALUES ('Eris', 9, 'Dwarf Planet', 2326, 9600000000, false, 1163, 3);
INSERT INTO public.planet VALUES ('Haumea', 10, 'Dwarf Planet', 1632, 6450000000, false, 816, 4);
INSERT INTO public.planet VALUES ('Makemake', 11, 'Dwarf Planet', 1430, 6170000000, false, 714, 5);
INSERT INTO public.planet VALUES ('Ceres', 12, 'Dwarf Planet', 940, 413700000, false, 470, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (6, 'New Triangulum Star', 'F-type main-sequence star', 1.2, 10, 3, 6200);
INSERT INTO public.star VALUES (1, 'Sun', 'G-type main-sequence star', 1, 1, 1, 5778);
INSERT INTO public.star VALUES (2, 'Sirius', 'A-type main-sequence star', 2.1, 25.4, 1, 9940);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant', 20, 12000, 1, 3500);
INSERT INTO public.star VALUES (4, 'Alpheratz', 'A-type main-sequence star', 2.5, 75, 2, 8700);
INSERT INTO public.star VALUES (5, 'Mirach', 'Red giant', 6, 1000, 2, 3500);


--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroids_asteroid_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: stars_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_star_id_seq', 6, true);


--
-- Name: asteroids asteroids_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_name_key UNIQUE (name);


--
-- Name: asteroids asteroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_pkey PRIMARY KEY (asteroids_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy pk_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT pk_galaxy_id PRIMARY KEY (galaxy_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroids unique_asteroids_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT unique_asteroids_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

