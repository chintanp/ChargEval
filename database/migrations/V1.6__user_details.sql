--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3 (Ubuntu 12.3-1.pgdg20.04+1)

-- Started on 2020-08-06 15:51:51 PDT

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
-- TOC entry 5581 (class 0 OID 26524)
-- Dependencies: 256
-- Data for Name: user_details; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_details (user_id, user_name, email_id, last_submit_date) FROM stdin;
5df30c5cceb5030df24a5d0f	buellt@wsdot.wa.gov	buellt@wsdot.wa.gov	2019-12-12 20:23:05
101109927750555346263	Chintan Pathak	chintanp@battgenie.life	2020-01-28 12:14:44
116694976789141474362	Chintan Pathak	cp84@uw.edu	2020-08-06 21:38:22
\.


-- Completed on 2020-08-06 15:51:54 PDT

--
-- PostgreSQL database dump complete
--

