--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: disciplines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disciplines (
    id integer NOT NULL,
    name text NOT NULL,
    period_id integer NOT NULL
);


ALTER TABLE public.disciplines OWNER TO postgres;

--
-- Name: disciplines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.disciplines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disciplines_id_seq OWNER TO postgres;

--
-- Name: disciplines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.disciplines_id_seq OWNED BY public.disciplines.id;


--
-- Name: periods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.periods (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.periods OWNER TO postgres;

--
-- Name: periods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.periods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.periods_id_seq OWNER TO postgres;

--
-- Name: periods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.periods_id_seq OWNED BY public.periods.id;


--
-- Name: professors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professors (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.professors OWNER TO postgres;

--
-- Name: professors_disciplines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professors_disciplines (
    id integer NOT NULL,
    professor_id integer NOT NULL,
    discipline_id integer NOT NULL
);


ALTER TABLE public.professors_disciplines OWNER TO postgres;

--
-- Name: professors_disciplines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.professors_disciplines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.professors_disciplines_id_seq OWNER TO postgres;

--
-- Name: professors_disciplines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.professors_disciplines_id_seq OWNED BY public.professors_disciplines.id;


--
-- Name: professors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.professors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.professors_id_seq OWNER TO postgres;

--
-- Name: professors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.professors_id_seq OWNED BY public.professors.id;


--
-- Name: tests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tests (
    id integer NOT NULL,
    name text NOT NULL,
    link text NOT NULL,
    category_id integer NOT NULL,
    professor_id integer NOT NULL,
    discipline_id integer NOT NULL
);


ALTER TABLE public.tests OWNER TO postgres;

--
-- Name: tests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tests_id_seq OWNER TO postgres;

--
-- Name: tests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tests_id_seq OWNED BY public.tests.id;


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: disciplines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplines ALTER COLUMN id SET DEFAULT nextval('public.disciplines_id_seq'::regclass);


--
-- Name: periods id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periods ALTER COLUMN id SET DEFAULT nextval('public.periods_id_seq'::regclass);


--
-- Name: professors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors ALTER COLUMN id SET DEFAULT nextval('public.professors_id_seq'::regclass);


--
-- Name: professors_disciplines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors_disciplines ALTER COLUMN id SET DEFAULT nextval('public.professors_disciplines_id_seq'::regclass);


--
-- Name: tests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests ALTER COLUMN id SET DEFAULT nextval('public.tests_id_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name) FROM stdin;
1	P1
2	P2
3	P3
4	2ch
5	Outras
\.


--
-- Data for Name: disciplines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disciplines (id, name, period_id) FROM stdin;
1	INTRODUÇÃO À COMPUTAÇÃO	1
2	TEXTOS TÉCNICOS EM CIÊNCIA DA COMPUTAÇÃO	1
3	SEMINÁRIOS EM COMPUTAÇÃO	1
4	MATEMÁTICA DISCRETA	1
5	ÁLGEBRA LINEAR I	1
6	CÁLCULO DIFERENCIAL E INTEGRAL I	1
7	ALGORITMOS E ESTRUTURA DE DADOS I	2
8	LINGUAGENS FORMAIS E AUTÔMATOS	2
9	SISTEMAS LÓGICOS	2
10	ÁLGEBRA LINEAR II	2
11	CÁLCULO DIFERENCIAL E INTEGRAL II	2
12	INGLÊS INSTRUMENTAL I	2
13	ALGORITMOS E ESTRUTURAS DE DADOS II	3
14	ORGANIZAÇÃO DE COMPUTADORES	3
15	METODOLOGIA CIENTÍFICA EM CIÊNCIA DA COMPUTAÇÃO	3
16	COMPUTAÇÃO NUMÉRICA	3
17	FÍSICA I E	3
18	TÉCNICAS AVANÇADAS DE PROGRAMAÇÃO	4
19	PARADIGMA DE LINGUAGENS DE PROGRAMAÇÃO	4
20	ARQUITETURA DE COMPUTADORES	4
21	REDES DE COMPUTADORES	4
22	PROBABILIDADE E ESTATISTICA	4
23	PROJETO E ANÁLISE DE ALGORITMOS	5
24	LABORATÓRIO DE PROGRAMAÇÃO AVANÇADA	5
25	COMPILADORES	5
26	SISTEMAS OPERACIONAIS I	5
27	INTRODUÇÃO À ENGENHARIA DE SOFTWARE	5
28	INTRODUÇÃO À ADMINISTRAÇÃO	7
29	PROGRAMAÇÃO PARA WEB	7
30	AVALIAÇÃO DE DESEMPENHO	7
31	SISTEMAS DISTRIBUÍDOS I	7
32	INTERAÇÃO HUMANO-COMPUTADOR	7
33	INFORMÁTICA, ÉTICA E SOCIEDADE	8
34	EMPREENDEDORISMO EM TECNOLOGIA DA	8
35	TRABALHO DE CONCLUSÃO DE CURSO	8
36	ENADE - INGRESSANTE	8
37	ENADE - CONCLUINTE	8
\.


--
-- Data for Name: periods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.periods (id, name) FROM stdin;
1	1°
2	2°
3	3°
4	4°
5	5°
6	6°
7	7°
8	8°
\.


--
-- Data for Name: professors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.professors (id, name) FROM stdin;
1	Eulanda
2	Marco
3	Marcio
4	César
5	Renato
6	Bruna
7	Ozana
8	Isabelly
\.


--
-- Data for Name: professors_disciplines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.professors_disciplines (id, professor_id, discipline_id) FROM stdin;
1	1	1
2	2	1
3	3	2
4	4	2
5	5	3
6	6	3
7	7	4
8	8	4
\.


--
-- Data for Name: tests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tests (id, name, link, category_id, professor_id, discipline_id) FROM stdin;
1	2020.1	http://www.marcusramos.com.br/univasf/lfa-2011-1/prova-1.pdf	3	1	8
2	2020.2	http://www.marcusramos.com.br/univasf/lfa-2017-1/prova-final-sol.pdf	3	1	8
3	2020.3	http://professor.pucgoias.edu.br/SiteDocente/admin/arquivosUpload/17389/material/CMP4145_01.pdf	2	1	8
4	2020.1	http://professor.pucgoias.edu.br/SiteDocente/admin/arquivosUpload/17389/material/CMP4145_01.pdf	1	2	8
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 5, true);


--
-- Name: disciplines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disciplines_id_seq', 37, true);


--
-- Name: periods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.periods_id_seq', 8, true);


--
-- Name: professors_disciplines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.professors_disciplines_id_seq', 8, true);


--
-- Name: professors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.professors_id_seq', 8, true);


--
-- Name: tests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tests_id_seq', 4, true);


--
-- Name: category category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pk PRIMARY KEY (id);


--
-- Name: disciplines disciplines_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplines
    ADD CONSTRAINT disciplines_pk PRIMARY KEY (id);


--
-- Name: periods periods_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periods
    ADD CONSTRAINT periods_pk PRIMARY KEY (id);


--
-- Name: professors_disciplines professors_disciplines_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors_disciplines
    ADD CONSTRAINT professors_disciplines_pk PRIMARY KEY (id);


--
-- Name: professors professors_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors
    ADD CONSTRAINT professors_pk PRIMARY KEY (id);


--
-- Name: tests tests_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_pk PRIMARY KEY (id);


--
-- Name: disciplines disciplines_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplines
    ADD CONSTRAINT disciplines_fk0 FOREIGN KEY (period_id) REFERENCES public.periods(id) ON DELETE CASCADE;


--
-- Name: professors_disciplines professors_disciplines_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors_disciplines
    ADD CONSTRAINT professors_disciplines_fk0 FOREIGN KEY (professor_id) REFERENCES public.professors(id);


--
-- Name: professors_disciplines professors_disciplines_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors_disciplines
    ADD CONSTRAINT professors_disciplines_fk1 FOREIGN KEY (discipline_id) REFERENCES public.disciplines(id);


--
-- Name: tests tests_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_fk0 FOREIGN KEY (category_id) REFERENCES public.category(id) ON DELETE CASCADE;


--
-- Name: tests tests_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_fk1 FOREIGN KEY (professor_id) REFERENCES public.professors(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

