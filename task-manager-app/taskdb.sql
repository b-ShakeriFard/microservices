--
-- PostgreSQL database dump
--

-- Dumped from database version 10.23
-- Dumped by pg_dump version 10.23

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: tasks; Type: TABLE; Schema: public; Owner: taskuser
--

CREATE TABLE public.tasks (
    id integer NOT NULL,
    title text NOT NULL,
    category text NOT NULL,
    duration text,
    recurrence text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status text,
    CONSTRAINT task_duration_check CHECK ((duration = ANY (ARRAY['short'::text, 'medium'::text, 'long'::text]))),
    CONSTRAINT tasks_category_check CHECK ((status = ANY (ARRAY['Learning by Doing'::text, 'Practice'::text, 'Project'::text, 'Watch and Learn'::text, 'Stay Sharp'::text, 'one time task'::text, 'Have Fun'::text, 'Chore'::text]))),
    CONSTRAINT tasks_recurrence_check CHECK ((recurrence = ANY (ARRAY['daily'::text, 'weekly'::text, 'random/flexible'::text, 'one time'::text]))),
    CONSTRAINT tasks_status_check CHECK ((status = ANY (ARRAY['idea'::text, 'initiated'::text, 'slow progress'::text, 'doing'::text, 'fast track'::text, 'parked'::text, 'completed'::text, 'terminated'::text])))
);


ALTER TABLE public.tasks OWNER TO taskuser;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: taskuser
--

CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_id_seq OWNER TO taskuser;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taskuser
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: taskuser
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: taskuser
--

COPY public.tasks (id, title, category, duration, recurrence, created_at, status) FROM stdin;
5	Code Wars Python Challenge	Stay Sharp	short	daily	2026-06-07 05:58:48.39782	\N
6	Practice Kubernetes with ChatGPT	Learning by Doing	medium	daily	2026-06-20 12:50:19.833602	\N
1	GitHub - Kubernetes repo - Post for Fun!	Learning by Doing	short	random/flexible	2026-06-20 18:53:44.599272	\N
\.


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taskuser
--

SELECT pg_catalog.setval('public.tasks_id_seq', 6, true);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: taskuser
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

