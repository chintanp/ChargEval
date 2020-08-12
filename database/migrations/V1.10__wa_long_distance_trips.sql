--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3 (Ubuntu 12.3-1.pgdg20.04+1)

-- Started on 2020-08-06 15:54:36 PDT

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
-- TOC entry 5582 (class 0 OID 26545)
-- Dependencies: 260
-- Data for Name: wa_long_distance_passenger_trips; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wa_long_distance_passenger_trips (ldtrip_id, origin_zip, destination_zip, ldtrip_count) FROM stdin;
\.


--
-- TOC entry 5589 (class 0 OID 0)
-- Dependencies: 261
-- Name: wa_long_distance_passenger_trips_ldtrip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wa_long_distance_passenger_trips_ldtrip_id_seq', 1, false);


-- Completed on 2020-08-06 15:54:39 PDT

--
-- PostgreSQL database dump complete
--

