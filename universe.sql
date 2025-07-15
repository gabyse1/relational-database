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
    name character varying(50) NOT NULL,
    diameter_light_years numeric NOT NULL,
    constellation character varying(30) NOT NULL,
    galaxy_type_id integer,
    stars_like_sun_billion integer
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    shape character varying(30) NOT NULL,
    features text,
    has_galactic_core boolean
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_from_planet_km numeric,
    diameter_km numeric,
    age_billion_years numeric,
    gravity_ms2 numeric,
    has_water boolean NOT NULL,
    planet_id integer,
    surface text,
    atmosphere text
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
    name character varying(50) NOT NULL,
    diameter_km numeric,
    density_gcm3 numeric,
    has_gravity boolean,
    planet_type_id integer,
    star_id integer,
    surface text,
    atmosphere text,
    num_moons integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    composition text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter_km numeric,
    temperature_kelvin numeric,
    age_billion_years numeric,
    composition text,
    distance_from_earth_light_years numeric,
    galaxy_id integer
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 110000, 'Sagittarius', 1, 40);
INSERT INTO public.galaxy VALUES (2, 'Messier 87', 120000, 'Virgo', 2, 100);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 14000, 'Dorado', 3, 3);
INSERT INTO public.galaxy VALUES (4, 'NGC 5866', 60000, 'Draco', 4, 7);
INSERT INTO public.galaxy VALUES (5, 'NGC 1300', 110000, 'Eridanus', 1, 8);
INSERT INTO public.galaxy VALUES (6, 'NGC 1097', 140000, 'Fornax', 1, 14);
INSERT INTO public.galaxy VALUES (7, 'NGC 4449', 20000, 'Canes Venatici', 3, 1);
INSERT INTO public.galaxy VALUES (8, 'Messier 60', 125000, 'Virgo', 2, 50);
INSERT INTO public.galaxy VALUES (9, 'Messier 49', 157000, 'Virgo', 2, 14);
INSERT INTO public.galaxy VALUES (10, 'NGC 3115', 80000, 'Sextans', 4, 7);
INSERT INTO public.galaxy VALUES (11, 'Andromeda Messier 31', 220000, 'Andromeda', 1, 10);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Barred Spiral', 'Flat', 'Have lots of gas and dust; active star formation in the arms.', true);
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'Elliptical or spherical', 'Little gas and dust; mostly old stars; low star formation.', true);
INSERT INTO public.galaxy_type VALUES (3, 'Barred Irregular', 'No defined', 'Often rich in gas and dust; vigorous star formation.', false);
INSERT INTO public.galaxy_type VALUES (4, 'Lenticular', 'Lens-like structure', 'Has a central bulge and disk but no spiral arms; little gas and dust.', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384400, 3474, 4.5, 1.62, true, 3, 'Rocky, dusty, with plains, craters, and mountains', 'Extremely thin exosphere (not breathable)');
INSERT INTO public.moon VALUES (2, 'Phobos', 6000, 22.4, 4.3, 0.0057, false, 4, 'Dark, dusty, heavily cratered, carbon-rich', 'None');
INSERT INTO public.moon VALUES (3, 'Deimos', 23460, 12.4, 4.3, 0.003, false, 4, 'Smoother than Phobos, dusty regolith', 'None');
INSERT INTO public.moon VALUES (4, 'Io', 421700, 3643, 4.5, 1.796, false, 5, 'Volcanically active; covered with sulfur and lava flows', 'Very thin; mostly sulfur dioxide (SO₂)');
INSERT INTO public.moon VALUES (5, 'Europa', 670900, 3122, 4.5, 1.315, true, 5, 'Smooth, icy crust with cracks & ridges', 'Very thin; mostly oxygen (O₂), not breathable');
INSERT INTO public.moon VALUES (6, 'Ganymede', 1070000, 5268, 4.5, 1.43, true, 5, 'Mix of two types: dark, cratered regions and lighter, grooved terrain caused by tectonic processes', 'Very thin; mostly oxygen, but not breathable – includes O₂, and traces of ozone and hydrogen');
INSERT INTO public.moon VALUES (7, 'Callisto', 1882700, 4820, 4.5, 1.24, true, 5, 'Heavily cratered, ancient, icy surface – one of the oldest in the Solar System', 'Extremely thin atmosphere of carbon dioxide (CO₂) and some oxygen (O₂)');
INSERT INTO public.moon VALUES (8, 'Titan', 1222000, 1150, 4.5, 1.35, true, 6, 'Icy crust, methane/ethane lakes, dunes, cryovolcanoes', 'Thick, mostly nitrogen, with methane and hydrocarbons');
INSERT INTO public.moon VALUES (9, 'Enceladus', 238000, 504, 4.5, 0.113, true, 6, 'Icy, bright, highly reflective', 'Very thin; mostly water vapor');
INSERT INTO public.moon VALUES (10, 'Mimas', 185520, 396, 4.5, 0.064, true, 6, 'Heavily cratered and icy; most famous for the large Herschel Crater, which makes Mimas look like the Death Star', 'None (Mimas has no significant atmosphere)');
INSERT INTO public.moon VALUES (11, 'Titania', 436300, 1578, 4.5, 0.367, true, 7, 'Icy, with impact craters, fault valleys, and signs of past geological activity', 'Extremely thin, almost negligible; no significant atmosphere');
INSERT INTO public.moon VALUES (12, 'Oberon', 583500, 1522, 4.5, 0.346, true, 7, 'Rocky and icy, heavily cratered, dark', 'No significant atmosphere');
INSERT INTO public.moon VALUES (13, 'Miranda', 129900, 471, 4.5, 0.079, true, 7, 'Extremely varied with deep canyons, cliffs, ridges, and impact craters', 'None — Miranda has no significant atmosphere');
INSERT INTO public.moon VALUES (14, 'Triton', 354800, 2706, 4.5, 0.779, true, 8, 'Mostly frozen; composed of nitrogen ice, water ice, and some rocky material; has geysers and cryovolcanoes', 'Thin atmosphere, primarily composed of nitrogen with traces of methane');
INSERT INTO public.moon VALUES (15, 'Hi''iaka', 49880, 310, 4.5, 0.05, true, 9, 'Likely covered with water ice, very reflective (high albedo)', 'None');
INSERT INTO public.moon VALUES (16, 'Namaca', 25657, 170, 4.5, 0, true, 9, 'Likely composed of water ice, similar to Haumea', 'None');
INSERT INTO public.moon VALUES (17, 'Dysnomia', 37400, 700, 4.5, 0.02, true, 10, 'Likely icy; too distant for detailed surface observations', 'No atmosphere detected');
INSERT INTO public.moon VALUES (18, 'Charon', 19640, 1212, 4.5, 0.288, true, 12, 'Icy, with canyons, ridges, and regions of dark material (possibly tholins)', 'Extremely thin or nearly nonexistent (no substantial atmosphere detected)');
INSERT INTO public.moon VALUES (19, 'MK2', 21000, 175, 4.5, 0.02, true, 13, 'Likely dark, non-reflective, possibly composed of carbon-rich material', 'None detected');
INSERT INTO public.moon VALUES (20, 'Vanth', 9000, 440, 4.5, 0.02, true, 16, 'Dark and icy, possibly with organic-rich material', 'None detected');
INSERT INTO public.moon VALUES (21, 'Weywot', 14500, 170, 4.5, 0.04, true, 17, 'Likely icy and rocky, similar to other small trans-Neptunian objects', 'None detected');
INSERT INTO public.moon VALUES (22, 'Xiangliu', 15000, 237, 4.5, 0.02, true, 18, 'Likely icy and heavily cratered', 'None detected');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4880, 5.43, true, 1, 1, 'Rocky, covered with craters, similar to Earth''s Moon', 'Very thin exosphere made of oxygen, sodium, hydrogen, helium, and potassium (not breathable)', 0);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, 5.24, true, 1, 1, 'Rocky, with mountains, plains, and many volcanoes; very hot (465°C average)', 'Thick and toxic; mostly carbon dioxide (CO₂) with clouds of sulfuric acid; very high pressure (92 times Earth''s)', 0);
INSERT INTO public.planet VALUES (3, 'Earth', 12742, 5.51, true, 1, 1, '71% water, 29% land; diverse with oceans, continents, mountains, forests, deserts, etc.', 'Composed mainly of nitrogen (78%) and oxygen (21%), with traces of argon, carbon dioxide, and water vapor.', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6779, 3.93, true, 1, 1, 'Rocky, dusty, covered with iron oxide (reddish color); features include volcanoes, canyons, and polar ice caps', 'Thin; mostly carbon dioxide (CO₂ 95%), with traces of nitrogen and argon; not breathable for humans', 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 142984, 1.33, true, 2, 1, 'No solid surface; it is a gas giant with a dense atmosphere over a possible liquid or metallic core', 'Mainly hydrogen and helium; contains ammonia, methane, and water vapor — features thick cloud bands and the Great Red Spot (a massive storm)', 4);
INSERT INTO public.planet VALUES (6, 'Saturn', 120500, 0.687, true, 2, 1, 'No solid surface; composed mostly of fluid and gas', 'Mainly hydrogen and helium, with traces of methane, ammonia, and other gases; features strong winds and storms (like the Great White Spot)', 3);
INSERT INTO public.planet VALUES (7, 'Uranus', 50724, 1.27, true, 3, 1, 'No solid surface; it''s a gas/ice giant with a fluid outer layer', 'Composed mainly of hydrogen (H₂), helium (He), and methane (CH₄); gives Uranus its pale blue color', 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 49244, 1.64, true, 4, 1, 'No solid surface; composed of gas and ice layers', 'Hydrogen, helium, and methane (gives it a blue color)', 1);
INSERT INTO public.planet VALUES (9, 'Haumea', 1960, 3, true, 5, 1, 'Icy, mostly crystalline water ice; highly reflective with rapid rotation', 'No known atmosphere', 2);
INSERT INTO public.planet VALUES (10, 'Eris', 2326, 0.27, true, 5, 1, 'Likely icy, covered with methane frost and possibly nitrogen ice', 'Very thin or possibly no atmosphere; may form a temporary atmosphere when closer to the Sun due to sublimating ices', 1);
INSERT INTO public.planet VALUES (11, 'Kepler-10b', 14460, 3.33, true, 5, 3, 'Very hot, possibly molten rock or lava due to extreme heat', 'Likely none or extremely thin — any atmosphere would be stripped by the intense stellar radiation', 0);
INSERT INTO public.planet VALUES (12, 'Pluto', 2377, 1.86, true, 5, 1, 'Rocky and icy, with plains of nitrogen ice, mountains of water ice, and dark/red regions like Cthulhu Macula', 'Thin; primarily nitrogen with small amounts of methane and carbon monoxide; it expands when closer to the Sun and collapses when farther away.', 1);
INSERT INTO public.planet VALUES (13, 'Makemake', 1430, 1.7, true, 5, 1, 'Icy surface with frozen methane, ethane, and possibly nitrogen', 'Extremely thin or possibly absent; may have transient gases', 1);
INSERT INTO public.planet VALUES (14, 'Ceres', 946, 2.16, true, 5, 1, 'Rocky and icy; contains clay minerals and water ice; has some bright spots (salt deposits)', 'Very thin, transient exosphere; contains water vapor (possibly from sublimating ice)', 0);
INSERT INTO public.planet VALUES (15, 'Sedna', 995, 1.5, true, 5, 1, 'Reddish, icy surface with possible tholins; very cold (~–240°C)', 'None detected (possible transient atmosphere when closer to Sun)', 0);
INSERT INTO public.planet VALUES (16, 'Orcus', 910, 1.5, true, 5, 1, 'Icy with water ice and possible ammonia; moderately bright (reflective)', 'None detected', 1);
INSERT INTO public.planet VALUES (17, 'Quaoar', 1110, 2, true, 5, 1, 'Likely icy and rocky, with water ice and possibly methane or ammonia', 'Very thin or possibly none; recent hints of a faint, patchy atmosphere (likely methane-based)', 1);
INSERT INTO public.planet VALUES (18, 'Gonggong', 1230, 1.75, true, 5, 1, 'Likely covered in water ice and possibly methane ice; dark and reddish in color', 'Very tenuous or possibly none; traces of volatile gases like methane may escape', 1);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Mostly rock and metal');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Mostly hydrogen and helium');
INSERT INTO public.planet_type VALUES (3, 'Ice Giants', 'Water, ammonia, methane ices with rocky cores');
INSERT INTO public.planet_type VALUES (4, 'Dwarf ', 'Rock, ice');
INSERT INTO public.planet_type VALUES (5, 'Exoplanets', 'Mostly rock and metal, with an iron-rich core and silicate mantle.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1392700, 5778, 4.6, 'Hydrogen, helium, heavy metals (oxygen, carbon, nitrogen,neon)', 0.00001581, 1);
INSERT INTO public.star VALUES (2, 'Barnard', 272000, 3134, 10, 'Hydrogen, helium, metals', 5.96, 1);
INSERT INTO public.star VALUES (3, 'Kepler-10', 1470000, 5700, 11.9, 'Hydrogen, helium, metals', 564, 1);
INSERT INTO public.star VALUES (4, 'R136a1', 52000000, 53000, 0.0015, 'Nitrogen, hydrogen', 163000, 3);
INSERT INTO public.star VALUES (5, 'S Doradus', 400000000, 15000, 0.0035, 'Hydrogen, helium, oxygen, carbon, nitrogen', 160000, 3);
INSERT INTO public.star VALUES (6, 'V1 Hubbles Variable', 150000000, 6000, 0.0025, 'Hydrogen, helium, metals, carbon, nitrogen, oxygen, iron, etc.', 2500000, 11);
INSERT INTO public.star VALUES (7, 'Rigel', 109000000, 11000, 0.009, 'Hydrogen, helium, carbon, nitrogen, oxygen', 860, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 11, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 5, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

