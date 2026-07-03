--
-- PostgreSQL database dump
--

\restrict nbSgftvwxkJbomOZAP62t9uR7HjOQ9mPp8uFWQs7XxOqcNEWp0JHKyFag8WlPjO

-- Dumped from database version 16.14 (Debian 16.14-1.pgdg13+1)
-- Dumped by pg_dump version 16.14 (Debian 16.14-1.pgdg13+1)

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
    CONSTRAINT tasks_category_check CHECK ((category = ANY (ARRAY['Learning by Doing'::text, 'Practice'::text, 'Project'::text, 'Watch and feel inspired'::text, 'Stay Sharp'::text, 'one time task'::text, 'Have Fun'::text, 'Chore'::text]))),
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


ALTER SEQUENCE public.tasks_id_seq OWNER TO taskuser;

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
11	Raspberry Pi Pico --> VGA	Project	long	random/flexible	2026-06-30 11:12:20.16853	parked
12	KodeKloud - Kubernetes	Watch and feel inspired	short	daily	2026-06-30 11:22:53.184981	parked
13	KodeKloud - Service Mesh Istio	Watch and feel inspired	short	daily	2026-06-30 11:23:15.577407	parked
14	KodeKloud - Argo CD - Git	Watch and feel inspired	short	daily	2026-06-30 11:23:31.817097	parked
15	ChatGPT - Linux Challenges	Practice	short	daily	2026-06-30 11:26:21.63665	parked
16	ChatGPT - Kubernetes Challenges	Practice	short	daily	2026-06-30 11:26:37.404485	parked
17	GitHub - Kubernetes repo	Learning by Doing	medium	daily	2026-06-30 11:28:18.806401	parked
18	GitHub - Linux repo	Learning by Doing	medium	daily	2026-06-30 11:28:30.690178	parked
19	GitHub - frpn app repo	Learning by Doing	medium	daily	2026-06-30 11:28:40.873469	parked
20	GitHub - PostgreSQL statefulst repo	Learning by Doing	medium	daily	2026-06-30 11:28:58.152906	parked
21	PostgreSQL statefulset app	Project	long	random/flexible	2026-06-30 11:30:52.359573	doing
22	WiFi > ESP8266 > NTP > OLED 1306 > Clock	Project	long	random/flexible	2026-06-30 11:40:48.302622	doing
23	RP2040 Zero > JoyStick > RGB > OLED 1306 > dual-axis Game	Project	long	random/flexible	2026-06-30 11:42:22.674096	parked
24	Home Automation - Raspberry Pi Zero 2 W - Central Hub	Project	long	random/flexible	2026-06-30 11:43:04.607927	parked
25	LM13700 - VCA Guitar	Project	long	random/flexible	2026-06-30 11:43:58.677176	parked
26	Klon Centaur - Guitar overdrive	Project	long	random/flexible	2026-06-30 11:44:21.69299	parked
27	Basic Hard Clipping circuit - Guitar overdrive	Project	long	random/flexible	2026-06-30 11:44:53.393879	parked
28	Wash Thy Car	Chore	medium	one time	2026-06-30 11:46:31.912487	\N
29	e-ink display with SPI	Project	long	random/flexible	2026-06-30 15:01:19.023533	parked
30	Arduino - FM radio - RDA5807	Project	long	random/flexible	2026-06-30 15:02:11.674553	parked
31	LG Flatron TV - inside	Project	long	one time	2026-06-30 15:02:59.860255	parked
32	Observability Stack - Node Exporter, Prometheus, Grafana	Project	long	random/flexible	2026-06-30 15:04:47.026908	parked
33	Guitar Amplifier - Head	Project	long	random/flexible	2026-06-30 15:05:20.04443	parked
34	PT2399 Digital Delay - circuit	Project	long	random/flexible	2026-06-30 15:05:54.377507	parked
35	Project Syndicate	Stay Sharp	short	daily	2026-06-30 15:10:52.086213	doing
36	read book	Stay Sharp	short	daily	2026-06-30 15:11:06.396595	doing
37	MicroPython - Raspberry Pi Pico W - Tetris	Project	long	random/flexible	2026-06-30 15:11:41.629571	parked
38	Max7219 - ESP8266 - Desktop Clock	Project	long	random/flexible	2026-06-30 15:12:25.430094	parked
39	weblinks - June 2026 - Rocky Linux	Chore	long	random/flexible	2026-06-30 16:42:08.733097	slow progress
40	Data Science - Jupyter notebook	Have Fun	medium	random/flexible	2026-06-30 16:55:43.505478	\N
41	MPSA13 - transistor bias	Have Fun	medium	random/flexible	2026-06-30 16:58:29.290195	\N
42	VU Meter - Guitar Amp	Project	medium	random/flexible	2026-06-30 17:00:43.240762	parked
43	NVME M2 - ADATA - VM CentOS	one time task	short	one time	2026-06-30 17:04:37.209901	parked
44	Active EQ with TL072	Project	long	random/flexible	2026-07-01 07:57:00.484874	parked
45	Laundry	Chore	short	random/flexible	2026-07-01 08:53:07.072825	\N
46	Vacuum Clean	Chore	short	random/flexible	2026-07-01 08:53:19.55451	\N
47	Vacuum Clean	Chore	short	random/flexible	2026-07-01 08:53:21.622448	\N
48	Sort your Clothes	Chore	short	random/flexible	2026-07-01 08:53:37.257687	\N
\.


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taskuser
--

SELECT pg_catalog.setval('public.tasks_id_seq', 48, true);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: taskuser
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict nbSgftvwxkJbomOZAP62t9uR7HjOQ9mPp8uFWQs7XxOqcNEWp0JHKyFag8WlPjO

