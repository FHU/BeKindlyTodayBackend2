--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2 (Ubuntu 16.2-1.pgdg22.04+1)

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
-- Name: Challenge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Challenge" (
    id integer NOT NULL,
    date timestamp(3) without time zone NOT NULL,
    source text NOT NULL,
    prompt text NOT NULL,
    suggestion text NOT NULL
);


ALTER TABLE public."Challenge" OWNER TO postgres;

--
-- Name: Challenge_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Challenge_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Challenge_id_seq" OWNER TO postgres;

--
-- Name: Challenge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Challenge_id_seq" OWNED BY public."Challenge".id;


--
-- Name: Completion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Completion" (
    id integer NOT NULL,
    description text NOT NULL,
    date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    user_id integer NOT NULL,
    challenge_id integer NOT NULL
);


ALTER TABLE public."Completion" OWNER TO postgres;

--
-- Name: Completion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Completion_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Completion_id_seq" OWNER TO postgres;

--
-- Name: Completion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Completion_id_seq" OWNED BY public."Completion".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    email text NOT NULL,
    username text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."User_id_seq" OWNER TO postgres;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: Challenge id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Challenge" ALTER COLUMN id SET DEFAULT nextval('public."Challenge_id_seq"'::regclass);


--
-- Name: Completion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Completion" ALTER COLUMN id SET DEFAULT nextval('public."Completion_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Data for Name: Challenge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Challenge" (id, date, source, prompt, suggestion) FROM stdin;
\.


--
-- Data for Name: Completion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Completion" (id, description, date, user_id, challenge_id) FROM stdin;
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, email, username, password) FROM stdin;
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
553218ae-647a-49bf-9692-5b8f0f461a21	3d0965bc4bf33156535e47ee4c4a41597d146a14b3e9eb3c302b2280863ad806	2024-04-09 13:37:58.453685+00	20240323012108_test	\N	\N	2024-04-09 13:37:58.288789+00	1
27b95ed1-60d1-4349-90e0-b68608b77bbe	89c534372340892b20a1060fa45d2ffcea26de0363e51a99d223b01043355c25	2024-04-09 13:37:58.496072+00	20240405145248_add_frontend_reqs	\N	\N	2024-04-09 13:37:58.456634+00	1
cabb53ac-5550-4601-b6c5-5e530278ee99	9af4530c13a31b0ba43501a8ce0dd424d2512c9cdbe4896e46d09370652c9c0d	2024-04-09 13:37:58.633002+00	20240405193931_simplify_schema	\N	\N	2024-04-09 13:37:58.499376+00	1
3b9eb517-e157-470b-8eaf-f2cf64eab55f	1deb7e1cffd882e1b868a5898e06b784c4213f101ae52f5962f2bba3df18f6f6	2024-04-09 13:37:58.646306+00	20240407021219_add_prompt_field	\N	\N	2024-04-09 13:37:58.636306+00	1
\.


--
-- Name: Challenge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Challenge_id_seq"', 1, false);


--
-- Name: Completion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Completion_id_seq"', 1, false);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_id_seq"', 1, false);


--
-- Name: Challenge Challenge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Challenge"
    ADD CONSTRAINT "Challenge_pkey" PRIMARY KEY (id);


--
-- Name: Completion Completion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Completion"
    ADD CONSTRAINT "Completion_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Challenge_date_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Challenge_date_idx" ON public."Challenge" USING btree (date);


--
-- Name: Challenge_date_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Challenge_date_key" ON public."Challenge" USING btree (date);


--
-- Name: Challenge_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Challenge_id_key" ON public."Challenge" USING btree (id);


--
-- Name: Completion_date_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Completion_date_idx" ON public."Completion" USING btree (date);


--
-- Name: Completion_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Completion_id_key" ON public."Completion" USING btree (id);


--
-- Name: Completion_user_id_challenge_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Completion_user_id_challenge_id_key" ON public."Completion" USING btree (user_id, challenge_id);


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: User_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_id_key" ON public."User" USING btree (id);


--
-- Name: Completion Completion_challenge_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Completion"
    ADD CONSTRAINT "Completion_challenge_id_fkey" FOREIGN KEY (challenge_id) REFERENCES public."Challenge"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Completion Completion_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Completion"
    ADD CONSTRAINT "Completion_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

