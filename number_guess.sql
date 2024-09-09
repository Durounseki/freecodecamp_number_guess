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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (42, 'user_1725881466410', 2, 246);
INSERT INTO public.users VALUES (41, 'user_1725881466411', 5, 287);
INSERT INTO public.users VALUES (44, 'user_1725881561458', 2, 309);
INSERT INTO public.users VALUES (43, 'user_1725881561459', 5, 97);
INSERT INTO public.users VALUES (46, 'user_1725881587571', 2, 82);
INSERT INTO public.users VALUES (45, 'user_1725881587572', 5, 133);
INSERT INTO public.users VALUES (48, 'user_1725881630558', 2, 636);
INSERT INTO public.users VALUES (47, 'user_1725881630559', 5, 22);
INSERT INTO public.users VALUES (50, 'user_1725881635893', 2, 89);
INSERT INTO public.users VALUES (49, 'user_1725881635894', 5, 112);
INSERT INTO public.users VALUES (40, 'me', 2, 9);
INSERT INTO public.users VALUES (52, 'user_1725881698816', 2, 445);
INSERT INTO public.users VALUES (51, 'user_1725881698817', 5, 22);
INSERT INTO public.users VALUES (54, 'user_1725882801401', 2, 17);
INSERT INTO public.users VALUES (53, 'user_1725882801402', 5, 66);
INSERT INTO public.users VALUES (56, 'user_1725882988182', 2, 490);
INSERT INTO public.users VALUES (55, 'user_1725882988183', 5, 100);
INSERT INTO public.users VALUES (58, 'user_1725883003184', 2, 23);
INSERT INTO public.users VALUES (57, 'user_1725883003185', 5, 51);
INSERT INTO public.users VALUES (60, 'user_1725883005522', 2, 285);
INSERT INTO public.users VALUES (59, 'user_1725883005523', 5, 16);
INSERT INTO public.users VALUES (62, 'user_1725883068334', 2, 268);
INSERT INTO public.users VALUES (61, 'user_1725883068335', 5, 296);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 62, true);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (username);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

