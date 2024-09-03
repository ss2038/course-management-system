--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-09-03 03:31:56

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
-- TOC entry 218 (class 1259 OID 16601)
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    admin_id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    full_name character varying(255) NOT NULL
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16600)
-- Name: admin_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_admin_id_seq OWNER TO postgres;

--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 217
-- Name: admin_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_admin_id_seq OWNED BY public.admin.admin_id;


--
-- TOC entry 220 (class 1259 OID 16612)
-- Name: content_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.content_access (
    access_id integer NOT NULL,
    user_type character varying(50) NOT NULL,
    drive_link character varying(255) NOT NULL
);


ALTER TABLE public.content_access OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16611)
-- Name: content_access_access_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.content_access_access_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.content_access_access_id_seq OWNER TO postgres;

--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 219
-- Name: content_access_access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.content_access_access_id_seq OWNED BY public.content_access.access_id;


--
-- TOC entry 224 (class 1259 OID 16636)
-- Name: login_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login_logs (
    log_id integer NOT NULL,
    user_id integer NOT NULL,
    login_time timestamp without time zone,
    ip_address character varying(50)
);


ALTER TABLE public.login_logs OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16635)
-- Name: login_logs_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.login_logs_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.login_logs_log_id_seq OWNER TO postgres;

--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 223
-- Name: login_logs_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.login_logs_log_id_seq OWNED BY public.login_logs.log_id;


--
-- TOC entry 222 (class 1259 OID 16619)
-- Name: teacher_approvals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teacher_approvals (
    approval_id integer NOT NULL,
    user_id integer NOT NULL,
    approval_status character varying(50),
    requested_date timestamp without time zone,
    approved_by integer,
    approval_date timestamp without time zone
);


ALTER TABLE public.teacher_approvals OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16618)
-- Name: teacher_approvals_approval_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teacher_approvals_approval_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teacher_approvals_approval_id_seq OWNER TO postgres;

--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 221
-- Name: teacher_approvals_approval_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teacher_approvals_approval_id_seq OWNED BY public.teacher_approvals.approval_id;


--
-- TOC entry 216 (class 1259 OID 16590)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    user_type character varying(50) NOT NULL,
    is_approved boolean,
    signup_date timestamp without time zone,
    last_login timestamp without time zone,
    college_name character varying(255),
    country character varying(100),
    university_website character varying(255),
    additional_info text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16589)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 4709 (class 2604 OID 16604)
-- Name: admin admin_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin ALTER COLUMN admin_id SET DEFAULT nextval('public.admin_admin_id_seq'::regclass);


--
-- TOC entry 4710 (class 2604 OID 16615)
-- Name: content_access access_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_access ALTER COLUMN access_id SET DEFAULT nextval('public.content_access_access_id_seq'::regclass);


--
-- TOC entry 4712 (class 2604 OID 16639)
-- Name: login_logs log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_logs ALTER COLUMN log_id SET DEFAULT nextval('public.login_logs_log_id_seq'::regclass);


--
-- TOC entry 4711 (class 2604 OID 16622)
-- Name: teacher_approvals approval_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_approvals ALTER COLUMN approval_id SET DEFAULT nextval('public.teacher_approvals_approval_id_seq'::regclass);


--
-- TOC entry 4708 (class 2604 OID 16593)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 4876 (class 0 OID 16601)
-- Dependencies: 218
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (admin_id, email, password, full_name) FROM stdin;
1	admin@example.com	adminpassword	Admin User
\.


--
-- TOC entry 4878 (class 0 OID 16612)
-- Dependencies: 220
-- Data for Name: content_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.content_access (access_id, user_type, drive_link) FROM stdin;
1	student	https://drive.google.com/student-link
2	teacher	https://drive.google.com/teacher-link
\.


--
-- TOC entry 4882 (class 0 OID 16636)
-- Dependencies: 224
-- Data for Name: login_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.login_logs (log_id, user_id, login_time, ip_address) FROM stdin;
1	1	2024-09-03 07:40:58.025679	127.0.0.1
2	1	2024-09-03 02:43:26.95052	192.168.1.1
3	2	2024-09-03 02:43:26.95052	192.168.1.2
4	2	2024-09-03 07:44:23.505467	127.0.0.1
5	2	2024-09-03 08:18:12.186428	127.0.0.1
\.


--
-- TOC entry 4880 (class 0 OID 16619)
-- Dependencies: 222
-- Data for Name: teacher_approvals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teacher_approvals (approval_id, user_id, approval_status, requested_date, approved_by, approval_date) FROM stdin;
1	2	pending	2024-09-03 02:42:56.11363	\N	\N
\.


--
-- TOC entry 4874 (class 0 OID 16590)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, email, password, user_type, is_approved, signup_date, last_login, college_name, country, university_website, additional_info) FROM stdin;
1	test@example.com	testpassword	student	t	2024-09-03 02:40:20.038814	2024-09-03 07:40:58.023689	\N	\N	\N	\N
3	testteacher@example.com	testpassword	teacher	f	2024-09-03 02:42:25.0892	\N	Test University	Test Country	http://www.testuniversity.edu	Test teacher additional info
2	teststudent@example.com	testpassword	student	t	2024-09-03 02:42:25.0892	2024-09-03 08:18:12.16357	Test College	Test Country	http://www.testcollege.edu	Test student additional info
\.


--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 217
-- Name: admin_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_admin_id_seq', 1, true);


--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 219
-- Name: content_access_access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.content_access_access_id_seq', 2, true);


--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 223
-- Name: login_logs_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.login_logs_log_id_seq', 5, true);


--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 221
-- Name: teacher_approvals_approval_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teacher_approvals_approval_id_seq', 1, true);


--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 3, true);


--
-- TOC entry 4718 (class 2606 OID 16610)
-- Name: admin admin_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_email_key UNIQUE (email);


--
-- TOC entry 4720 (class 2606 OID 16608)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (admin_id);


--
-- TOC entry 4722 (class 2606 OID 16617)
-- Name: content_access content_access_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_access
    ADD CONSTRAINT content_access_pkey PRIMARY KEY (access_id);


--
-- TOC entry 4726 (class 2606 OID 16641)
-- Name: login_logs login_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_logs
    ADD CONSTRAINT login_logs_pkey PRIMARY KEY (log_id);


--
-- TOC entry 4724 (class 2606 OID 16624)
-- Name: teacher_approvals teacher_approvals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_approvals
    ADD CONSTRAINT teacher_approvals_pkey PRIMARY KEY (approval_id);


--
-- TOC entry 4714 (class 2606 OID 16599)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4716 (class 2606 OID 16597)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4729 (class 2606 OID 16642)
-- Name: login_logs login_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_logs
    ADD CONSTRAINT login_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 4727 (class 2606 OID 16630)
-- Name: teacher_approvals teacher_approvals_approved_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_approvals
    ADD CONSTRAINT teacher_approvals_approved_by_fkey FOREIGN KEY (approved_by) REFERENCES public.admin(admin_id);


--
-- TOC entry 4728 (class 2606 OID 16625)
-- Name: teacher_approvals teacher_approvals_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_approvals
    ADD CONSTRAINT teacher_approvals_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


-- Completed on 2024-09-03 03:31:56

--
-- PostgreSQL database dump complete
--

