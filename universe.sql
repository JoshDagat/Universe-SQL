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

\connect universe SET statement_timeout = 0;

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
    diameter_in_10_000_light_years numeric(3, 1),
    name_origin text,
    description text,
    galaxy_type_id integer,
    life_found boolean
);

ALTER TABLE public.galaxy OWNER TO freecodecamp;

--

-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp

--

CREATE SEQUENCE public.galaxy_galaxy_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

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
    description text
);

ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--

-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp

--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--

-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp

--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;

--

-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp

--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    diameter_in_km numeric(5, 1),
    name_origin text,
    description text,
    planet_id integer
);

ALTER TABLE public.moon OWNER TO freecodecamp;

--

-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp

--

CREATE SEQUENCE public.moon_moon_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

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
    diameter_in_km numeric(7, 1),
    no_of_natural_satellites integer,
    name_origin text,
    description text,
    planet_type_id integer,
    has_life boolean,
    star_id integer
);

ALTER TABLE public.planet OWNER TO freecodecamp;

--

-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp

--

CREATE SEQUENCE public.planet_planet_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

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
    name character varying(30) NOT NULL,
    description text NOT NULL
);

ALTER TABLE public.planet_type OWNER TO freecodecamp;

--

-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp

--

CREATE SEQUENCE public.planet_type_planet_type_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--

-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp

--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;

--

-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp

--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    diameter_in_million_km numeric(6, 2),
    name_origin text,
    description text,
    galaxy_id integer
);

ALTER TABLE public.star OWNER TO freecodecamp;

--

-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp

--

CREATE SEQUENCE public.star_star_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--

-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp

--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;

--

-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp

--

ALTER TABLE
    ONLY public.galaxy
ALTER COLUMN
    galaxy_id
SET
    DEFAULT nextval('public.galaxy_galaxy_id_seq' :: regclass);

--

-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp

--

ALTER TABLE
    ONLY public.galaxy_type
ALTER COLUMN
    galaxy_type_id
SET
    DEFAULT nextval(
        'public.galaxy_type_galaxy_type_id_seq' :: regclass
    );

--

-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp

--

ALTER TABLE
    ONLY public.moon
ALTER COLUMN
    moon_id
SET
    DEFAULT nextval('public.moon_moon_id_seq' :: regclass);

--

-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp

--

ALTER TABLE
    ONLY public.planet
ALTER COLUMN
    planet_id
SET
    DEFAULT nextval('public.planet_planet_id_seq' :: regclass);

--

-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp

--

ALTER TABLE
    ONLY public.planet_type
ALTER COLUMN
    planet_type_id
SET
    DEFAULT nextval(
        'public.planet_type_planet_type_id_seq' :: regclass
    );

--

-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp

--

ALTER TABLE
    ONLY public.star
ALTER COLUMN
    star_id
SET
    DEFAULT nextval('public.star_star_id_seq' :: regclass);

--

-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp

--

INSERT INTO
    public.galaxy
VALUES
    (
        1,
        'Milky Way',
        11.0,
        'The Milky Way gets its name from a Greek myth
about the goddess Hera who sprayed milk across 
the sky.
',
        'The Milky Way is a huge collection of stars, dust
and gas. It''s called a spiral galaxy because if you 
could view it from the top or bottom, it would look
like a spinning pinwheel. The sun is located on one
of the spiral arms, about 25,000 light-years away
from its center.
',
        4,
        true
    );

INSERT INTO
    public.galaxy
VALUES
    (
        2,
        'Andromeda',
        22.0,
        'The galaxy''s name stems from the area of Earth''s sky
in which it appears, the constellation of Andromeda, which 
itself if named after the Ethiopian(or Phoenician) princess 
who was the wife of Perseus in Greek mythology.
',
        'Andromeda, also known as Messier 31 (M31), is a spiral
galaxy located about 2.5 million light years away. It is
thought that the Milky Way and Andromeda will collide
several billion years from now. The black holes located
in both galaxies will then reside in the large, elliptical
galaxy that results from this merger.
',
        4,
        false
    );

INSERT INTO
    public.galaxy
VALUES
    (
        4,
        'Large Magellanic Cloud',
        1.4,
        'Although this galaxy has been known to the ancients as far back as
the first millenia. However, the accepted idea is that Antonio Pigafetta
reported the galaxy during his voyage with Ferdinand Magellan. However,
naming the clouds after Magellan did not become widespread until
much later.
',
        'The Large Magellanic Cloud, or Nubecula Major
is a satellite galaxy of the Milky Way. At a 
distance of around 50 kiloparsecs, the LMC is 
the second- or third-closest galaxt to the
Milky Way, after the Sagittarius Dwarf Spheroidal
and the possible dwarf irregular galaxy known as
the Canis Major Overdensity.
',
        9,
        false
    );

INSERT INTO
    public.galaxy
VALUES
    (
        3,
        'Small Magellanic Cloud',
        0.7,
        'Although this galaxy has been known to the ancients as far back as
the first millenia. However, the accepted idea is that Antonio Pigafetta
reported the galaxy during his voyage with Ferdinand Magellan. However,
naming the clouds after Magellan did not become widespread until
much later.
',
        'Even though it is a small, or so-called dwarf galaxy,
the SMC is so bright that it is visible to the unaided
eye from the Southern Hemisphere and near the equator.
Many navigators, including Ferdinand Magellan who lends 
his name to the SMC, used it to help find their way
across the oceans.
',
        10,
        false
    );

INSERT INTO
    public.galaxy
VALUES
    (
        5,
        'Black Eye',
        5.3,
        'The Black Eye Galaxy (Messier 64) has a spectacular dark band
of absorbing dust in fron of the galaxy''s bright nucleus,
giving rise to its nicknames of the "Black Eye" or "Evil Eye" galaxy.
',
        'The Black Eye Galaxy is a relatively isolated spiral
galaxy 17 million light-years away in the mildly
northern constellation of Coma Berenices. It was
discovered by Edward Pigott in March 1779, and
independently by Johann Elert Bode in April of
the same year, as well as by Charles Messier the next
year.
',
        3,
        false
    );

INSERT INTO
    public.galaxy
VALUES
    (
        6,
        'Whirlpool',
        6.0,
        'The galaxy is nicknamed the Whirlpool because of its swirling structure.
The Whirlpool''s most striking feature is its two curving arms, a hallmark
of so-called grand-design spiral galaxies.
',
        'The Whirlpool Galaxy, also known as Messier 51a,
M51a, and NGC 5194, is an interacting grand-design
spiral galaxy with a Seyfert 2 active galactic
nucleus. It lies in the constellation Canes Venatici,
and was the first galaxy to be classified as a spiral
galaxy. Its distance is 31 million light-years away
from Earth.
',
        3,
        false
    );

--

-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp

--

INSERT INTO
    public.galaxy_type
VALUES
    (
        1,
        'Ellipticals',
        'These galaxies have an ellipsoidal profile, giving them an
elliptical appearnce regardless of the viewing angle. Their
appearance shows little structure and they typically have
relatively little interstellar matter.
'
    );

INSERT INTO
    public.galaxy_type
VALUES
    (
        2,
        'Shell Galaxy',
        'A shell galaxy is a type of elliptical galaxy where the
stars in its halo are arranged in concentric shells.
These structures are thought to develop when a larger
galaxy absorbs a smaller companion galaxy.
'
    );

INSERT INTO
    public.galaxy_type
VALUES
    (
        3,
        'Spirals',
        'Spiral galaxies resemble spiraling pinwheels. Though 
the stars and other visible material contained in such
a galaxy lie mostly on a plane, the majority of mass in
spiral galaxies exists in a roughly spherical halo of
dark matter which extends beyond the visible component,
as demonstrated by the universal rotation curve concept.
'
    );

INSERT INTO
    public.galaxy_type
VALUES
    (
        4,
        'Barred Spiral Galaxy',
        'A majority of spiral galaxies, including our own Milky Way
galaxy, have a linear, bar-shaped band of stars that extends
outward to either side of the core, then merges into the
spiral arm structure. Bars are thought to be temporary
structures that can occur as a result of a density wave
radiating outward from the core, or else due to a tidal
interaction with another galaxy. Many barred galaxies are
active, possible as a result of gas being channeled into
the core along the arms.
'
    );

INSERT INTO
    public.galaxy_type
VALUES
    (
        5,
        'Super-Luminous Spiral',
        'Recently, researchers described galaxies called super-
luminous spirals. They are very large with an upward
diamter of 437,000 light years. With a mass of 
340 billion solar masses, they generate a significant
amount of ultraviolet and mid-infrared light. They are
thought to have an increased star formation rate
around 3- times faster than the Milky Way.\n'
    );

INSERT INTO
    public.galaxy_type
VALUES
    (
        6,
        'Peculiar Galaxies',
        'Are galactic formations that develop unusual properties
due to tidal interatction with other galaxies.
'
    );

INSERT INTO
    public.galaxy_type
VALUES
    (
        7,
        'Ring Galaxy',
        'Has a ring-like structure of stars and interstellar medium
surrounding a bare core. A ring galaxy is though to occur
when a smaller galaxy passes through the core of a spiral
galaxy.
'
    );

INSERT INTO
    public.galaxy_type
VALUES
    (
        8,
        'Lenticular Galaxy',
        'Is an intermediate from that has properties of both
elliptical and spiral galaxies.
'
    );

INSERT INTO
    public.galaxy_type
VALUES
    (
        9,
        'Irregular-I Galaxy',
        'Has some structure but does not align cleanly with the
Hubble classification scheme.
'
    );

INSERT INTO
    public.galaxy_type
VALUES
    (
        10,
        'Irregular-II Galaxy',
        'These do not possess any structure that resembles a Hubble
classification, and may have benn disrupted.
'
    );

INSERT INTO
    public.galaxy_type
VALUES
    (
        11,
        'Ultra Diffuse Galaxy',
        'Is an extremely-low-density galaxy. It may be the same
size as the Milky Way, but have a visbile star count only
one percent of the Milky Way''s. Its lack of luminosity is
due to a lack of star-forming gas, resulting in old stellar
populations.
'
    );

--

-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp

--

INSERT INTO
    public.moon
VALUES
    (
        9,
        'Amalthea',
        167.0,
        'Named after the nymph Amalthea from Greek
mythology, who nursed the infant Zeus(Jupiter) with goat''s milk.',
        'Amalthea has the third closest orbit around Jupiter
among known moons and was the 5th moon of Jupiter
to be discovered. It is also the 5th largest moon of Jupiter, after
the four Galilean Moons.
',
        5
    );

INSERT INTO
    public.moon
VALUES
    (
        10,
        'Mimas',
        396.4,
        'Named after Mimas, one of the Giants
in Greek Mythology.
',
        'Mimas is the smalles astronomical body that is
known to still be rounded in shape because of self-gravitation.
',
        6
    );

INSERT INTO
    public.moon
VALUES
    (
        11,
        'Enceladus',
        504.2,
        'Named after Enceladus, one of the
Giants of Greek mythology.
',
        'Enceladus is th 6th largest moon of Saturn.
Enceladus has a wide range of surface features, rangin from old,
heavily cratered regions to young, tectonically deformed terrains.
',
        6
    );

INSERT INTO
    public.moon
VALUES
    (
        12,
        'Tethys',
        1066.2,
        'Named after the titan Tethys of Greek mythology.
',
        'Tethys has the lowest density of all the major moons
in the Solar System, indicating that is is made of water ice
with just a small fraction of rock.
',
        6
    );

INSERT INTO
    public.moon
VALUES
    (
        13,
        'Titan',
        5149.4,
        'The name Titan comes from the Titans,
a race of immortals in Greek mythology.
',
        'Titan is the largest moon of Saturn and the second-largest
natural satellite in the Solar System. It is the only moon 
known to have a dense atmosphere, and is the only known object
in space other than Earth on which clear evidence of stable bodies 
of surface liquid has been found.
',
        6
    );

INSERT INTO
    public.moon
VALUES
    (
        17,
        'Titania',
        1577.8,
        'The name Titania is ancient Greek for "Daugther of Titans".
',
        'Titania is the largest of the moons of Uranus and
the 8th largest moon in the Solar System.
',
        7
    );

INSERT INTO
    public.moon
VALUES
    (
        21,
        'Nereid',
        340.0,
        'Named after the Nereids, sea-nymphs of
Greek mythology and attendants of the god Neptune.
',
        'Nereid is the 3rd largest moon of neptune. Of all known
moons in the Solar System, it has the most eccentric orbit.
',
        8
    );

INSERT INTO
    public.moon
VALUES
    (
        8,
        'Callisto',
        4820.6,
        'Named after one of Zeus''s many lovers.
Callisto was a nymph who was
associated with the goddess of the hunt, Artemis.
',
        'Callisto is the 2nd largest moon of Jupiter, after Ganymede.
It is the 3rd largest moon in the Solar System after Ganymede
and Saturn''s largest moon Titan, and the largest object in the
Solar System that may not be properly differentiated.
',
        5
    );

INSERT INTO
    public.moon
VALUES
    (
        14,
        'Hyperion',
        270.0,
        'Named after the titan Hyperion, god of watchfulness
and observation, elder brother of Cronus.
',
        'Hyperion is distinguished by its irregular shape,
its chaotic rotation, and its unexplained sponge-like appearance.
It was the first non-roun moon to be discovered.
',
        6
    );

INSERT INTO
    public.moon
VALUES
    (
        15,
        'Ariel',
        1157.8,
        'Named after Ariel, the leading sylph in The Rope of the Lock.
It is also the name of the spirit who serves Prospero
in Shakespeare''s The Tempest.
',
        'Ariel is the 4th largest of the 27 known
moons of Uranus. Ariel orbits and rotates in the equatorial plane
of Uranus, which is almost perpendicular to the orbit of Uranus
and so has an extreme seasonal cycle.
',
        7
    );

INSERT INTO
    public.moon
VALUES
    (
        16,
        'Umbriel',
        1169.4,
        'Umbriel is the "dusky melancholy sprite" in
Alexander Pope''s The Rape of the Lock, and the name suggests the
Latin umbra, meaning shadow.
',
        'Umbriel consists mainly of ice with a substantial
fraction of rock, and may be differentiated into a rocky core and 
an icy mantle. The surface is the darkest among uranian moons,
and appears to have been shapred primarily by impacts.
',
        7
    );

INSERT INTO
    public.moon
VALUES
    (
        18,
        'Oberon',
        1979.6,
        'The name Oberon was derived from Oberon,
the King of the Fairies in A Midsummer Night''s Dream.
',
        'Oberon is the outermost major moon of the planet Uranus.
It is the 2nd largest and 2nd most massive of the Uranian moons,
and the 9th most massive moon in the Solar System.
',
        7
    );

INSERT INTO
    public.moon
VALUES
    (
        19,
        'Miranda',
        471.6,
        'Named "Miranda" after the character in Shakespeare''s The Tempest,
because the four previously discovered moons of Uranus, Ariel, Umbriel,
Titania and Oberon, had all been named after characters of Shakespeare or
Alexander Pope. However, the previous moons had been name specifically
after fairies, whereas Miranda was a human.
',
        'Miranda is the smalles and innermost of Uranus''s five round satellites.
',
        7
    );

INSERT INTO
    public.moon
VALUES
    (
        2,
        'Moon',
        3476.0,
        'The noun moon is derived from Old English mōna,
which stems from Proto-Germanic mēnōn, which in turn
comes from Proto-Indo-European mēnsis "month" which
may be related to the verb "measure" (of time).
',
        'The Moon is Earth''s only natural satellite.
It is the 5th larggest satellite in the Solar System.
It is the largest satellite in the Solar System relative to its major planet,
and larger than any known dwarf planet.
',
        3
    );

INSERT INTO
    public.moon
VALUES
    (
        3,
        'Phobos',
        22.5,
        'Named after Phobos, the companion
of the God Ares(Greek mythos).
',
        'Phobos is the innermost and larger
of the two natural satellites of Mars.
',
        4
    );

INSERT INTO
    public.moon
VALUES
    (
        4,
        'Deimos',
        12.4,
        'Named after Deimos, a figure representing
dread in Greek mythology.
',
        'Deimos is the smaller and outermost
of the two natural satellites of Mars.
',
        4
    );

INSERT INTO
    public.moon
VALUES
    (
        5,
        'Io',
        3643.2,
        'Named after Io, a mythical figure
captured by Jupiter for secret love.
',
        'Io is the 4th largest moon in the Solar System. It has the 
highest density of any moon, the strongest surface gravity of any moon,
and the lowest amount of water(by atomic ratio) of any known
astronomical object in the Solar System.
',
        5
    );

INSERT INTO
    public.moon
VALUES
    (
        6,
        'Europa',
        3121.6,
        'Named after Europa, the Phoenician mother of
King Minos of Crete and lover of Zeus(Jupiter).
',
        'Europa is the smallest of the four Galilean moons
orbiting Jupiter, and the 6th closest to the planet
of all the 80 known moons of Jupiter. It is also
the 6th largest moon in the Solar System.
',
        5
    );

INSERT INTO
    public.moon
VALUES
    (
        7,
        'Ganymede',
        5268.2,
        'Named after the mytological Ganymede, a
Trojan prince desired by Zeus(Jupiter).
',
        'Is the largest and most massive of the Solar System''s moons.
The 9th largest object(including the Sun) of the Solar System,
and is the largest without a substantial atmosphere.

',
        5
    );

INSERT INTO
    public.moon
VALUES
    (
        20,
        'Triton',
        2706.8,
        'Named after the Greek sea god Triton,
the son of Poseidon.
',
        'Triton is the largest natural satellite of the planet Neptune.
It is the only large moon in the Solar Sytem with a retrograde orbit.
Because of its retrograde orbit and composition similar to Pluto,
Triton is thought to have been a dwarf planet, captured from
the Kuiper belt.
',
        8
    );

--

-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp

--

INSERT INTO
    public.planet
VALUES
    (
        6,
        'Saturn',
        116460.0,
        82,
        'The planet is named for the Roman god of agriculture
and wealth, who was also the father of Jupiter.
',
        'Saturn is a gas giant made up mostly of 
hydrogen and helium. Saturn''s volume is
greater than 760 Earths, and it is the 
second most massive planet in the Solar
System. The Ringed Planet is the least
dense of all the planets, and is the only 
one less dense than water.
',
        29,
        false,
        1
    );

INSERT INTO
    public.planet
VALUES
    (
        7,
        'Uranus',
        50724.0,
        27,
        'The name Uranus is a Latinized version of the
Greek god of the sky, Ouranos.
',
        'Uranus owes its vibrant blue-green hues
not from unusual oceans but from an upper 
atmosphere flush with methane, which absorbs 
the sun''s red light and scatters blue light 
back to our eyes. The rest of the planet''s 
atmosphere is largely made of hydrogen and
helium, with scant ammounts of ammonia,
water, and methane.
',
        29,
        false,
        1
    );

INSERT INTO
    public.planet
VALUES
    (
        1,
        'Mercury',
        4879.4,
        NULL,
        'The Romans named the planet after the swift-footed
Roman messenger god Mercury(Latin Mercurius) which
they equated with the Greek Hermes, because it
moves across the sky faster than any other planet.
',
        'Mercury is one of four terrestrial planets
in the Solar System. It is also the smallest
planet in the Solar System.
',
        40,
        false,
        1
    );

INSERT INTO
    public.planet
VALUES
    (
        2,
        'Venus',
        12104.0,
        NULL,
        'Named after the Roman goddess of love and beauty.
',
        'Venus is the brightest natural object
in Earth''s night sky after the Moon.
Venus can cast shadows and can be visible
to the naked eye in broad daylight.
',
        40,
        false,
        1
    );

INSERT INTO
    public.planet
VALUES
    (
        4,
        'Mars',
        6779.0,
        2,
        'Mars was named by the ancient Romans
for their god of war because its reddish
color was reminiscent of blood.
',
        'Mars is sometimes called the Red Planet.
It''s red because of rusty iron in the ground.
Like Earth, Mars has seasons, polar ice caps,
volcanoes, canyons, and weather. It has a very 
thin atmosphere made of carbon dioxide, nitrogen,
and argon.
',
        40,
        false,
        1
    );

INSERT INTO
    public.planet
VALUES
    (
        9,
        'Proxima Centauri b',
        NULL,
        NULL,
        'The established planet-naming convention used by
planet-finding astronomers is to give the newly
discovered planet the name of the star followed
by lower case letters starting with "b" for the
first planet discovered, "c" for the next one found,
and so on.
',
        'Proxima Centauri b is a Super Earth 
exoplanet that orbits an M-type star.
Its mass is 1.27 Earths, it takes 11.2 days 
to complete one orbit of its star, and is
0.0485 AU from its star. Its discovery was 
announce in 2016.
',
        6,
        false,
        2
    );

INSERT INTO
    public.planet
VALUES
    (
        11,
        'Proxima Centauri d',
        NULL,
        NULL,
        'The established planet-naming convention used by
planet-finding astronomers is to give the newly
discovered planet the name of the star followed
by lower case letters starting with "b" for the
first planet discovered, "c" for the next one found,
and so on.
',
        'Proxima Centauri d is a sub-Earth oribiting 
at roughly 0.029 AU every 5.1 days. It is the 
least massive and innermost known planet of the 
Proxima Centauri system.
',
        8,
        false,
        2
    );

INSERT INTO
    public.planet
VALUES
    (
        12,
        'TRAPPIST-1b',
        NULL,
        NULL,
        'The established planet-naming convention used by
planet-finding astronomers is to give the newly
discovered planet the name of the star followed
by lower case letters starting with "b" for the
first planet discovered, "c" for the next one found,
and so on.
',
        'TRAPPIST-1b is a super Earth exoplanet that 
orbits an M-type star. Its mass is 1.374 Earths, 
it takes 1.5 days to complete one orbit of its
star, and is 0.01154 AU from its star. Its
discovery was announced in 2016.
',
        6,
        false,
        3
    );

INSERT INTO
    public.planet
VALUES
    (
        3,
        'Earth',
        12742.0,
        1,
        'The name Earth is an English / German name which
simply means the ground. It comes from the Old English
words ''eor(th)e'' and ''ertha''. In German it is
''erde''. The name Earth is at least 1000 years old.
',
        'Earth is an oblate spheroid. This means
it is spherical in shape, but not 
perfectly round. It has a slightly greater 
radius at the Equator. In addition to
bulging in the middle, Earth''s poles are
slightly flattened.
',
        40,
        true,
        1
    );

INSERT INTO
    public.planet
VALUES
    (
        5,
        'Jupiter',
        139820.0,
        80,
        'Jupiter, being the biggest planet in the Solar System,
gets its name from the king of the ancient Roman Gods.
',
        'Jupiter is covered in swirling cloud stripes. 
It has big storms like the Great Red Spot,
which has been going for hundreds of years.
Jupiter is a gas giant and doesn''t have a
solid surface, but it may have a solid inner
core about the size of Earth. Jupiter also
has rings, but they''re too faint to see very well.
',
        29,
        false,
        1
    );

INSERT INTO
    public.planet
VALUES
    (
        8,
        'Neptune',
        49244.0,
        14,
        'The planet is named after the Roman god of the sea.
',
        'Neptune is very similar to Uranus. It''s 
made of a thick soup of water, ammonia,
and methane over an Earth-sized solid center. 
Its atmosphere is made of hydrogen, helium,
and methane. The methane gives Neptune the 
same blue color as Uranus.
',
        29,
        false,
        1
    );

INSERT INTO
    public.planet
VALUES
    (
        10,
        'Proxima Centauri c',
        NULL,
        NULL,
        'The established planet-naming convention used by
planet-finding astronomers is to give the newly
discovered planet the name of the star followed
by lower case letters starting with "b" for the
first planet discovered, "c" for the next one found,
and so on.
',
        'Proxima Centauri c is a very strong exoplanet 
candidate orbiting the red dwarf star Proxima
Centauri, which is the closest star to the sun
and part of a triple star system.
',
        6,
        false,
        2
    );

--

-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp

--

INSERT INTO
    public.planet_type
VALUES
    (
        1,
        'Giant Planet',
        'A massive planet. They are most commonly composed
primarily of ''gas'' (hydrogen and helium) or ''ices''
(volatiles such as water, methane, and ammonia), but
may also be composed primarily of rock, which would
make one a Mega Earth. Regardless of their bulk
compositions, giant planets normally have thick
atmospheres of hydrogen and helium.'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        2,
        'Ice Giant',
        'Planets of mass similar to Uranus or Neptune; smaller
than the gas giants, but still much larger than Earth.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        3,
        'Mesoplanet',
        'A planetary body with a size smaller than Mercury, but
larger than Ceres. A term, not commonly used in the 
astronomical community, coined by Isaac Asimov. Assuming
"size" is defined by linear dimension (or by volume),
mesoplanets should be approximately 1,000 to 5,000 km
in diameter.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        4,
        'Mini-Neptune',
        'Also knows as a gas dwarf or transitional planet. A planet
up to 10 Earth masses, but less massive than Uranus and
Neptune. Mini-Neptunes have thick hydrogen-helium
atmospheres, probably with deep layers of ice, rock,
or liquid oceans (made of water, ammonia, a mixture of
both, or heavier volatiles).
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        5,
        'Planetar',
        'Either a brown dwarf - an object with a size larger
than a planet but smaller than a star - that has 
fromed by processes that typically yield planets -
or a sub-brown dwarf, an object smaller than a brown
dwarf that does not orbit a star.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        6,
        'Super-Earth',
        'An extrasolar planet with a mass higher than Earth''s  
but substantially below the mass of the Solar System''s
smaller gas giants Uranus and Neptune, which are 14.5
and 17.1 Earth masses respectively.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        7,
        'Super-Jupiter',
        'An astronomical object that''s more massive than the
planet Jupiter.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        8,
        'Sub-Earth',
        'A classification of planets "substantially less massive"
than Earth and Venus.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        9,
        'Circumbinary Planet',
        'An exoplanet that orbits two stars.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        10,
        'Double Planet',
        'Also known as a binary planet. Two planetary-mass
objects orbiting each other.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        11,
        'Eccentric Jupiter',
        'A gas giant that orbits its star in an eccentric orbit.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        12,
        'Exoplanet',
        'A planet that does not orbit the Sun, but a different
star, a stellar remnant, or a brown dwarf.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        13,
        'Extragalactic Planet',
        'An exoplanet outside the Milky Way.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        14,
        'Goldilocks Planet',
        'A planet with an orbit that falls within the star''s
habitable zone. The name derives from the fairy tale
"Goldilocks and the Three Bears", in which a little
girl chooses from sets of three items, ignoring the
ones that are too extreme (large or small, hot or cold,
et.), and settling on the one in the middle, which is
"just right".
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        15,
        'Hot Jupiter',
        'A class of extrasolar planets whose characteristics are similar
to Jupiter, but that have high surface temperatures because
they orbit very close - between approximately 0.015 and 
0.5 AU - to their parent stars, whereas Jupiter orbits its
parent star at 5.2 AU, causing low surface temperatures.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        16,
        'Hot Neptune',
        'An extrasolar planet in an orbit close to its star,
with a mass similar to that of Uranus or Neptune.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        17,
        'Inferior Planets',
        'Planets whose orbits lie within the orbit of Earth.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        18,
        'Inner Planet',
        'A planet in the Solar System that have orbits
smaller than the asteroid belt.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        19,
        'Outer Planet',
        'A planet in the Solar System beyond the asteroid belt,
and hence refers to the gas giants.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        20,
        'Pulsar Planet',
        'A planet that orbits a pulsar or a rapidly rotating,
neruon star.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        21,
        'Rogue Planet',
        'Also knows as an interstellar planet. A planetary-mass
object that orbits the galaxy directly.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        22,
        'Superior Planets',
        'Planets whose orbits lie outside the orbit of Earth.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        23,
        'Trojan Planet',
        'A planet co-orbiting with another planet. The discovery of
a pair of co-orbital exoplanets has been reported, but later
retracted. One possibility for the habitable zone is a 
trojan planet of a gas giant close to its star.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        24,
        'Chtonian Planet',
        'An extrasolar planet that orbits close to its parent
star. Most Chthonian planets are expected to be gas 
giants that had their atmospheres stripped away,
leaving their cores.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        25,
        'Carbon Planet',
        'A theoretical terrestrial planet that could form
if protoplanetary discs are carbon-rich and oxygen-poor. 
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        26,
        'Coreless Planet',
        'A theoretical planet that has undergone planetary
differentiation but has no metallic core. Not to be
confused with the Hollow Earth concept.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        27,
        'Desert Planet',
        'A theoretical terrestrial planet with very little water.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        28,
        'Gas Dwarf',
        'A low-mass planet composed primarily of hydrogen and helium.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        29,
        'Gas Giant',
        'A massive planet composed primarily of hydrogen and helium.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        30,
        'Helium Planet',
        'A theoretical planet that may form via mass loss from
a low-mass white dwarf. Helium planets are predicted to
have roughly the same diameter as hydrogen-helium planets 
of the same mass.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        31,
        'Hycean Planet',
        'A hypothetical type of habitable planet described as
a hot, water-covered planet with a hydrogen-rich atmosphere. 
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        33,
        'Ice Planet',
        'A theoretical planet with an icy surface and 
consists of a global cryosphere.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        34,
        'Iron Planet',
        'A theoretical planet that consists primarily 
of an iron-rich core with little or no mantle.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        35,
        'Lava Planet',
        'A theoretical terrestrial planet with a surface
mostly or entirely covered by molten lava.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        36,
        'Ocean Planet',
        'A theoretical planet which has a substantial fraction
of its mass made of water.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        37,
        'Protoplanet',
        'A large planetary embryo that originates within
protoplanetary discs and has undergone internal melting to
produce differnetiated interiors. Protoplanets are believed 
to form out of kilometer-sized planetisimals that attract
each other gravitationally and collide.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        38,
        'Puffy Planet',
        'Also known as a hot Saturn. A gas giant with a large
radius and very low density which is similar to or lower 
than Saturn''s.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        39,
        'Silicate Planet',
        'A terrestrial planet that is composed primarily of
silicate rocks. All four innner planets in the Solar 
System are silicon-based.
'
    );

INSERT INTO
    public.planet_type
VALUES
    (
        40,
        'Terrestrial Planet',
        'Also known as a telluric planet or rocky planet.
A planet that is composed primarily of carbonaceous 
or silicate rocks or metals.
'
    );

--

-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp

--

INSERT INTO
    public.star
VALUES
    (
        1,
        'Sun',
        1.39,
        'The English word sun developed from Old English sunne.
Cognates appear in other Germanic languages, including
West Frisian sinne, Dutch zon, Low German Sünn, Standard 
German Sonne, Bavarian Sunna, Old Norse sunna, and Gothic 
sunnō. All these words stem from Proto-Germanic sunnōn.
',
        'The Sun is the star at the center of the Solar System.
It is a nearly perfect ball of hot plasma, heated to 
incandescence by nuclear fusion reaction it its core,
radiating the energy mainly as visible light, ultraviolet,
and infrared radiation. It is the most important soruce of 
energy for life on Earth.
',
        1
    );

INSERT INTO
    public.star
VALUES
    (
        2,
        'Proxima Centauri',
        0.21,
        'Its Latin name means "the nearse star of Centaurus".
',
        'Proxima Centauri is a small low-mass star located
4.2465 light-years away from the Sun in the southern 
constellation of Centaurus. With a quiescent apparent 
magnitude 11.13, it is too faint to be seen with the 
unaided eye.
',
        1
    );

INSERT INTO
    public.star
VALUES
    (
        3,
        'TRAPPIST-1',
        0.17,
        'Its name comes from the telescope that helped with its 
discovery, the Transiting Planets and Planetisimals Small
Telescope (TRAPPIST).
',
        'TRAPPIST-1 is an ultra-cool red dwarf star in the 
constellation Aquarius. It has a mass of about 9% that 
of the Sun, a radius slightly larger than the planet
Jupiter, and a surface temperature of about 2,560 K.
',
        1
    );

INSERT INTO
    public.star
VALUES
    (
        4,
        'Arcturus',
        35.34,
        'The name Arcturus is Latinised from the Greek
star name Ἀρκτοῦρος(arktoyros) meaning "the Guard". 
The Greek namem is found in ancient astronomical
literature, e.g. Hesiod''s Work and Days,
Hipparchus''s and Ptolemy''s star catalogs.
',
        'Arcturus is a red giant star in the Northern Hemisphere
of Earth''s sky and the brightest star in the constellation
Boötes(the herdsman). Arcturus is also among the brightest
stars that can be seen from Earth. Astronomers say Arcturus 
will end up as a white dwarf at the end of its life.
',
        1
    );

INSERT INTO
    public.star
VALUES
    (
        5,
        'Alnilam',
        45.08,
        'The traditional name Alnilam derives from the Arabic 
النظام al-niẓām(arrangement/string of pearls). Related 
spellings are Alnihan and Alnitam. All three variants
are evidently mistakes in transliteration or copy
errors, the first perhaps due to confusion with
النيلم al-nilam "sapphire".
',
        'Alnilam is the central star of Orion''s Belt
in the equatorial constellation of Orion. It has 
the Bayer designation ε Orionis, which is Latinised 
to Epsilon Orionis and abbreviated Epsilon Ori
or ε Ori. This is a massive, blue supergiant star
some 2,000 light-years distant. It is estimated to
be 275,000 to 832,000 times as luminous as the Sun,
and 40 to 44 tiems as massive.
',
        1
    );

INSERT INTO
    public.star
VALUES
    (
        6,
        'Procyon',
        0.02,
        'The name Procyon comes from the Ancient Greek
Προκύων (Prokyon), meaning "before the dog", since
it preceded the "Dog Star" Sirius as it travels across 
the sky due to Earth''s rotation.
',
        'Procyon is the brightest star in the constellation of
Canis Minor and usually the eight-brightest star in the 
night sky, with an apparent visual magnitude of 0.34.
',
        1
    );

--

-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp

--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);

--

-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp

--

SELECT
    pg_catalog.setval(
        'public.galaxy_type_galaxy_type_id_seq',
        11,
        true
    );

--

-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp

--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);

--

-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp

--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);

--

-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp

--

SELECT
    pg_catalog.setval(
        'public.planet_type_planet_type_id_seq',
        40,
        true
    );

--

-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp

--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);

--

-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE
    ONLY public.galaxy
ADD
    CONSTRAINT galaxy_name_key UNIQUE (name);

--

-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE
    ONLY public.galaxy
ADD
    CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);

--

-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE
    ONLY public.galaxy_type
ADD
    CONSTRAINT galaxy_type_name_key UNIQUE (name);

--

-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE
    ONLY public.galaxy_type
ADD
    CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);

--

-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE
    ONLY public.moon
ADD
    CONSTRAINT moon_name_key UNIQUE (name);

--

-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE
    ONLY public.moon
ADD
    CONSTRAINT moon_pkey PRIMARY KEY (moon_id);

--

-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE
    ONLY public.planet
ADD
    CONSTRAINT planet_name_key UNIQUE (name);

--

-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE
    ONLY public.planet
ADD
    CONSTRAINT planet_pkey PRIMARY KEY (planet_id);

--

-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE
    ONLY public.planet_type
ADD
    CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);

--

-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE
    ONLY public.star
ADD
    CONSTRAINT star_name_key UNIQUE (name);

--

-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE
    ONLY public.star
ADD
    CONSTRAINT star_pkey PRIMARY KEY (star_id);

--

-- Name: planet_type uq_planet_type_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE
    ONLY public.planet_type
ADD
    CONSTRAINT uq_planet_type_name UNIQUE (name);

--

-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE
    ONLY public.moon
ADD
    CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);

--

-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE
    ONLY public.planet
ADD
    CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);

--

-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE
    ONLY public.planet
ADD
    CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);

--

-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp

--

ALTER TABLE
    ONLY public.star
ADD
    CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);

--

-- PostgreSQL database dump complete

--