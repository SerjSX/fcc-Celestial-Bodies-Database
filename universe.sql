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
    name character varying(20) NOT NULL,
    optional_descr text,
    life integer NOT NULL,
    op_exp_life integer
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
    name character varying(20) NOT NULL,
    planet_id integer NOT NULL,
    op_size integer,
    op_visits_count integer
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
    name character varying(20) NOT NULL,
    age_in_million_of_years integer,
    brief_characteristics text,
    possible_to_live_on boolean,
    has_life boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_galaxy (
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(20),
    planet_galaxy_id integer NOT NULL
);


ALTER TABLE public.planet_galaxy OWNER TO freecodecamp;

--
-- Name: planet_galaxy_planet_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_galaxy_planet_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_galaxy_planet_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: planet_galaxy_planet_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_galaxy_planet_galaxy_id_seq OWNED BY public.planet_galaxy.planet_galaxy_id;


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
    name character varying(20) NOT NULL,
    distance_from_earth integer,
    expected_life_in_years numeric(4,1),
    galaxy_id integer NOT NULL
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_galaxy planet_galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy ALTER COLUMN planet_galaxy_id SET DEFAULT nextval('public.planet_galaxy_planet_galaxy_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Life', NULL, 80000, NULL);
INSERT INTO public.galaxy VALUES (2, 'Partial Life', NULL, 23000, NULL);
INSERT INTO public.galaxy VALUES (3, 'Lifeless', NULL, 8000, NULL);
INSERT INTO public.galaxy VALUES (4, 'RUI', NULL, 120000, NULL);
INSERT INTO public.galaxy VALUES (5, 'BLACK', NULL, 890000, NULL);
INSERT INTO public.galaxy VALUES (6, 'BRIGHT', NULL, 7230000, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon of Earth', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Moon of Dano', 4, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Moon of Bo', 3, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Moon of Ro', 32, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Moon of Laro', 36, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Moon of Charo', 33, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'Moon of LaroB', 36, NULL, NULL);
INSERT INTO public.moon VALUES (25, 'Moon of Crab', 31, NULL, NULL);
INSERT INTO public.moon VALUES (26, 'Moon of Ice', 32, NULL, NULL);
INSERT INTO public.moon VALUES (27, 'Moon of Flame', 4, NULL, NULL);
INSERT INTO public.moon VALUES (28, 'Moon of Lion', 34, NULL, NULL);
INSERT INTO public.moon VALUES (29, 'Moon of Volcano', 35, NULL, NULL);
INSERT INTO public.moon VALUES (30, 'Nature Max', 30, NULL, NULL);
INSERT INTO public.moon VALUES (31, 'Rivers Above', 30, NULL, NULL);
INSERT INTO public.moon VALUES (32, 'Flames Below', 33, NULL, NULL);
INSERT INTO public.moon VALUES (33, 'Flames Above', 33, NULL, NULL);
INSERT INTO public.moon VALUES (34, 'Moon of No Life', 2, NULL, NULL);
INSERT INTO public.moon VALUES (35, 'Moon of Life', 34, NULL, NULL);
INSERT INTO public.moon VALUES (36, 'Poala', 36, NULL, NULL);
INSERT INTO public.moon VALUES (37, 'Absolute Emptiness', 36, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 9000, 'full of life, pollution', true, true, 5);
INSERT INTO public.planet VALUES (2, 'Mang', 2000, 'lifeless. volcanoes.', false, false, 2);
INSERT INTO public.planet VALUES (3, 'Octo', 18000, 'possible to live on, a lot of water and adequate tempp.', true, false, 3);
INSERT INTO public.planet VALUES (4, 'Xomo', 200, 'no life. full of lava and very high temp.', false, false, 4);
INSERT INTO public.planet VALUES (29, 'Void', 98000, 'black.void.empty.nothingness', false, false, 7);
INSERT INTO public.planet VALUES (30, 'Uran', 24000, 'has a lot of trees. has some rivers possible to live on.', true, false, 3);
INSERT INTO public.planet VALUES (31, 'Nolb', 230, 'a lot of sea life, full of dangerous sea creatures. Scientists active.', false, true, 5);
INSERT INTO public.planet VALUES (32, 'Venus', 9820, 'very cold. no life possibility.', false, false, 1);
INSERT INTO public.planet VALUES (33, 'Charo', 10, 'very hot, mostly on flame.', false, false, 2);
INSERT INTO public.planet VALUES (34, 'Seadi', 420, 'similar to Earth, small population.', true, true, 4);
INSERT INTO public.planet VALUES (35, 'Lorm', 780, 'random  but frequent volcano disruptions', false, false, 7);
INSERT INTO public.planet VALUES (36, 'Mak', 9, 'half black, half burning', false, false, 7);


--
-- Data for Name: planet_galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_galaxy VALUES (1, 1, NULL, 1);
INSERT INTO public.planet_galaxy VALUES (3, 2, NULL, 2);
INSERT INTO public.planet_galaxy VALUES (2, 3, NULL, 3);
INSERT INTO public.planet_galaxy VALUES (3, 4, NULL, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Star of Alex', 200, 430.7, 1);
INSERT INTO public.star VALUES (2, 'Star of Bax', 1900, 350.5, 3);
INSERT INTO public.star VALUES (3, 'Star of Can', 820, 873.9, 2);
INSERT INTO public.star VALUES (4, 'Star of X', 9800, 230.2, 3);
INSERT INTO public.star VALUES (5, 'Star of Y', 0, 900.1, 1);
INSERT INTO public.star VALUES (7, 'Star of Null', 19000, 470.0, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 37, true);


--
-- Name: planet_galaxy_planet_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_galaxy_planet_galaxy_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 36, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet_galaxy planet_galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy
    ADD CONSTRAINT planet_galaxy_pkey PRIMARY KEY (planet_galaxy_id);


--
-- Name: planet_galaxy planet_galaxy_planet_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy
    ADD CONSTRAINT planet_galaxy_planet_key UNIQUE (planet_id);


--
-- Name: planet_galaxy planet_galaxy_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy
    ADD CONSTRAINT planet_galaxy_planet_name UNIQUE (name);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


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
-- Name: planet_galaxy planet_galaxy_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy
    ADD CONSTRAINT planet_galaxy_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet_galaxy planet_galaxy_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy
    ADD CONSTRAINT planet_galaxy_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

