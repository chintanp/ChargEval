--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3 (Ubuntu 12.3-1.pgdg20.04+1)

-- Started on 2020-08-06 14:25:27 PDT

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
-- TOC entry 5584 (class 0 OID 26516)
-- Dependencies: 254
-- Data for Name: table_stats; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.table_stats (table_id, table_name, last_updated) FROM stdin;
1	built_evse	2019-11-04 15:57:49
5	wa_gas_prices	2019-11-13 18:00:42
4	wa_evtrips	2019-11-13 18:25:10
2	wa_bevs	2019-11-13 18:58:56
\.


--
-- TOC entry 5591 (class 0 OID 0)
-- Dependencies: 255
-- Name: table_stats_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.table_stats_table_id_seq', 7, true);


-- Completed on 2020-08-06 14:25:30 PDT

--
-- PostgreSQL database dump complete
--

