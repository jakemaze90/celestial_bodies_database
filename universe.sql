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
    name character varying(40) NOT NULL,
    distance_earth_ly integer,
    galaxy_type character varying(30),
    larger_than_milky boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40),
    moon_system character varying(30),
    moon_type character varying(30),
    moon_size numeric(20,1),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20),
    planet_size text,
    galaxy character varying(30),
    has_life boolean NOT NULL,
    star_system character varying(40),
    moon_system character varying(30),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moon_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moon_info (
    planet_id integer,
    planet_size text NOT NULL,
    moon_id integer,
    moon_size numeric(20,1),
    moon integer,
    planet_moon_info_id integer NOT NULL
);


ALTER TABLE public.planet_moon_info OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy character varying(40),
    star_type character varying(40),
    star_system character varying(40),
    galaxy_type character varying(30)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 'spiral', NULL);
INSERT INTO public.galaxy VALUES (2, 'NGC 6670', 400000000, 'Triplet', true);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 2500000, 'Spiral', true);
INSERT INTO public.galaxy VALUES (4, 'M87', 53000000, 'Giant Elliptical', true);
INSERT INTO public.galaxy VALUES (5, 'ESO 350-40 - Cartwheel', 500000000, 'Ring', true);
INSERT INTO public.galaxy VALUES (6, 'NGC 908', 65000000, 'Starbursting', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Io', 'Jupiter', 'Volcanic', 41910000.0, 5);
INSERT INTO public.moon VALUES (3, 'Europa', 'Jupiter', 'Icy', 30900000.0, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Jupiter', 'Icy', 87200000.0, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Jupiter', 'Icy', 73000000.0, 5);
INSERT INTO public.moon VALUES (6, 'Titan', 'Saturn', 'Icy', 83000000.0, 6);
INSERT INTO public.moon VALUES (7, 'Enceladus', 'Saturn', 'Icy', 800000.0, 6);
INSERT INTO public.moon VALUES (8, 'Mimas', 'Saturn', 'Icy', 500000.0, 6);
INSERT INTO public.moon VALUES (9, 'Tethys', 'Saturn', 'Icy', 3500000.0, 6);
INSERT INTO public.moon VALUES (10, 'Dione', 'Saturn', 'Icy', 5400000.0, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', 'Saturn', 'Icy', 7700000.0, 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', 'Saturn', 'Icy', 7500000.0, 6);
INSERT INTO public.moon VALUES (1, 'Earths Moon', 'Earth', 'Scalene Ellipsoid', 38000000.0, 3);
INSERT INTO public.moon VALUES (13, 'Titania', 'Uranus', 'Icy', 3600000.0, 7);
INSERT INTO public.moon VALUES (14, 'Oberon', 'Uranus', 'Icy', 3460000.0, 7);
INSERT INTO public.moon VALUES (15, 'Umbriel', 'Uranus', 'Icy', 2420000.0, 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 'Uranus', 'Icy', 2590000.0, 7);
INSERT INTO public.moon VALUES (18, 'Miranda', 'Uranus', 'Icy', 700000.0, 7);
INSERT INTO public.moon VALUES (17, 'Triton', 'Neptune', 'Icy', 23000000.0, 8);
INSERT INTO public.moon VALUES (19, 'Nereid', 'Neptune', 'Icy', 92000.0, 8);
INSERT INTO public.moon VALUES (20, 'Charon', 'Neptune', 'Icy', 46000000.0, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (10, 'Ross 128  b', 'Medium', 'Milky Way', false, 'Ross 128 System', 'Ross 128 b', NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 'Medium', 'Milky Way', true, 'Heliocentric System', 'Earth', 1);
INSERT INTO public.planet VALUES (1, 'Mercury', 'Small', 'Milky Way', false, 'Heliocentric System', 'Mercury', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Small', 'Milky Way', false, 'Heliocentric System', 'Venus', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Small', 'Milky Way', false, 'Heliocentric System', 'Mars', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Large', 'Milky Way', false, 'Heliocentric System', 'Jupiter', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Large', 'Milky Way', false, 'Heliocentric System', 'Saturn', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Large', 'Milky Way', false, 'Heliocentric System', 'Uranus', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Large', 'Milky Way', false, 'Heliocentric System', 'Neptune', 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'Medium', 'Milky Way', false, 'Proxima Centauri System', 'Proxima Centauri b', 2);
INSERT INTO public.planet VALUES (11, 'Luyten b', 'Medium', 'Milky Way', false, 'Luyten System', 'Luyten b', 4);
INSERT INTO public.planet VALUES (12, 'GJ 1061 d', 'Medium', 'Milky Way', false, 'GJ 1061 System', 'GJ 1061 d', 5);


--
-- Data for Name: planet_moon_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moon_info VALUES (5, 'Large', 2, 41910000.0, 5, 1);
INSERT INTO public.planet_moon_info VALUES (5, 'Large', 3, 30900000.0, 5, 2);
INSERT INTO public.planet_moon_info VALUES (5, 'Large', 4, 87200000.0, 5, 3);
INSERT INTO public.planet_moon_info VALUES (5, 'Large', 5, 73000000.0, 5, 4);
INSERT INTO public.planet_moon_info VALUES (6, 'Large', 6, 83000000.0, 6, 5);
INSERT INTO public.planet_moon_info VALUES (6, 'Large', 7, 800000.0, 6, 6);
INSERT INTO public.planet_moon_info VALUES (6, 'Large', 8, 500000.0, 6, 7);
INSERT INTO public.planet_moon_info VALUES (6, 'Large', 9, 3500000.0, 6, 8);
INSERT INTO public.planet_moon_info VALUES (6, 'Large', 10, 5400000.0, 6, 9);
INSERT INTO public.planet_moon_info VALUES (6, 'Large', 11, 7700000.0, 6, 10);
INSERT INTO public.planet_moon_info VALUES (6, 'Large', 12, 7500000.0, 6, 11);
INSERT INTO public.planet_moon_info VALUES (3, 'Medium', 1, 38000000.0, 3, 12);
INSERT INTO public.planet_moon_info VALUES (7, 'Large', 13, 3600000.0, 7, 13);
INSERT INTO public.planet_moon_info VALUES (7, 'Large', 14, 3460000.0, 7, 14);
INSERT INTO public.planet_moon_info VALUES (7, 'Large', 15, 2420000.0, 7, 15);
INSERT INTO public.planet_moon_info VALUES (7, 'Large', 16, 2590000.0, 7, 16);
INSERT INTO public.planet_moon_info VALUES (7, 'Large', 18, 700000.0, 7, 17);
INSERT INTO public.planet_moon_info VALUES (8, 'Large', 17, 23000000.0, 8, 18);
INSERT INTO public.planet_moon_info VALUES (8, 'Large', 19, 92000.0, 8, 19);
INSERT INTO public.planet_moon_info VALUES (8, 'Large', 20, 46000000.0, 8, 20);
INSERT INTO public.planet_moon_info VALUES (11, 'Medium', NULL, NULL, NULL, 21);
INSERT INTO public.planet_moon_info VALUES (12, 'Medium', NULL, NULL, NULL, 22);
INSERT INTO public.planet_moon_info VALUES (10, 'Medium', NULL, NULL, NULL, 23);
INSERT INTO public.planet_moon_info VALUES (2, 'Small', NULL, NULL, NULL, 24);
INSERT INTO public.planet_moon_info VALUES (4, 'Small', NULL, NULL, NULL, 25);
INSERT INTO public.planet_moon_info VALUES (1, 'Small', NULL, NULL, NULL, 26);
INSERT INTO public.planet_moon_info VALUES (9, 'Medium', NULL, NULL, NULL, 27);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Milky Way', 'Yellow Dwarf', 'Heliocentric System', 'spiral');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Milky Way', 'Red Dwarf', 'Alpha Centauri System', 'spiral');
INSERT INTO public.star VALUES (3, 'Ross 128', 'Milky Way', 'Red Dwarf', 'Ross 128 System', 'spiral');
INSERT INTO public.star VALUES (4, 'Luytens Star', 'Milky Way', 'Red Dwarf', 'Luyten System', 'spiral');
INSERT INTO public.star VALUES (5, 'GJ 1061', 'Milky Way', 'Red Dwarf', 'Horologium System', 'spiral');
INSERT INTO public.star VALUES (6, 'UY scuti', 'Milky Way', 'Red Giant', 'UY Scuti System', 'spiral');


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: planet_moon_info planet_moon_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon_info
    ADD CONSTRAINT planet_moon_info_pkey PRIMARY KEY (planet_moon_info_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


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
-- Name: galaxy unique_galaxy_type; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_type UNIQUE (galaxy_type);


--
-- Name: planet unique_moon_system; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_moon_system UNIQUE (moon_system);


--
-- Name: planet_moon_info unique_planet_moon_info; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon_info
    ADD CONSTRAINT unique_planet_moon_info UNIQUE (planet_moon_info_id);


--
-- Name: star fk_galaxy_type; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_type FOREIGN KEY (galaxy_type) REFERENCES public.galaxy(galaxy_type);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

