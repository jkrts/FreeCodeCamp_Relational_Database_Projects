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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(35) NOT NULL,
    messier_objects integer,
    main_stars integer,
    stars_with_planets integer,
    symbolism text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(32) NOT NULL,
    constellation text,
    type text,
    distance_from_earth_mly numeric(6,2) NOT NULL,
    messier_object boolean
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
    name character varying(32) NOT NULL,
    distance_to_planet_km integer,
    planet_id integer,
    mean_radius_km numeric(6,1)
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
    name character varying(32) NOT NULL,
    star_id integer,
    moons integer,
    distance_to_host_au numeric(5,3),
    potentially_habitable boolean
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
    name character varying(32) NOT NULL,
    distance_from_earth_ly numeric(4,1),
    galaxy_id integer,
    spectral_type character varying(1),
    constellation_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 3, 16, 12, 'Andromeda, the chained woman');
INSERT INTO public.constellation VALUES (2, 'Canes Venatici', 5, 2, 4, 'the Hunting Dogs');
INSERT INTO public.constellation VALUES (3, 'Ursa Major', 7, 20, 21, 'the Great Bear');
INSERT INTO public.constellation VALUES (4, 'Draco', 1, 14, 19, 'the Dragon');
INSERT INTO public.constellation VALUES (5, 'Virgo', 11, 15, 29, 'the Maiden');
INSERT INTO public.constellation VALUES (6, 'Leo', 5, 15, 13, 'the Lion');
INSERT INTO public.constellation VALUES (7, 'Centaurus', 0, 11, 15, 'the Centaur');
INSERT INTO public.constellation VALUES (8, 'Eridanus', 0, 24, 32, 'the River, Eridanus');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda', 'Spiral', 2.45, true);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'Canes Venatici', 'Spiral', 31.00, true);
INSERT INTO public.galaxy VALUES (4, 'Cigar', 'Ursa Major', 'Starburst', 12.00, true);
INSERT INTO public.galaxy VALUES (5, 'Spindle', 'Draco', 'Lenticular', 50.00, true);
INSERT INTO public.galaxy VALUES (6, 'Virgo A', 'Virgo', 'Elliptical', 53.50, true);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', '', 'Barred Spiral', 0.00, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384399, 3, 1737.4);
INSERT INTO public.moon VALUES (2, 'Phobos', 9376, 4, 11.3);
INSERT INTO public.moon VALUES (3, 'Deimos', 23463, 4, 6.2);
INSERT INTO public.moon VALUES (4, 'Io', 421700, 5, 3643.0);
INSERT INTO public.moon VALUES (5, 'Europa', 671034, 5, 3122.0);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1070412, 5, 5262.0);
INSERT INTO public.moon VALUES (7, 'Callisto', 1882709, 5, 4821.0);
INSERT INTO public.moon VALUES (8, 'Titan', 1221870, 6, 2574.7);
INSERT INTO public.moon VALUES (9, 'Rhea', 527108, 6, 763.8);
INSERT INTO public.moon VALUES (10, 'Triton', 354759, 7, 1353.4);
INSERT INTO public.moon VALUES (11, 'Nereid', 5513940, 7, 174.3);
INSERT INTO public.moon VALUES (12, 'Proteus', 117647, 7, 210.0);
INSERT INTO public.moon VALUES (13, 'Naiad', 48224, 7, 30.2);
INSERT INTO public.moon VALUES (14, 'Thalassa', 50074, 7, 40.7);
INSERT INTO public.moon VALUES (15, 'Despina', 52526, 7, 78.0);
INSERT INTO public.moon VALUES (16, 'Galatea', 61953, 7, 87.4);
INSERT INTO public.moon VALUES (17, 'Miranda', 129390, 8, 235.8);
INSERT INTO public.moon VALUES (18, 'Ariel', 191020, 8, 578.9);
INSERT INTO public.moon VALUES (19, 'Umbriel', 266000, 8, 584.7);
INSERT INTO public.moon VALUES (20, 'Titania', 435910, 8, 788.4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0, 0.387, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0, 0.723, false);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 2, 1.524, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 80, 5.204, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 83, 9.583, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 27, 19.191, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 14, 30.070, false);
INSERT INTO public.planet VALUES (10, 'Wolf 359 b', 10, 0, 1.854, false);
INSERT INTO public.planet VALUES (11, 'Epsilon Eridani b', 11, 0, 3.480, false);
INSERT INTO public.planet VALUES (12, 'Lalande 21185 b', 8, 0, 0.079, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, 1.000, true);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 9, 0, 0.049, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 0.0, 1, 'G', NULL);
INSERT INTO public.star VALUES (2, 'Alpha Andromedae', 97.0, 1, 'B', 1);
INSERT INTO public.star VALUES (3, 'Regulus', 79.3, 1, 'B', 6);
INSERT INTO public.star VALUES (4, 'Spica', 250.0, 1, 'B', 5);
INSERT INTO public.star VALUES (5, 'Gamma Draconis', 154.3, 1, 'K', 4);
INSERT INTO public.star VALUES (6, 'Epsilon Ursae Majoris', 82.6, 1, 'A', 3);
INSERT INTO public.star VALUES (7, 'Cor Caroli', 106.5, 1, 'A', 2);
INSERT INTO public.star VALUES (8, 'Lalande 21185', 8.3, 1, 'M', 3);
INSERT INTO public.star VALUES (9, 'Proxima Centauri', 4.2, 1, 'M', 7);
INSERT INTO public.star VALUES (10, 'Wolf 395', 7.9, 1, 'M', 6);
INSERT INTO public.star VALUES (11, 'Epsilon Eridani', 10.5, 1, 'K', 8);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 8, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: galaxy uniquectm_const; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uniquectm_const UNIQUE (name);


--
-- Name: star fk_constellation_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_constellation_id FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- PostgreSQL database dump complete
--
