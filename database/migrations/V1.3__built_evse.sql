--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3 (Ubuntu 12.3-1.pgdg20.04+1)

-- Started on 2020-08-06 14:21:57 PDT

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
-- TOC entry 5579 (class 0 OID 26406)
-- Dependencies: 227
-- Data for Name: built_evse; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.built_evse (bevse_id, city, state, zip, level2_count, level1_count, dcfc_count, ev_network, latitude, longitude, open_date, ev_connector_types, ev_pricing, country, connector_code, dcfc_fixed_charging_price, dcfc_var_charging_price_unit, dcfc_var_charging_price, dcfc_fixed_parking_price, dcfc_var_parking_price_unit, dcfc_var_parking_price) FROM stdin;
35620	Spokane	WA	99252	2	1	0	Non-Networked	47.673347	-117.38893	2010-04-15	J1772 NEMA520	Free	US	0	0		0	0		0
35621	Spokane	WA	99201	1	\N	0	Non-Networked	47.655	-117.425026	2010-04-15	J1772	Free	US	0	0		0	0		0
36388	Eastsound	WA	98245	1	1	0	ChargePoint Network	48.6951	-122.9041	\N	J1772 NEMA520	Free	US	0	0		0	0		0
36390	Lopez Island	WA	98261	1	1	0	ChargePoint Network	48.525	-122.9153	\N	J1772 NEMA520	Free	US	0	0		0	0		0
36391	Poulsbo	WA	98370	2	2	0	ChargePoint Network	47.70795	-122.58325	\N	J1772 NEMA520	Free	US	0	0		0	0		0
37181	Bellevue	WA	98004	2	\N	0	ChargePoint Network	47.614746	-122.19316	\N	J1772	$2 per hour, minimum payment of $2	US	0	0		0	0		0
37673	Olympia	WA	98505	2	2	0	Non-Networked	47.07192	-122.97668	2009-12-15	J1772 NEMA520	\N	US	0	0		0	0		0
37677	Tumwater	WA	98501	6	\N	0	Non-Networked	46.98419	-122.904854	2008-01-15	\N	Free	US	0	0		0	0		0
38082	Issaquah	WA	98027	7	4	0	ChargePoint Network	47.54561	-122.0196	\N	J1772 NEMA520	Pricing is by session. $2 per session, maximum session time is 24 hours	US	0	0		0	0		0
38952	Bothell	WA	98011	4	\N	0	ChargePoint Network	47.760178	-122.19058	\N	J1772	Free	US	0	0		0	0		0
38955	Duvall	WA	98019	1	1	0	ChargePoint Network	47.74132	-121.98405	\N	J1772 NEMA520	Pricing is based on an hourly rate. $0.5 per hour, minimum payment of $1, maximum session time is 24 hours	US	0	0		0	0		0
38959	Redmond	WA	98052	2	\N	0	ChargePoint Network	47.679226	-122.12995	\N	J1772	Free	US	0	0		0	0		0
38966	Redmond	WA	98052	2	\N	0	ChargePoint Network	47.67236	-122.09904	\N	J1772	Free	US	0	0		0	0		0
38976	Woodinville	WA	98072	4	\N	0	ChargePoint Network	47.733788	-122.1469	\N	J1772	Free	US	0	0		0	0		0
39778	Bellingham	WA	98229	2	\N	1	Non-Networked	48.755608	-122.45413	2011-03-15	CHADEMO J1772	Free	US	1	0	min	0	0	min	0
39779	Bremerton	WA	98312	1	\N	0	Non-Networked	47.56216	-122.68429	2011-03-15	J1772	Free	US	0	0		0	0		0
39780	Burien	WA	98148	2	\N	1	Non-Networked	47.458466	-122.33326	2011-03-15	CHADEMO J1772	Free	US	1	0	min	0	0	min	0
39782	Edmonds	WA	98026	2	\N	0	Non-Networked	47.77861	-122.3462	2011-03-15	J1772	Free	US	0	0		0	0		0
39783	Everett	WA	98204	2	\N	0	Non-Networked	47.90273	-122.24699	2011-03-15	J1772	Free	US	0	0		0	0		0
39786	Olympia	WA	98502	1	\N	0	Non-Networked	47.031067	-122.930244	2011-03-15	J1772	Free	US	0	0		0	0		0
39787	Pasco	WA	99301	1	\N	0	Non-Networked	46.236607	-119.129	2011-03-15	J1772	Free	US	0	0		0	0		0
39788	Port Angeles	WA	98362	2	\N	1	Non-Networked	48.102863	-123.34227	2011-03-15	CHADEMO J1772	Free	US	1	0	min	0	0	min	0
39789	Puyallup	WA	98371	1	\N	1	Non-Networked	47.207367	-122.295	2011-03-15	CHADEMO J1772	Free	US	1	0	min	0	0	min	0
39791	Renton	WA	98058	1	\N	1	Non-Networked	47.44828	-122.219284	2011-03-15	CHADEMO J1772	Free	US	1	0	min	0	0	min	0
39795	Spokane	WA	99218	1	\N	0	Non-Networked	47.73902	-117.409935	2011-03-15	J1772	Free	US	0	0		0	0		0
39796	Spokane Valley	WA	99212	2	\N	1	Non-Networked	47.657265	-117.312515	2011-03-15	CHADEMO J1772	Free	US	1	0	min	0	0	min	0
39797	Tacoma	WA	98409	1	\N	0	Non-Networked	47.21978	-122.48576	2011-03-15	J1772	Free	US	0	0		0	0		0
39798	Vancouver	WA	98662	1	\N	0	Non-Networked	45.648094	-122.59795	2011-03-15	J1772	Free	US	0	0		0	0		0
39799	Walla Walla	WA	99362	1	\N	0	Non-Networked	46.047462	-118.35341	2011-03-15	J1772	Free	US	0	0		0	0		0
40383	Bellevue	WA	98004	6	\N	0	ChargePoint Network	47.615845	-122.196884	\N	J1772	Free	US	0	0		0	0		0
40384	Bellevue	WA	98004	6	\N	0	ChargePoint Network	47.614105	-122.19449	\N	J1772	Pricing is based on length of time. $0 per hour for the first 4 hours, and $1 per additional hour, maximum payment of $48	US	0	0		0	0		0
40772	Everett	WA	98201	8	\N	0	Non-Networked	47.97725	-122.20637	2011-08-01	J1772	Free	US	0	0		0	0		0
41579	Seattle	WA	98104	2	\N	0	Non-Networked	47.604115	-122.33291	2011-10-01	J1772	Free	US	0	0		0	0		0
41774	Issaquah	WA	98029	2	2	0	ChargePoint Network	47.54458	-122.01682	\N	J1772 NEMA520	Free	US	0	0		0	0		0
41776	SeaTac	WA	98188	2	\N	0	ChargePoint Network	47.43402	-122.273186	\N	J1772	$2 per session	US	0	0		0	0		0
41780	Tacoma	WA	98409	4	\N	0	ChargePoint Network	47.22798	-122.4851	\N	J1772	Pricing is by session. $2 per session, maximum session time is 5 hours	US	0	0		0	0		0
42047	Tacoma	WA	98421	2	\N	0	ChargePoint Network	47.2593	-122.43424	\N	J1772	Pricing is by session. $2 per session, maximum session time is 5 hours	US	0	0		0	0		0
42051	Tacoma	WA	98402	4	\N	0	Non-Networked	47.254353	-122.43961	2011-11-30	J1772	\N	US	0	0		0	0		0
42224	Bellevue	WA	98008	2	\N	0	ChargePoint Network	47.618786	-122.12247	\N	J1772	$2 per hour, minimum payment of $2	US	0	0		0	0		0
42225	Bellevue	WA	98008	2	\N	0	ChargePoint Network	47.617783	-122.12191	\N	J1772	$2 per hour, minimum payment of $2	US	0	0		0	0		0
42228	Bellevue	WA	98006	2	\N	0	ChargePoint Network	47.56885	-122.14562	\N	J1772	$2 per hour, minimum payment of $2	US	0	0		0	0		0
42229	Bellevue	WA	98007	4	\N	0	ChargePoint Network	47.582367	-122.13528	\N	J1772	Free	US	0	0		0	0		0
42231	Bellevue	WA	98005	2	2	0	ChargePoint Network	47.581818	-122.15409	\N	J1772 NEMA520	$0.1 per kWh, minimum payment of $0.1, maximum payment of $0.1	US	0	0		0	0		0
42237	Kirkland	WA	98033	2	\N	0	ChargePoint Network	47.678474	-122.20681	\N	J1772	Free	US	0	0		0	0		0
42238	Kirkland	WA	98033	4	\N	0	ChargePoint Network	47.67567	-122.20207	\N	J1772	Free	US	0	0		0	0		0
42240	Sammamish	WA	98075	8	\N	0	ChargePoint Network	47.601448	-122.03797	\N	J1772	$1 per hour, minimum payment of $1	US	0	0		0	0		0
42657	Mt Vernon	WA	98273	2	2	0	ChargePoint Network	48.39892	-122.333626	\N	J1772 NEMA520	Pricing is based on an hourly rate. $1 per hour, minimum payment of $2, maximum session time is 24 hours	US	0	0		0	0		0
43298	Edmonds	WA	98020	1	1	0	ChargePoint Network	47.791126	-122.366066	\N	J1772 NEMA520	Free	US	0	0		0	0		0
43299	Kent	WA	98032	2	\N	0	ChargePoint Network	47.42422	-122.25662	\N	J1772	Free	US	0	0		0	0		0
43303	Renton	WA	98055	4	\N	0	ChargePoint Network	47.441296	-122.21425	\N	J1772	Free	US	0	0		0	0		0
43305	Renton	WA	98055	4	\N	0	ChargePoint Network	47.44423	-122.21453	\N	J1772	Free	US	0	0		0	0		0
43306	Seattle	WA	98101	7	\N	0	ChargePoint Network	47.6126	-122.3347	\N	J1772	$2 per session	US	0	0		0	0		0
43398	Seattle	WA	98126	1	\N	0	SemaCharge Network	47.545464	-122.37641	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
43402	Shoreline	WA	98133	1	\N	0	SemaCharge Network	47.756603	-122.34523	\N	J1772	FREE	US	0	0		0	0		0
43792	Mercer Island	WA	98040	1	\N	0	SemaCharge Network	47.586666	-122.234085	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
43796	Renton	WA	98057	2	\N	0	Non-Networked	47.474537	-122.20498	2017-01-12	J1772	Free	US	0	0		0	0		0
43804	Tacoma	WA	98402	2	\N	0	ChargePoint Network	47.25381	-122.43743	\N	J1772	Pricing is by session. $3 per session, maximum session time is 8 hours	US	0	0		0	0		0
43806	Tacoma	WA	98402	2	\N	0	ChargePoint Network	47.245934	-122.43398	\N	J1772	Pricing is by session. $3 per session, maximum session time is 8 hours	US	0	0		0	0		0
43808	Tacoma	WA	98409	1	\N	0	Non-Networked	47.229164	-122.467705	2011-12-01	J1772	Free	US	0	0		0	0		0
43809	Tacoma	WA	98402	1	\N	0	Non-Networked	47.25367	-122.446144	2011-12-01	J1772	Free	US	0	0		0	0		0
44153	Seattle	WA	98104	3	\N	0	Non-Networked	47.606686	-122.332664	2011-12-01	J1772	$2 per session	US	0	0		0	0		0
44159	Seattle	WA	98109	9	\N	0	Non-Networked	47.622086	-122.34712	2011-12-01	J1772	$2 per session	US	0	0		0	0		0
44168	Tacoma	WA	98405	1	\N	0	ChargePoint Network	47.23916	-122.4976	\N	J1772	Pricing is by session. $3 per session, maximum session time is 8 hours	US	0	0		0	0		0
44169	Tacoma	WA	98409	1	1	0	ChargePoint Network	47.226925	-122.47528	\N	J1772 NEMA520	Pricing is based on an hourly rate. $1.75 per hour, minimum payment of $2, maximum payment of $16, maximum session time is 24 hours	US	0	0		0	0		0
44170	Lakewood	WA	98499	1	\N	0	SemaCharge Network	47.17158	-122.51762	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
44265	Anacortes	WA	98221	1	\N	0	SemaCharge Network	48.508156	-122.61184	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
44267	Bellevue	WA	98005	1	\N	0	SemaCharge Network	47.616558	-122.1537	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
44269	Bothell	WA	98201	1	\N	0	SemaCharge Network	47.808372	-122.20871	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
44504	Tacoma	WA	98408	1	\N	0	SemaCharge Network	47.20619	-122.4344	\N	J1772	FREE	US	0	0		0	0		0
44509	Yakima	WA	98901	1	\N	0	Non-Networked	46.590244	-120.50069	2011-11-30	J1772	Free	US	0	0		0	0		0
45016	Vancouver	WA	98661	1	\N	0	SemaCharge Network	45.667934	-122.603905	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
45185	Olympia	WA	98502	2	\N	0	ChargePoint Network	47.029713	-122.91159	\N	J1772	Pricing is based on an hourly rate. $0.5 per hour, minimum payment of $0.75	US	0	0		0	0		0
45209	Monroe	WA	98272	2	\N	0	Non-Networked	47.868916	-121.98745	2012-01-20	J1772	Free	US	0	0		0	0		0
45211	Snohomish	WA	98296	3	\N	0	Non-Networked	47.8647	-122.13867	2012-01-20	J1772	Free	US	0	0		0	0		0
46390	Oak Harbor	WA	98277	2	\N	0	ChargePoint Network	48.288067	-122.648224	\N	J1772	Free	US	0	0		0	0		0
47409	Issaquah	WA	98027	2	\N	0	ChargePoint Network	47.550037	-122.05793	\N	J1772	Free	US	0	0		0	0		0
49068	Wenatchee	WA	98801	1	\N	0	Non-Networked	47.44851	-120.331436	2012-04-01	J1772	$5 per session for non-guests	US	0	0		0	0		0
49230	Seattle	WA	98104	6	\N	0	ChargePoint Network	47.59878	-122.33083	\N	J1772	Pricing is by session. $2 per session, maximum session time is 24 hours	US	0	0		0	0		0
49409	Tacoma	WA	98407	1	1	0	ChargePoint Network	47.30389	-122.52094	\N	J1772 NEMA520	Pricing is by session. $3 per session, maximum session time is 24 hours	US	0	0		0	0		0
49761	Olympia	WA	98501	2	\N	0	ChargePoint Network	47.043304	-122.86297	\N	J1772	Free	US	0	0		0	0		0
49766	Seattle	WA	98101	1	\N	0	ChargePoint Network	47.605984	-122.338745	\N	J1772	$0.39 per kWh, minimum payment of $1	US	0	0		0	0		0
50210	Mt Vernon	WA	98273	2	1	0	ChargePoint Network	48.437183	-122.3251	\N	J1772 NEMA520	Pricing is based on an hourly rate. $0.25 per hour, minimum payment of $1	US	0	0		0	0		0
51314	Edmonds	WA	98026	2	\N	0	ChargePoint Network	47.804363	-122.33416	\N	J1772	Free	US	0	0		0	0		0
51708	Seattle	WA	98101	4	\N	0	ChargePoint Network	47.616592	-122.32989	\N	J1772	Free	US	0	0		0	0		0
51709	Seattle	WA	98101	4	\N	0	ChargePoint Network	47.615963	-122.33076	\N	J1772	Free	US	0	0		0	0		0
51905	Sequim	WA	98382	1	\N	0	Non-Networked	48.079906	-123.105774	2013-05-15	J1772	Free	US	0	0		0	0		0
52138	Kirkland	WA	98033	2	\N	0	ChargePoint Network	47.64476	-122.199165	\N	J1772	Pricing is by session. $2 per session, maximum session time is 24 hours	US	0	0		0	0		0
52265	Gig Harbor	WA	98335	4	\N	0	ChargePoint Network	47.299454	-122.576	\N	J1772	Pricing is based on an hourly rate. $1 per hour, minimum payment of $1, maximum payment of $4, maximum session time is 4 hours	US	0	0		0	0		0
52267	Kirkland	WA	98033	2	\N	0	ChargePoint Network	47.643448	-122.2039	\N	J1772	Pricing is based on an hourly rate. $1 per hour	US	0	0		0	0		0
52558	Gig Harbor	WA	98335	2	\N	0	ChargePoint Network	47.3019	-122.579544	\N	J1772	$1.5 per hour	US	0	0		0	0		0
52863	Shelton	WA	98584	2	\N	0	ChargePoint Network	47.12823	-123.10327	\N	J1772	Free	US	0	0		0	0		0
53474	Seattle	WA	98121	2	\N	0	ChargePoint Network	47.614086	-122.33953	\N	J1772	$1 per hour	US	0	0		0	0		0
53475	Shoreline	WA	98155	2	\N	0	ChargePoint Network	47.756897	-122.31235	\N	J1772	Pricing is based on length of time. $0.49 per hour for the first 2 hours, and $1 per additional hour, maximum payment of $10	US	0	0		0	0		0
53702	Mazama	WA	98833	1	\N	0	Non-Networked	48.594482	-120.406494	2013-11-01	J1772	Free	US	0	0		0	0		0
53968	Vancouver	WA	98661	2	\N	0	Non-Networked	45.650387	-122.604004	2013-04-01	J1772	Free	US	0	0		0	0		0
55658	Olympia	WA	98501	2	\N	0	ChargePoint Network	47.04489	-122.8953	\N	J1772	Pricing is based on an hourly rate. $1 per hour, minimum payment of $1	US	0	0		0	0		0
55778	Seattle	WA	98103	2	\N	0	ChargePoint Network	47.659534	-122.34258	\N	J1772	Pricing is based on an hourly rate. $1.05 per hour, minimum payment of $5	US	0	0		0	0		0
55995	Seattle	WA	98121	2	\N	0	ChargePoint Network	47.613884	-122.33941	\N	J1772	$0.5 per hour, minimum payment of $1.5	US	0	0		0	0		0
56168	Issaquah	WA	98027	2	\N	0	ChargePoint Network	47.5451	-122.01975	\N	J1772	Pricing is by session. $2 per session, maximum session time is 24 hours	US	0	0		0	0		0
68238	Anacortes	WA	98221	1	\N	0	SemaCharge Network	48.50129	-122.61525	\N	J1772	$1.70/Hr Parking Fee	US	0	0		0	0		0
56360	Seattle	WA	98136	5	\N	0	ChargePoint Network	47.522915	-122.39366	\N	J1772	Pricing is by session. $2 per session, maximum session time is 24 hours	US	0	0		0	0		0
56361	Seattle	WA	98104	2	\N	0	ChargePoint Network	47.602676	-122.3274	\N	J1772	Pricing is by session. $2 per session, maximum session time is 24 hours	US	0	0		0	0		0
56362	Seattle	WA	98104	1	\N	0	ChargePoint Network	47.60324	-122.32757	\N	J1772	Pricing is by session. $2 per session, maximum session time is 24 hours	US	0	0		0	0		0
56870	Seattle	WA	98104	2	\N	0	ChargePoint Network	47.6056	-122.33063	\N	J1772	Free	US	0	0		0	0		0
57715	Seattle	WA	98102	6	\N	0	ChargePoint Network	47.62009	-122.31974	\N	J1772	Pricing is based on an hourly rate. $1.5 per hour	US	0	0		0	0		0
60003	Chelan	WA	98816	1	\N	0	Non-Networked	47.8399	-120.0199	2013-10-04	J1772	Free	US	0	0		0	0		0
60004	Winthrop	WA	98862	1	\N	0	Non-Networked	48.476543	-120.18079	2013-09-23	J1772	Free	US	0	0		0	0		0
60005	Omak	WA	98841	1	\N	0	Non-Networked	48.42169	-119.50409	2013-10-04	J1772	Free	US	0	0		0	0		0
60006	Leavenworth	WA	98826	1	\N	0	Non-Networked	47.758434	-120.74242	2014-01-15	J1772	Free	US	0	0		0	0		0
60007	Pateros	WA	98846	1	\N	0	Non-Networked	48.051826	-119.901505	2013-12-28	J1772	Free	US	0	0		0	0		0
60229	Ridgefield	WA	98642	1	\N	0	Non-Networked	45.74807	-122.66282	2014-01-01	J1772	Free	US	0	0		0	0		0
60241	Bellevue	WA	98004	2	\N	0	ChargePoint Network	47.620792	-122.19247	\N	J1772	Pricing is based on an hourly rate. $2 per hour, minimum payment of $2, maximum payment of $5	US	0	0		0	0		0
60331	Renton	WA	98055	4	\N	0	ChargePoint Network	47.440845	-122.2131	\N	J1772	Free	US	0	0		0	0		0
60412	Bellevue	WA	98004	4	\N	1	ChargePoint Network	47.597294	-122.18807	\N	CHADEMO J1772	Pricing is based on length of time. $0 per hour, and $5 per additional hour	US	1	0	min	0	0	min	0
60463	Olympia	WA	98501	2	\N	0	ChargePoint Network	47.040863	-122.89159	\N	J1772	Pricing is based on an hourly rate. $1 per hour, minimum payment of $1	US	0	0		0	0		0
60639	Tacoma	WA	98421	6	\N	0	ChargePoint Network	47.25993	-122.43388	\N	J1772	Pricing is by session. $2 per session, maximum session time is 5 hours	US	0	0		0	0		0
60718	Bremerton	WA	98312	1	\N	0	Non-Networked	47.5578	-122.67534	2014-01-01	J1772	Free	US	0	0		0	0		0
60814	Cougar	WA	98616	1	\N	0	Non-Networked	46.051228	-122.30176	2014-03-06	J1772	$5 per session	US	0	0		0	0		0
60920	Seattle	WA	98101	2	\N	0	ChargePoint Network	47.606735	-122.335556	\N	J1772	Free	US	0	0		0	0		0
61030	Vancouver	WA	98662	0	\N	1	ChargePoint Network	45.648182	-122.59837	\N	CHADEMO	Free	US	1	0	min	0	0	min	0
61426	Mercer Island	WA	98040	2	\N	0	ChargePoint Network	47.572422	-122.22326	\N	J1772	$1 per hour, minimum payment of $1	US	0	0		0	0		0
61453	Bellingham	WA	98226	2	\N	0	SemaCharge Network	48.79149	-122.49236	\N	J1772	FREE	US	0	0		0	0		0
61562	Olympia	WA	98501	1	1	0	ChargePoint Network	47.047955	-122.898674	\N	J1772 NEMA520	Pricing is based on an hourly rate. $1 per hour	US	0	0		0	0		0
61580	Mercer Island	WA	98040	2	\N	0	ChargePoint Network	47.571243	-122.22315	\N	J1772	$1 per hour, minimum payment of $1	US	0	0		0	0		0
61863	Seattle	WA	98105	4	\N	0	ChargePoint Network	47.664356	-122.283035	\N	J1772	Free	US	0	0		0	0		0
61877	Bremerton	WA	98337	4	4	0	OpConnect	47.563713	-122.62542	2013-12-31	J1772 NEMA520	Free	US	0	0		0	0		0
61930	Richland	WA	99352	2	\N	0	ChargePoint Network	46.260178	-119.280815	\N	J1772	Free	US	0	0		0	0		0
62125	Bellingham	WA	98226	2	\N	0	ChargePoint Network	48.772297	-122.44327	\N	J1772	Pricing is based on an hourly rate. $1 per hour, minimum payment of $1, maximum payment of $5	US	0	0		0	0		0
62210	Seattle	WA	98108	1	\N	0	ChargePoint Network	47.5369	-122.3035	\N	J1772	Pricing is by session. $2 per session, maximum session time is 24 hours	US	0	0		0	0		0
62286	Blaine	WA	98230	1	\N	0	Non-Networked	48.990494	-122.77446	2014-04-01	J1772	\N	US	0	0		0	0		0
62516	Wenatchee	WA	98801	1	\N	0	Non-Networked	47.425377	-120.30761	2014-07-07	J1772	Free	US	0	0		0	0		0
62654	Bellevue	WA	98004	6	\N	0	ChargePoint Network	47.619747	-122.19697	\N	J1772	$1.5 per hour, minimum payment of $1.5, maximum payment of $9, maximum session time is 24 hours	US	0	0		0	0		0
62692	Bellingham	WA	98226	1	\N	0	Non-Networked	48.783253	-122.48392	2014-03-21	J1772	Free	US	0	0		0	0		0
62728	Bellevue	WA	98004	2	\N	0	ChargePoint Network	47.61984	-122.19603	\N	J1772	$1.5 per hour, minimum payment of $1.5, maximum payment of $9, maximum session time is 24 hours	US	0	0		0	0		0
62796	Seattle	WA	98109	2	\N	0	ChargePoint Network	47.62313	-122.33144	\N	J1772	$1.5 per hour	US	0	0		0	0		0
62973	Chelan	WA	98816	2	\N	0	Non-Networked	47.84084	-120.0184	2014-08-18	J1772	Free	US	0	0		0	0		0
63088	Longview	WA	98632	2	\N	0	ChargePoint Network	46.141922	-122.94019	\N	J1772	Free	US	0	0		0	0		0
63110	Bellevue	WA	98004	2	\N	0	ChargePoint Network	47.638268	-122.19129	\N	J1772	Pricing is based on length of time. $2 per hour for the first 2 hours, and $5 per additional hour	US	0	0		0	0		0
63198	Mercer Island	WA	98040	2	\N	0	ChargePoint Network	47.571304	-122.21889	\N	J1772	$1 per hour, minimum payment of $1	US	0	0		0	0		0
63307	Seattle	WA	98122	0	\N	1	ChargePoint Network	47.61491	-122.31441	\N	CHADEMO	Pricing is based on length of time. $1 per hour for the first 1 hour, and $5 per additional hour	US	1	3	min	0	0	min	1
63313	Seattle	WA	98105	2	\N	0	ChargePoint Network	47.658962	-122.3185	\N	J1772	Pricing is based on length of time. $2 per hour for the first 2 hours, and $5 per additional hour	US	0	0		0	0		0
63338	Seattle	WA	98105	2	\N	0	ChargePoint Network	47.65841	-122.31839	\N	J1772	Pricing is based on length of time. $2 per hour for the first 2 hours, and $5 per additional hour	US	0	0		0	0		0
63424	Port Angeles	WA	98362	1	1	0	Non-Networked	48.120934	-123.43444	2014-02-01	J1772 NEMA1450	Free	US	0	0		0	0		0
63444	East Wenatchee	WA	98802	1	\N	1	Non-Networked	47.400784	-120.27907	2010-12-17	CHADEMO J1772	Free	US	1	0	min	0	0	min	0
63549	Kirkland	WA	98033	5	\N	0	ChargePoint Network	47.643837	-122.19674	\N	J1772	Pricing is by session. $2 per session, maximum session time is 24 hours	US	0	0		0	0		0
63780	Kirkland	WA	98034	2	\N	0	ChargePoint Network	47.716057	-122.17945	\N	J1772	$0.5 per hour, minimum payment of $1	US	0	0		0	0		0
63781	Kirkland	WA	98034	2	\N	0	ChargePoint Network	47.714436	-122.1794	\N	J1772	$0.5 per hour, minimum payment of $1	US	0	0		0	0		0
63782	Kirkland	WA	98034	2	\N	0	ChargePoint Network	47.714794	-122.17687	\N	J1772	$0.5 per hour, minimum payment of $1	US	0	0		0	0		0
63828	Seattle	WA	98125	1	\N	0	SemaCharge Network	47.731274	-122.29306	\N	J1772	$0.00-$10.00/Hr Variable Parking Fee	US	0	0		0	0		0
63946	Tukwila	WA	98188	3	\N	0	ChargePoint Network	47.461597	-122.24249	\N	J1772	Pricing is by session. $2 per session, maximum session time is 24 hours	US	0	0		0	0		0
63947	Tukwila	WA	98188	1	\N	0	ChargePoint Network	47.461113	-122.24232	\N	J1772	Pricing is by session. $2 per session, maximum session time is 24 hours	US	0	0		0	0		0
64095	Seattle	WA	98107	1	\N	0	ChargePoint Network	47.669598	-122.37446	\N	J1772	$0.1 per kWh	US	0	0		0	0		0
64135	Kennewick	WA	99336	2	\N	0	Non-Networked	46.213234	-119.16237	2014-03-01	J1772	Free	US	0	0		0	0		0
64185	Seattle	WA	98134	2	\N	0	ChargePoint Network	47.59404	-122.323975	\N	J1772	Pricing is based on length of time. $5 per hour for the first 1 hour, and $10 per additional hour, minimum payment of $5	US	0	0		0	0		0
64475	Mukilteo	WA	98275	2	\N	0	ChargePoint Network	47.890423	-122.28697	\N	J1772	Pricing is based on length of time. $0.5 per hour for the first 4 hours, and $3 per additional hour	US	0	0		0	0		0
64500	Chelan	WA	98816	1	\N	0	Non-Networked	47.835224	-120.068985	2014-11-29	J1772	Free	US	0	0		0	0		0
64703	Renton	WA	98057	1	\N	0	Non-Networked	47.47015	-122.218765	2014-12-01	J1772	Free	US	0	0		0	0		0
64939	Bellevue	WA	98004	2	\N	0	ChargePoint Network	47.614178	-122.196754	\N	J1772	$0.1 per kWh	US	0	0		0	0		0
65035	Seattle	WA	98102	2	\N	0	ChargePoint Network	47.633705	-122.325836	\N	J1772	$0.49 per kWh	US	0	0		0	0		0
65241	Seattle	WA	98164	2	\N	0	ChargePoint Network	47.605816	-122.33198	\N	J1772	Pricing is based on length of time. $1.5 per hour for the first 4 hours, and $2.5 per additional hour, minimum payment of $1.5, maximum payment of $20, maximum session time is 12 hours	US	0	0		0	0		0
65267	Seattle	WA	98102	2	\N	0	ChargePoint Network	47.634438	-122.324585	\N	J1772	$0.49 per kWh	US	0	0		0	0		0
65345	Suquamish	WA	98392	4	\N	0	ChargePoint Network	47.71257	-122.572	\N	J1772	Free	US	0	0		0	0		0
65414	Issaquah	WA	98065	12	\N	0	Non-Networked	47.51911	-121.84179	2015-01-01	J1772	\N	US	0	0		0	0		0
65427	Seattle	WA	98101	4	\N	0	ChargePoint Network	47.61397	-122.33352	\N	J1772	Pricing is based on an hourly rate. $0.5 per hour, minimum payment of $0.5, maximum payment of $9, maximum session time is 24 hours	US	0	0		0	0		0
65551	Edmonds	WA	98020	0	\N	1	ChargePoint Network	47.77819	-122.34483	\N	CHADEMO	$6 per session	US	1	6	min	0	0	min	0
65859	Wenatchee	WA	98801	1	\N	1	Webasto	47.42758	-120.31231	\N	CHADEMO J1772	Level 2: $4 per session or $19.99 for monthly plan, DC Fast: $7.50 per session or $19.99 for monthly plan	US	1	7.5	min	0	0	min	0
65860	Ridgefield	WA	98642	1	\N	0	Webasto	45.77671	-122.669	\N	J1772	Level 2: $4 per session or $19.99 for monthly plan	US	0	0		0	0		0
65861	Centralia	WA	98531	1	\N	1	Webasto	46.725273	-122.97422	\N	CHADEMO J1772	Level 2: $4 per session or $19.99 for monthly plan, DC Fast: $7.50 per session or $19.99 for monthly plan	US	1	7.5	min	0	0	min	0
65862	Bellingham	WA	98325	1	\N	1	Webasto	48.731457	-122.4707	\N	CHADEMO J1772	Level 2: $4 per session or $19.99 for monthly plan, DC Fast: $7.50 per session or $19.99 for monthly plan	US	1	7.5	min	0	0	min	0
65864	Castle Rock	WA	98611	1	\N	1	Webasto	46.276123	-122.910164	\N	CHADEMO J1772	DC Fast: $7.50 per session or $19.99 for monthly plan, Level 2: $4 per session or $19.99 for monthly plan	US	1	7.5	min	0	0	min	0
65865	Burlington	WA	98233	1	\N	1	Webasto	48.457447	-122.33587	\N	CHADEMO J1772	DC Fast: $7.50 per session or $19.99 for monthly plan, Level 2: $4 per session or $19.99 for monthly plan	US	1	7.5	min	0	0	min	0
65866	Ridgefield	WA	98642	1	\N	1	Webasto	45.817528	-122.68359	\N	CHADEMO J1772	DC Fast: $7.50 per session or $19.99 for monthly plan, Level 2: $4 per session or $19.99 for monthly plan	US	1	7.5	min	0	0	min	0
65868	Custer	WA	98240	2	\N	0	Webasto	48.927902	-122.648346	\N	J1772	Level 2: $4 per session or $19.99 for monthly plan	US	0	0		0	0		0
65869	Skykomish	WA	98288	1	\N	1	Webasto	47.71127	-121.3605	\N	CHADEMO J1772	DC Fast: $7.50 per session or $19.99 for monthly plan, Level 2: $4 per session or $19.99 for monthly plan	US	1	7.5	min	0	0	min	0
65870	Ridgefield	WA	98642	1	\N	0	Webasto	45.77671	-122.669	\N	J1772	Level 2: $4 per session or $19.99 for monthly plan	US	0	0		0	0		0
66221	Seattle	WA	98125	4	\N	0	ChargePoint Network	47.708347	-122.322014	\N	J1772	$1 per hour	US	0	0		0	0		0
66285	Bellevue	WA	98004	1	\N	0	ChargePoint Network	47.6155	-122.19885	\N	J1772	$2 per hour, minimum payment of $2	US	0	0		0	0		0
66418	Port Townsend	WA	98368	2	\N	0	Non-Networked	48.093636	-122.813255	2012-06-01	J1772	Free	US	0	0		0	0		0
66419	Port Townsend	WA	98368	1	\N	0	Non-Networked	48.10241	-122.80229	2015-02-01	J1772	Free	US	0	0		0	0		0
66421	Port Townsend	WA	98368	2	\N	0	Non-Networked	48.10306	-122.79414	2015-02-03	J1772	Free	US	0	0		0	0		0
66422	Port Townsend	WA	98368	1	\N	0	Non-Networked	48.113018	-122.760544	2015-02-04	J1772	Free	US	0	0		0	0		0
66423	Port Townsend	WA	98368	1	\N	0	Non-Networked	48.11612	-122.75149	2015-02-05	J1772	Free	US	0	0		0	0		0
66594	Bellevue	WA	98004	4	\N	0	ChargePoint Network	47.611805	-122.18618	\N	J1772	Pricing is based on length of time. $2.5 per hour for the first 4 hours, and $5 per additional hour, maximum payment of $50	US	0	0		0	0		0
66622	Spokane	WA	99224	2	\N	0	ChargePoint Network	47.62509	-117.53956	\N	J1772	Free	US	0	0		0	0		0
66645	Kirkland	WA	98034	2	\N	0	ChargePoint Network	47.716064	-122.17961	\N	J1772	$0.5 per hour, minimum payment of $1	US	0	0		0	0		0
66696	Bainbridge Island	WA	98110	2	\N	0	ChargePoint Network	47.62492	-122.51934	\N	J1772	$0.29 per kWh	US	0	0		0	0		0
67125	Sequim	WA	98382	1	\N	0	Non-Networked	48.0799	-123.099	2015-01-01	J1772	Free	US	0	0		0	0		0
67692	Tacoma	WA	98402	2	\N	0	ChargePoint Network	47.252087	-122.43754	\N	J1772	$0.25 per kWh	US	0	0		0	0		0
68122	Bellevue	WA	98005	2	\N	0	ChargePoint Network	47.61386	-122.181595	\N	J1772	Free	US	0	0		0	0		0
68187	Issaquah	WA	98027	2	\N	0	ChargePoint Network	47.54709	-122.06534	\N	J1772	$0.5 per hour, $2 per session	US	0	0		0	0		0
68192	Richland	WA	99354	1	\N	0	SemaCharge Network	46.3344	-119.269806	\N	J1772	FREE	US	0	0		0	0		0
68237	Anacortes	WA	98221	1	\N	0	SemaCharge Network	48.500656	-122.61596	\N	J1772	$1.70/Hr Parking Fee	US	0	0		0	0		0
68846	Coulee City	WA	99115	1	\N	0	Non-Networked	47.61678	-119.28762	2015-08-03	J1772	Free	US	0	0		0	0		0
68940	Seattle	WA	98101	3	\N	0	ChargePoint Network	47.60916	-122.326225	\N	J1772	Free	US	0	0		0	0		0
69058	Des Moines	WA	98198	1	\N	0	SemaCharge Network	47.39515	-122.29532	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
69193	Bellevue	WA	98004	1	\N	0	ChargePoint Network	47.619225	-122.19348	\N	J1772	$2 per hour, minimum payment of $2	US	0	0		0	0		0
69209	Bainbridge Island	WA	98110	2	\N	0	ChargePoint Network	47.62419	-122.51751	\N	J1772	$0.1 per kWh	US	0	0		0	0		0
69700	Bellevue	WA	98005	0	\N	1	ChargePoint Network	47.627403	-122.157875	\N	J1772COMBO	Free	US	2	0	min	0	0	min	0
69853	Seattle	WA	98121	3	\N	0	ChargePoint Network	47.61675	-122.34329	\N	J1772	$0.11 per kWh	US	0	0		0	0		0
70036	Seattle	WA	98109	4	\N	0	ChargePoint Network	47.6194	-122.346695	\N	J1772	$1.1 per hour	US	0	0		0	0		0
70092	Bothell	WA	98011	4	\N	0	ChargePoint Network	47.76186	-122.19188	\N	J1772	Free	US	0	0		0	0		0
70095	Bothell	WA	98011	2	\N	0	ChargePoint Network	47.757843	-122.19072	\N	J1772	Free	US	0	0		0	0		0
70235	Spokane	WA	99202	2	\N	0	ChargePoint Network	47.669044	-117.402596	\N	J1772	Pricing is based on length of time. $0 per hour for the first 4 hours, and $3 per additional hour	US	0	0		0	0		0
71773	Federal Way	WA	98003	1	\N	0	Non-Networked	47.313656	-122.300514	2019-06-28	J1772	\N	US	0	0		0	0		0
71774	Tacoma	WA	98421	1	\N	0	Non-Networked	47.238613	-122.426704	2015-12-01	J1772	\N	US	0	0		0	0		0
71781	Port Angeles	WA	98362	1	\N	0	Non-Networked	48.11273	-123.2556	2015-10-01	J1772	\N	US	0	0		0	0		0
71782	Benton City	WA	99320	1	1	0	Non-Networked	46.2938	-119.45133	2015-11-01	J1772 NEMA515	Free	US	0	0		0	0		0
71791	Spokane	WA	99201	1	\N	0	Non-Networked	47.66344	-117.41278	2015-11-01	J1772	Free	US	0	0		0	0		0
71795	Seaview	WA	98644	1	\N	0	Non-Networked	46.334797	-124.05508	2015-12-01	J1772	\N	US	0	0		0	0		0
71918	Bellevue	WA	98008	2	\N	0	ChargePoint Network	47.57705	-122.12517	\N	J1772	Pricing is based on an hourly rate. $1 per hour	US	0	0		0	0		0
72656	Seattle	WA	98104	4	\N	0	ChargePoint Network	47.610092	-122.322136	\N	J1772	Pricing is based on length of time. $0.75 per hour for the first 4 hours, and $3 per additional hour	US	0	0		0	0		0
72739	Seattle	WA	98109	1	\N	0	GE WattStation	47.62328	-122.35492	\N	J1772	$1.00 per hour, first 5 minutes free, minimum payment of $0.50	US	0	0		0	0		0
73172	Bellevue	WA	98004	20	\N	0	ChargePoint Network	47.609577	-122.20229	\N	J1772	$2 per hour	US	0	0		0	0		0
73197	Burien	WA	98166	7	\N	0	ChargePoint Network	47.469463	-122.33832	\N	J1772	Pricing is by session. $2 per session, maximum session time is 24 hours	US	0	0		0	0		0
73219	Spokane	WA	99224	2	\N	0	ChargePoint Network	47.63099	-117.540535	\N	J1772	Free	US	0	0		0	0		0
73412	Tumwater	WA	98501	1	\N	1	Webasto	46.99353	-122.90808	\N	CHADEMO J1772	Level 2: $4 per session or $19.99 for monthly plan, DC Fast: $7.50 per session or $19.99 for monthly plan	US	1	7.5	min	0	0	min	0
73413	Leavenworth	WA	98826	1	\N	1	Webasto	47.59501	-120.66468	\N	CHADEMO J1772	Level 2: $4 per session or $19.99 for monthly plan, DC Fast: $7.50 per session or $19.99 for monthly plan	US	1	7.5	min	0	0	min	0
73415	Sultan	WA	98294	1	\N	1	Webasto	47.862156	-121.8166	\N	CHADEMO J1772	Level 2: $4 per session or $19.99 for monthly plan, DC Fast: $7.50 per session or $19.99 for monthly plan	US	1	7.5	min	0	0	min	0
73431	Cle Elum	WA	98922	1	\N	1	Webasto	47.20847	-121.019585	\N	CHADEMO J1772	DC Fast: $7.50 per session or $19.99 for monthly plan, Level 2: $4 per session or $19.99 for monthly plan	US	1	7.5	min	0	0	min	0
73433	Snoqualmie Pass	WA	98068	1	\N	1	Webasto	47.39194	-121.40061	\N	CHADEMO J1772	Level 2: $4 per session or $19.99 for monthly plan, DC Fast: $7.50 per session or $19.99 for monthly plan	US	1	7.5	min	0	0	min	0
73660	Issaquah	WA	98029	3	\N	0	ChargePoint Network	47.54455	-122.01955	\N	J1772	Pricing is by session. $2 per session, maximum session time is 24 hours	US	0	0		0	0		0
74043	Issaquah	WA	98029	3	\N	0	SemaCharge Network	47.53656	-122.020546	\N	J1772	$0.00-$5.00/Hr Variable Parking Fee	US	0	0		0	0		0
74196	Everett	WA	98204	0	\N	1	Non-Networked	47.906082	-122.23658	2016-01-01	CHADEMO J1772COMBO	\N	US	3	5	min	0	0	min	0
74301	Seattle	WA	98105	1	\N	0	Non-Networked	47.66159	-122.324875	2011-10-01	J1772	Free	US	0	0		0	0		0
74717	Bothell	WA	98011	2	\N	0	ChargePoint Network	47.766922	-122.19194	\N	J1772	$2 per hour, minimum payment of $1	US	0	0		0	0		0
75094	Everett	WA	98204	0	\N	2	ChargePoint Network	47.902752	-122.24699	\N	CHADEMO	$6 per session	US	1	6	min	0	0	min	0
75391	Seattle	WA	98154	4	\N	0	ChargePoint Network	47.606106	-122.333786	\N	J1772	Pricing is based on length of time. $1 per hour for the first 4 hours, and $10 per additional hour	US	0	0		0	0		0
75997	Kirkland	WA	98034	1	\N	0	Non-Networked	47.705982	-122.17575	2016-05-01	J1772	Free	US	0	0		0	0		0
76253	Kirkland	WA	98033	0	\N	1	Non-Networked	47.67862	-122.18137	2015-08-01	CHADEMO J1772COMBO	\N	US	3	0	min	0.25	0	min	0
76839	Mercer Island	WA	98040	2	\N	0	ChargePoint Network	47.57364	-122.22365	\N	J1772	$1 per hour, minimum payment of $1	US	0	0		0	0		0
76857	Pullman	WA	99163	2	\N	0	ChargePoint Network	46.732395	-117.164375	\N	J1772	Free	US	0	0		0	0		0
76858	Pullman	WA	99163	2	\N	0	ChargePoint Network	46.729675	-117.16139	\N	J1772	Free	US	0	0		0	0		0
76926	Fife	WA	98424	2	\N	1	ChargePoint Network	47.23919	-122.37456	\N	J1772 J1772COMBO	Pricing is based on length of time. $0 per hour, and $2 per additional hour	US	2	0	min	0	0	min	0
76993	La Conner	WA	98257	2	\N	0	ChargePoint Network	48.39111	-122.49683	\N	J1772	$1 per hour	US	0	0		0	0		0
77221	Bellevue	WA	98004	2	\N	0	ChargePoint Network	47.63704	-122.19912	\N	J1772	Pricing is based on length of time. $2 per hour for the first 4 hours, and $6 per additional hour	US	0	0		0	0		0
77443	Quincy	WA	98848	2	\N	0	ChargePoint Network	47.235172	-119.85381	\N	J1772	Pricing is based on length of time and kWh used. $0 per hour for the first 4 hours, and $3 per additional hour, $0.15 per kWh	US	0	0		0	0		0
77572	Renton	WA	98057	2	\N	0	ChargePoint Network	47.456345	-122.23896	\N	J1772	Pricing is based on length of time. $0.5 per hour for the first 4 hours, and $2 per additional hour	US	0	0		0	0		0
77573	Renton	WA	98057	2	\N	0	ChargePoint Network	47.455345	-122.23885	\N	J1772	Pricing is based on length of time. $0.5 per hour for the first 4 hours, and $2 per additional hour	US	0	0		0	0		0
77574	Renton	WA	98057	2	\N	0	ChargePoint Network	47.45641	-122.23898	\N	J1772	Pricing is based on length of time. $0.5 per hour for the first 4 hours, and $2 per additional hour	US	0	0		0	0		0
77575	Renton	WA	98057	2	\N	0	ChargePoint Network	47.45519	-122.23889	\N	J1772	Pricing is based on length of time. $0.5 per hour for the first 4 hours, and $2 per additional hour	US	0	0		0	0		0
77771	Twisp	WA	98856	1	\N	0	Non-Networked	48.362103	-120.121376	2016-08-05	J1772	Free	US	0	0		0	0		0
78230	Seattle	WA	98144	2	\N	0	ChargePoint Network	47.595547	-122.31163	\N	J1772	$0.23 per kWh	US	0	0		0	0		0
78231	Seattle	WA	98144	2	\N	0	ChargePoint Network	47.59539	-122.31151	\N	J1772	$0.23 per kWh	US	0	0		0	0		0
78570	SeaTac	WA	98188	2	\N	0	ChargePoint Network	47.423004	-122.2989	\N	J1772	$2 per session	US	0	0		0	0		0
78571	SeaTac	WA	98198	2	\N	0	ChargePoint Network	47.423004	-122.2989	\N	J1772	$2 per session	US	0	0		0	0		0
78605	Auburn	WA	98002	2	\N	0	ChargePoint Network	47.31871	-122.22539	\N	J1772	$1 per hour	US	0	0		0	0		0
78783	Concrete	WA	98237	2	\N	0	Non-Networked	48.537037	-121.75865	2016-11-01	J1772	Free	US	0	0		0	0		0
78795	Seattle	WA	98134	0	\N	2	ChargePoint Network	47.59366	-122.32451	\N	J1772COMBO	Pricing is based on length of time. $5 per hour for the first 1 hour, and $10 per additional hour, minimum payment of $5	US	2	5	min	0	0	min	0
78874	Kent	WA	98032	1	\N	0	ChargePoint Network	47.383945	-122.23365	\N	J1772	$1 per hour, minimum payment of $1	US	0	0		0	0		0
79167	Republic	WA	99166	1	\N	0	Non-Networked	48.64698	-118.73754	2016-10-15	J1772	Free	US	0	0		0	0		0
79230	Wenatchee	WA	98801	2	\N	0	Non-Networked	47.42958	-120.31523	2016-10-03	J1772	Free	US	0	0		0	0		0
79238	Kenmore	WA	98028	2	\N	0	ChargePoint Network	47.731216	-122.249565	\N	J1772	Pricing is by session. $3 per session	US	0	0		0	0		0
79361	Bellingham	WA	98225	2	\N	0	SemaCharge Network	48.74728	-122.47622	\N	J1772	FREE	US	0	0		0	0		0
79414	Wenatchee	WA	98801	1	\N	0	Non-Networked	47.44292	-120.31624	2016-10-28	J1772	Free	US	0	0		0	0		0
79670	Seattle	WA	98105	2	\N	0	ChargePoint Network	47.661472	-122.2993	\N	J1772	Pricing is based on length of time. $2 per hour for the first 3 hours, and $8 per additional hour	US	0	0		0	0		0
79748	Seattle	WA	98104	1	\N	0	ChargePoint Network	47.599	-122.3308	\N	J1772	Pricing is by session. $2 per session, maximum session time is 24 hours	US	0	0		0	0		0
79752	Burien	WA	98166	3	\N	0	ChargePoint Network	47.46956	-122.33911	\N	J1772	Pricing is by session. $2 per session, maximum session time is 24 hours	US	0	0		0	0		0
79902	Issaquah	WA	98027	2	\N	0	ChargePoint Network	47.534916	-122.03755	\N	J1772	Pricing is based on time of day. $3 per hour from 5:00 AM to 5:30 PM	US	0	0		0	0		0
79957	Seattle	WA	98101	4	\N	0	ChargePoint Network	47.60873	-122.33561	\N	J1772	Pricing is based on length of time and kWh used. $0 per hour for the first 4 hours, and $3 per additional hour, $0.25 per kWh, maximum payment of $50	US	0	0		0	0		0
80022	Bellingham	WA	98225	4	\N	0	ChargePoint Network	48.750633	-122.47932	\N	J1772	Pricing is based on length of time. $0.75 per hour for the first 4 hours, and $2.5 per additional hour	US	0	0		0	0		0
80116	Pullman	WA	99164	2	\N	0	ChargePoint Network	46.729733	-117.156334	\N	J1772	Free	US	0	0		0	0		0
80484	Seattle	WA	98107	8	\N	0	SemaCharge Network	47.669964	-122.38475	\N	J1772	$0.00-$1.50/Hr Variable Parking Fee, $0.15/kWh Energy Fee	US	0	0		0	0		0
81023	Bellevue	WA	98004	2	\N	0	ChargePoint Network	47.614292	-122.201256	\N	J1772	Free	US	0	0		0	0		0
81024	Bellevue	WA	98004	10	\N	0	ChargePoint Network	47.614037	-122.201355	\N	J1772	Free	US	0	0		0	0		0
81081	Leavenworth	WA	98826	1	\N	0	Non-Networked	47.558594	-120.675804	2016-08-01	J1772	Free	US	0	0		0	0		0
81083	Davenport	WA	99122	1	\N	0	Non-Networked	47.652924	-118.15036	2016-10-01	J1772	Free	US	0	0		0	0		0
81162	Spokane	WA	99205	1	\N	0	Greenlots	47.678925	-117.43436	2016-07-15	J1772	\N	US	0	0		0	0		0
81587	Mercer Island	WA	98040	6	\N	0	ChargePoint Network	47.57714	-122.21034	\N	J1772	$1 per hour, minimum payment of $1	US	0	0		0	0		0
81619	Seattle	WA	98109	3	\N	0	SemaCharge Network	47.62312	-122.33844	\N	J1772	FREE	US	0	0		0	0		0
81620	Seattle	WA	98109	3	\N	0	SemaCharge Network	47.62164	-122.34012	\N	J1772	FREE	US	0	0		0	0		0
81738	Bellevue	WA	98004	2	\N	0	SemaCharge Network	47.615986	-122.195595	\N	J1772	$2.00-$5.00/Hr Variable Parking Fee	US	0	0		0	0		0
81742	Tacoma	WA	98402	2	\N	0	ChargePoint Network	47.24423	-122.438866	\N	J1772	Free	US	0	0		0	0		0
81779	Kingston	WA	98346	2	2	0	OpConnect	47.812378	-122.54028	2017-02-01	J1772 NEMA520	Free	US	0	0		0	0		0
81780	Port Orchard	WA	98366	1	1	0	OpConnect	47.504375	-122.51466	2017-02-01	J1772 NEMA520	Free	US	0	0		0	0		0
81781	Poulsbo	WA	98370	1	1	0	OpConnect	47.760677	-122.64966	2017-02-01	J1772 NEMA520	Free	US	0	0		0	0		0
82083	Edmonds	WA	98026	0	\N	2	ChargePoint Network	47.7784	-122.34426	\N	CHADEMO J1772COMBO	$6 per session	US	3	6	min	0	0	min	0
82155	Long Beach	WA	98631	2	\N	0	ChargePoint Network	46.34934	-124.05352	\N	J1772	Free	US	0	0		0	0		0
82271	Sammamish	WA	98074	2	\N	0	ChargePoint Network	47.605953	-122.03739	\N	J1772	Pricing is based on length of time. $0 per hour for the first 2 hours, and $2 per additional hour	US	0	0		0	0		0
82346	Bellevue	WA	98004	4	\N	0	ChargePoint Network	47.613537	-122.19511	\N	J1772	$0.25 per hour, $1 per session	US	0	0		0	0		0
82396	Bridgeport	WA	98813	1	\N	0	Non-Networked	48.009357	-119.67295	2017-04-01	J1772	Free	US	0	0		0	0		0
82397	Tonasket	WA	98855	1	\N	0	Non-Networked	48.705585	-119.43841	2017-04-01	J1772	Free	US	0	0		0	0		0
82447	Yakima	WA	98902	8	\N	0	ChargePoint Network	46.593178	-120.550385	\N	J1772	Pricing is based on length of time and kWh used. $0 per hour for the first 4 hours, and $2.5 per additional hour, $0.225 per kWh	US	0	0		0	0		0
82499	Bellevue	WA	98004	2	\N	0	ChargePoint Network	47.61247	-122.194305	\N	J1772	Pricing is based on an hourly rate. $1 per hour	US	0	0		0	0		0
82585	Sammamish	WA	98074	2	\N	0	ChargePoint Network	47.606216	-122.03743	\N	J1772	Pricing is based on length of time. $0 per hour for the first 2 hours, and $2 per additional hour	US	0	0		0	0		0
82593	Wenatchee	WA	98801	1	\N	0	Non-Networked	47.46341	-120.33153	2017-05-15	J1772	Free	US	0	0		0	0		0
82594	Wenatchee	WA	98801	1	\N	0	Non-Networked	47.53182	-120.30087	2017-05-15	J1772	Free	US	0	0		0	0		0
82625	Seattle	WA	98109	6	\N	0	SemaCharge Network	47.621166	-122.33545	\N	J1772	FREE	US	0	0		0	0		0
82782	Renton	WA	98057	4	\N	0	ChargePoint Network	47.455853	-122.232864	\N	J1772	Pricing is based on length of time. $0.5 per hour for the first 4 hours, and $2 per additional hour	US	0	0		0	0		0
82783	Renton	WA	98057	4	\N	0	ChargePoint Network	47.457203	-122.23764	\N	J1772	Pricing is based on length of time. $0.5 per hour for the first 4 hours, and $2 per additional hour	US	0	0		0	0		0
82787	Mercer Island	WA	98040	2	\N	0	ChargePoint Network	47.536396	-122.22806	\N	J1772	$1 per hour, minimum payment of $1	US	0	0		0	0		0
85540	Bellevue	WA	98004	4	\N	0	ChargePoint Network	47.61264	-122.20467	\N	J1772	$2 per hour, minimum payment of $2	US	0	0		0	0		0
85568	Mount Vernon	WA	98273	3	\N	0	ChargePoint Network	48.41779	-122.33463	\N	J1772	Pricing is based on length of time. $1 per hour for the first 4 hours, and $1.5 per additional hour, minimum payment of $1	US	0	0		0	0		0
85907	spokane	WA	99201	1	\N	0	ChargePoint Network	47.652782	-117.43491	\N	J1772	Free	US	0	0		0	0		0
85924	Friday Harbor	WA	98250	1	1	0	ChargePoint Network	48.534683	-123.01847	\N	J1772 NEMA520	Free	US	0	0		0	0		0
86014	Seattle	WA	98109	4	\N	0	ChargePoint Network	47.62231	-122.34195	\N	J1772	Free	US	0	0		0	0		0
86025	Bellevue	WA	98007	1	\N	0	Non-Networked	47.580654	-122.143364	2017-03-01	J1772	Free	US	0	0		0	0		0
86099	Redmond	WA	98052	4	\N	0	ChargePoint Network	47.635345	-122.13752	\N	J1772	$1.5 per hour	US	0	0		0	0		0
86225	Bothell	WA	98011	2	\N	0	ChargePoint Network	47.75784	-122.19095	\N	J1772	Free	US	0	0		0	0		0
86298	Seattle	WA	98101	4	\N	0	ChargePoint Network	47.608418	-122.33324	\N	J1772	Pricing is based on length of time and kWh used. $0 per hour for the first 4 hours, and $3 per additional hour, $0.25 per kWh, maximum payment of $50	US	0	0		0	0		0
86710	Moses Lake	WA	98837	1	\N	0	Non-Networked	47.10315	-119.25025	2017-05-05	J1772	Free	US	0	0		0	0		0
86920	Lacey	WA	98516	8	\N	0	ChargePoint Network	47.04679	-122.80809	\N	J1772	Free	US	0	0		0	0		0
86962	Bellevue	WA	98006	2	\N	0	ChargePoint Network	47.571384	-122.16481	\N	J1772	Pricing is based on length of time. $0 per hour for the first 1 hour, and $1.5 per additional hour, maximum payment of $20	US	0	0		0	0		0
87711	Bellevue	WA	98004	8	\N	0	ChargePoint Network	47.616768	-122.203	\N	J1772	Pricing is based on an hourly rate. $2 per hour, minimum payment of $1, maximum session time is 24 hours	US	0	0		0	0		0
87937	Mercer Island	WA	98040	2	\N	0	ChargePoint Network	47.590057	-122.22854	\N	J1772	Pricing is based on an hourly rate. $1 per hour, minimum payment of $1	US	0	0		0	0		0
88018	SeaTac	WA	98188	0	\N	4	ChargePoint Network	47.436035	-122.296326	\N	CHADEMO J1772COMBO	$0.2 per hour, minimum payment of $4.95, maximum payment of $20, $4.95 per session, maximum session time is 2 hours	US	3	4.95	min	0	0	min	0.2
88084	Spokane	WA	99202	2	\N	0	ChargePoint Network	47.6682	-117.39722	\N	J1772	Pricing is based on length of time. $0 per hour for the first 4 hours, and $3 per additional hour	US	0	0		0	0		0
88290	Bellevue	WA	98004	2	\N	0	ChargePoint Network	47.612755	-122.198494	\N	J1772	$3 per hour	US	0	0		0	0		0
88546	Gig Harbor	WA	98335	2	\N	0	ChargePoint Network	47.329292	-122.57898	\N	J1772	Free	US	0	0		0	0		0
88696	Seattle	WA	98105	2	\N	0	ChargePoint Network	47.66136	-122.29829	\N	J1772	Pricing is based on length of time. $2 per hour for the first 3 hours, and $8 per additional hour	US	0	0		0	0		0
88699	Seattle	WA	98101	10	\N	0	SemaCharge Network	47.617023	-122.332214	\N	J1772	$0.00-$2.00/Hr Variable Parking Fee	US	0	0		0	0		0
88777	Arlington	WA	98223	8	\N	0	ChargePoint Network	48.17864	-122.12541	\N	J1772	$0.5 per hour, $0.2 per kWh	US	0	0		0	0		0
88827	Gig Harbor	WA	98332	2	\N	0	ChargePoint Network	47.33934	-122.59032	\N	J1772	Free	US	0	0		0	0		0
88830	Kirkland	WA	98033	2	\N	0	ChargePoint Network	47.675365	-122.2075	\N	J1772	Free	US	0	0		0	0		0
92107	Port Townsend	WA	98368	2	\N	0	OpConnect	48.050137	-122.81879	2018-01-01	J1772	$2.10 per hour	US	0	0		0	0		0
92108	Poulsbo	WA	98370	2	2	0	OpConnect	47.760303	-122.65056	2018-01-01	J1772 NEMA520	Free	US	0	0		0	0		0
92167	Auburn	WA	98092	2	\N	0	SemaCharge Network	47.247456	-122.20055	\N	J1772	FREE	US	0	0		0	0		0
92251	Bellevue	WA	98005	2	\N	0	ChargePoint Network	47.587	-122.159355	\N	J1772	$1.5 per kWh, minimum payment of $2.5, maximum payment of $25	US	0	0		0	0		0
92369	Seattle	WA	98101	2	\N	0	ChargePoint Network	47.612408	-122.339424	\N	J1772	Pricing is based on length of time and kWh used. $0 per hour for the first 4 hours, and $3 per additional hour, $1.5 per kWh	US	0	0		0	0		0
92472	Seattle	WA	98122	0	\N	2	ChargePoint Network	47.615555	-122.32285	\N	CHADEMO J1772COMBO	$0.2 per hour, minimum payment of $4.95, maximum payment of $20, $4.95 per session, maximum session time is 2 hours	US	3	4.95	min	0	0	min	0.2
92487	Edmonds	WA	98026	0	\N	2	ChargePoint Network	47.78115	-122.34576	\N	CHADEMO J1772COMBO	$6 per session	US	3	6	min	0	0	min	0
93034	Bellevue	WA	98007	0	\N	6	eVgo Network	47.580845	-122.14307	\N	CHADEMO	\N	US	1	0	min	0.29	0	min	0
93038	Bellevue	WA	98007	0	\N	2	eVgo Network	47.58083	-122.14365	\N	CHADEMO	\N	US	1	0	min	0.29	0	min	0
93051	Kirkland	WA	98034	0	\N	2	eVgo Network	47.707268	-122.17484	\N	CHADEMO	\N	US	1	0	min	0.29	0	min	0
93088	Redmond	WA	98052	1	\N	2	eVgo Network	47.671444	-122.119415	\N	CHADEMO J1772 J1772COMBO	\N	US	3	0	min	0.29	0	min	0
93146	Seattle	WA	98109	1	\N	2	eVgo Network	47.620663	-122.32952	\N	CHADEMO J1772 J1772COMBO	\N	US	3	0	min	0.29	0	min	0
93172	Ritzville	WA	99169	0	\N	1	eVgo Network	47.118607	-118.36556	\N	CHADEMO J1772COMBO	\N	US	3	0	min	0.29	0	min	0
93339	Tacoma	WA	98409	2	\N	2	eVgo Network	47.21543	-122.47068	\N	CHADEMO J1772 J1772COMBO	\N	US	3	0	min	0.29	0	min	0
93343	Quil Ceda Village	WA	98271	3	\N	1	eVgo Network	48.093002	-122.18979	\N	CHADEMO J1772 J1772COMBO	\N	US	3	0	min	0.29	0	min	0
93352	North Bend	WA	98045	2	\N	2	eVgo Network	47.491364	-121.793106	\N	CHADEMO J1772 J1772COMBO	\N	US	3	0	min	0.29	0	min	0
93364	Seattle	WA	98125	3	\N	1	eVgo Network	47.7033	-122.32519	\N	CHADEMO J1772 J1772COMBO	\N	US	3	0	min	0.29	0	min	0
93443	Seattle	WA	98122	0	\N	1	eVgo Network	47.613457	-122.32192	\N	CHADEMO J1772COMBO	\N	US	3	0	min	0.29	0	min	0
93483	Renton	WA	98057	0	\N	2	eVgo Network	47.49818	-122.20431	\N	CHADEMO J1772COMBO	\N	US	3	0	min	0.29	0	min	0
93531	Woodland	WA	98674	0	\N	1	eVgo Network	45.92845	-122.762054	\N	CHADEMO J1772COMBO	\N	US	3	0	min	0.29	0	min	0
93550	Mercer Island	WA	98040	0	\N	2	eVgo Network	47.58483	-122.23577	\N	CHADEMO J1772COMBO	\N	US	3	0	min	0.29	0	min	0
93552	Lynnwood	WA	98036	0	\N	1	eVgo Network	47.820568	-122.27357	\N	CHADEMO J1772COMBO	\N	US	3	0	min	0.29	0	min	0
93840	Friday Harbor	WA	98250	1	\N	0	Non-Networked	48.536488	-123.021355	2015-01-01	J1772	Free	US	0	0		0	0		0
93841	Friday Harbor	WA	98250	1	\N	0	Non-Networked	48.514656	-123.028885	2017-01-01	J1772	Free	US	0	0		0	0		0
93842	Friday Harbor	WA	98250	2	\N	0	Non-Networked	48.532963	-123.01931	2016-01-01	J1772	$5 per 4 hour session for non-guests	US	0	0		0	0		0
93843	Friday Harbor	WA	98250	1	\N	0	Non-Networked	48.532845	-123.021	2017-01-01	J1772	Free	US	0	0		0	0		0
93844	Friday Harbor	WA	98250	1	\N	0	Non-Networked	48.561172	-123.164345	2017-01-01	J1772	Free	US	0	0		0	0		0
93846	Eastsound	WA	98245	1	\N	0	Non-Networked	48.692978	-122.9048	2017-01-01	J1772	Free	US	0	0		0	0		0
93847	Eastsound	WA	98245	2	\N	0	Non-Networked	48.648792	-122.868416	2016-01-01	J1772	$10 per session for non-guests	US	0	0		0	0		0
93848	Olga	WA	98279	1	\N	0	Non-Networked	48.641277	-122.78101	2016-01-01	J1772	Free	US	0	0		0	0		0
93849	Lopez	WA	98261	1	\N	0	Non-Networked	48.521862	-122.90957	2016-01-01	J1772	Free	US	0	0		0	0		0
93850	Lopez	WA	98261	1	\N	0	Non-Networked	48.530773	-122.91487	2016-01-01	J1772	Free	US	0	0		0	0		0
94394	Seattle	WA	98108	0	\N	2	ChargePoint Network	47.541946	-122.324326	\N	CHADEMO J1772COMBO	$0.2 per hour, minimum payment of $4.95, maximum payment of $20, $4.95 per session, maximum session time is 2 hours	US	3	4.95	min	0	0	min	0.2
94623	Spanaway	WA	98445	2	\N	0	ChargePoint Network	47.097775	-122.40071	\N	J1772	$0.5 per kWh	US	0	0		0	0		0
94624	Spanaway	WA	98387	2	\N	0	ChargePoint Network	47.097233	-122.40163	\N	J1772	$0.5 per kWh	US	0	0		0	0		0
94715	Seattle	WA	98101	4	\N	0	ChargePoint Network	47.607548	-122.33598	\N	J1772	Pricing is based on length of time and kWh used. $0 per hour for the first 4 hours, and $3 per additional hour, $0.25 per kWh, maximum payment of $50	US	0	0		0	0		0
94884	Issaquah	WA	98027	2	\N	0	EV Connect	47.54894	-122.04991	2018-03-01	J1772	\N	US	0	0		0	0		0
94885	Redmond	WA	98053	4	\N	0	EV Connect	47.674026	-122.103004	2017-01-06	J1772	\N	US	0	0		0	0		0
94886	Woodinville	WA	98072	2	\N	0	EV Connect	47.767494	-122.1552	2017-10-12	J1772	\N	US	0	0		0	0		0
95048	Everett	WA	98204	2	\N	0	Blink Network	47.919533	-122.23231	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95063	Vancouver	WA	98663	0	\N	2	Blink Network	45.6294	-122.66325	\N	CHADEMO	Free	US	1	0	kwh	0.49	0	min	0
95092	Kirkland	WA	98033	1	\N	0	Blink Network	47.65753	-122.20652	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95093	Kirkland	WA	98033	2	\N	0	Blink Network	47.65753	-122.20652	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95094	Kirkland	WA	98033	1	\N	0	Blink Network	47.655327	-122.20525	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95095	Kirkland	WA	98033	1	\N	0	Blink Network	47.655327	-122.20525	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95110	SeaTac	WA	98188	4	\N	0	Blink Network	47.45171	-122.295494	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95120	Bellevue	WA	98004	4	\N	0	Blink Network	47.615044	-122.19616	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95133	Olympia	WA	98502	2	\N	0	Blink Network	47.02759	-122.92059	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95160	Lynnwood	WA	98037	2	\N	0	Blink Network	47.84839	-122.27274	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95196	Seattle	WA	98101	2	\N	0	Blink Network	47.60733	-122.33241	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95219	Langley	WA	98260	2	\N	0	Blink Network	48.03993	-122.40974	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95248	Seattle	WA	98101	1	\N	0	Blink Network	47.60753	-122.333115	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95259	Poulsbo	WA	98370	4	\N	0	Blink Network	47.736633	-122.6472	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95267	Seattle	WA	98188	1	\N	0	Blink Network	47.44433	-122.29553	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95279	Seattle	WA	98107	2	\N	0	Blink Network	47.66026	-122.36917	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95313	Olympia	WA	98501	1	\N	0	Blink Network	46.971813	-122.88817	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95338	Renton	WA	98057	4	\N	0	Blink Network	47.4654	-122.22092	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95346	Renton	WA	98057	5	\N	0	Blink Network	47.44299	-122.227165	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95356	Everett	WA	98201	6	\N	0	Blink Network	48.006783	-122.20277	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95368	Silverdale	WA	98383	2	\N	2	Blink Network	47.652504	-122.69437	\N	CHADEMO J1772	Level 2: $0.49 per kWh, DC Fast: $0.59 per kWh	US	1	0	kwh	0.59	0	min	0
95459	Renton	WA	98057	3	\N	0	Blink Network	47.47417	-122.2241	\N	J1772	Level 2: $0.29 per kWh	US	0	0		0	0		0
95464	Mt. Vernon	WA	98273	2	\N	0	Blink Network	48.436424	-122.30883	\N	J1772	Free	US	0	0		0	0		0
95494	Everett	WA	98201	1	\N	0	Blink Network	48.000496	-122.20593	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95496	Bellevue	WA	98007	2	\N	0	Blink Network	47.585655	-122.147285	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95499	Bellevue	WA	98007	2	\N	0	Blink Network	47.62843	-122.14315	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95505	Snoqualmie	WA	98065	2	\N	0	Blink Network	47.542152	-121.83663	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95521	Lacey	WA	98516	2	\N	0	Blink Network	47.069828	-122.773315	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95551	Seattle	WA	98121	3	\N	0	Blink Network	47.61771	-122.338	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95552	Seattle	WA	98109	3	\N	0	Blink Network	47.619774	-122.33111	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95594	Vancouver	WA	98686	2	\N	0	Blink Network	45.720387	-122.64855	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95613	Longview	WA	98632	2	\N	0	Blink Network	46.13135	-122.935974	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95621	Auburn	WA	98002	2	\N	2	Blink Network	47.293217	-122.212814	\N	CHADEMO J1772	Level 2: $0.49 per kWh, DC Fast: $0.59 per kWh	US	1	0	kwh	0.59	0	min	0
95623	AUBURN	WA	98002	2	\N	2	Blink Network	47.3207	-122.21977	\N	CHADEMO J1772	Level 2: $0.49 per kWh, DC Fast: $0.59 per kWh	US	1	0	kwh	0.59	0	min	0
95640	Tacoma	WA	98406	2	\N	0	Blink Network	47.25914	-122.514595	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95647	Everett	WA	98201	2	\N	0	Blink Network	47.999004	-122.20527	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95652	Tukwila	WA	98188	1	\N	0	Blink Network	47.44897	-122.25331	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95667	Bellevue	WA	98004	4	\N	0	Blink Network	47.62289	-122.18572	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95703	Seattle	WA	98104	1	\N	0	Blink Network	47.60636	-122.32164	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95740	Puyallup	WA	98371	1	\N	0	Blink Network	47.184776	-122.29331	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95749	Renton	WA	98057	2	\N	0	Blink Network	47.477364	-122.21535	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95831	Sumner	WA	98390	1	\N	0	Blink Network	47.20398	-122.23731	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95845	Port Angeles	WA	98362	2	\N	0	Blink Network	48.11525	-123.41552	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95858	Seattle	WA	98109	1	\N	0	Blink Network	47.619186	-122.33888	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95895	Centralia	WA	98531	2	\N	0	Blink Network	46.715336	-122.96069	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95905	Seattle	WA	98104	4	\N	0	Blink Network	47.604816	-122.33057	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95913	Seattle	WA	98104	4	\N	0	Blink Network	47.60584	-122.33289	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95936	Seattle	WA	98134	1	\N	0	Blink Network	47.589638	-122.33289	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95951	Bellevue	WA	98004	3	\N	0	Blink Network	47.617287	-122.19193	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
95959	Kirkland	WA	98034	1	\N	0	Blink Network	47.704067	-122.16701	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96009	Seattle	WA	98146	1	\N	0	Blink Network	47.502354	-122.34112	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96027	Shoreline	WA	98133	2	\N	0	Blink Network	47.7481	-122.361176	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96049	Auburn	WA	98002	1	\N	0	Blink Network	47.30105	-122.214836	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96058	Pasco	WA	99301	1	\N	0	Blink Network	46.22912	-119.10652	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96076	Bellevue	WA	98004	3	\N	0	Blink Network	47.62013	-122.19096	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96090	Seattle	WA	98104	6	\N	0	Blink Network	47.605476	-122.323425	\N	J1772	Free	US	0	0		0	0		0
96097	Puyallup	WA	98371	3	\N	0	Blink Network	47.182514	-122.291954	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96214	Seattle	WA	98122	2	\N	0	Blink Network	47.6135	-122.32093	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96241	Seattle	WA	98109	2	\N	0	Blink Network	47.62653	-122.329994	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96251	Olympia	WA	98506	2	\N	0	Blink Network	47.052856	-122.84707	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96253	Centralia	WA	98531	1	\N	0	Blink Network	46.71025	-122.98688	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96258	Seattle	WA	98105	3	\N	0	Blink Network	47.658558	-122.31214	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96282	Bremerton	WA	98312	2	\N	2	Blink Network	47.56825	-122.66705	\N	CHADEMO J1772	Level 2: $0.49 per kWh, DC Fast: $0.59 per kWh	US	1	0	kwh	0.59	0	min	0
96309	Shoreline	WA	98133	3	\N	0	Blink Network	47.743362	-122.34782	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96318	Lacey	WA	98503	3	\N	0	Blink Network	47.04457	-122.83618	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96325	Seattle	WA	98101	2	\N	0	Blink Network	47.608875	-122.33285	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96348	Seattle	WA	98101	4	\N	0	Blink Network	47.611103	-122.33489	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96400	Bellevue	WA	98005	2	\N	2	Blink Network	47.58495	-122.15043	\N	CHADEMO J1772	Level 2: $0.49 per kWh, DC Fast: $0.59 per kWh	US	1	0		0	0		0
96401	Tumwater	WA	98512	2	\N	0	Blink Network	46.984615	-122.9053	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96405	Vancouver	WA	98685	1	\N	2	Blink Network	45.720604	-122.66313	\N	CHADEMO J1772	Level 2: $0.49 per kWh, DC Fast: $0.59 per kWh	US	1	0	kwh	0.59	0	min	0
96406	Vancouver	WA	98661	1	\N	2	Blink Network	45.61963	-122.64478	\N	CHADEMO J1772	Level 2: $0.49 per kWh, DC Fast: $0.59 per kWh	US	1	0	kwh	0.59	0	min	0
96407	Kirkland	WA	98034	2	\N	2	Blink Network	47.70848	-122.183525	\N	CHADEMO J1772	Level 2: $0.49 per kWh, DC Fast: $0.59 per kWh	US	1	0	kwh	0.59	0	min	0
96411	Belfair	WA	98528	2	\N	0	Blink Network	47.451374	-122.826866	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96412	Seattle	WA	98125	1	\N	2	Blink Network	47.72369	-122.29238	\N	CHADEMO J1772	Level 2: $0.49 per kWh, DC Fast: $0.59 per kWh	US	1	0	kwh	0.59	0	min	0
96413	REDMOND	WA	98052	2	\N	0	Blink Network	47.670708	-122.10397	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96415	Maple Valley	WA	98038	4	\N	0	Blink Network	47.362453	-122.01799	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96418	Kent	WA	98030	2	\N	0	Blink Network	47.38639	-122.20539	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96446	Seattle	WA	98134	1	\N	0	Blink Network	47.557995	-122.331024	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96480	Seattle	WA	98109	2	\N	0	Blink Network	47.63399	-122.33968	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96486	Seattle	WA	98122	2	\N	0	Blink Network	47.613575	-122.31576	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96501	Renton	WA	98057	3	\N	0	Blink Network	47.481247	-122.20848	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96503	Olympia	WA	98505	2	\N	0	Blink Network	47.07192	-122.97668	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96505	Auburn	WA	98092	2	\N	2	Blink Network	47.24527	-122.20691	\N	CHADEMO J1772	Level 2: $0.49 per kWh, DC Fast: $0.59 per kWh	US	1	0	kwh	0.59	0	min	0
96549	Olympia	WA	98501	6	\N	0	Blink Network	47.035854	-122.89495	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96620	Vancouver	WA	98660	4	\N	0	Blink Network	45.631386	-122.67759	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96628	Fife	WA	98424	4	\N	2	Blink Network	47.24198	-122.3481	\N	CHADEMO J1772	Level 2: $0.49 per kWh, DC Fast: $0.59 per kWh	US	1	0	kwh	0.59	0	min	0
96763	Seattle	WA	98106	0	\N	2	ChargePoint Network	47.547707	-122.35271	\N	CHADEMO J1772COMBO	$0.2 per hour, minimum payment of $4.95, maximum payment of $20, $4.95 per session, maximum session time is 2 hours	US	3	4.95	min	0	0	min	0.2
96877	Bainbridge Island	WA	98110	2	\N	0	ChargePoint Network	47.63769	-122.51358	\N	J1772	Free	US	0	0		0	0		0
96971	Covington	WA	98042	3	\N	0	Blink Network	47.359936	-122.10367	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
96972	Des Moines	WA	98198	2	\N	0	Blink Network	47.389484	-122.301605	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
97018	Bellingham	WA	98226	2	\N	0	ChargePoint Network	48.7707	-122.44877	\N	J1772	Pricing is based on an hourly rate. $1 per hour, minimum payment of $1, maximum payment of $5	US	0	0		0	0		0
98388	Renton	WA	98057	2	\N	0	Blink Network	47.49818	-122.20431	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
98502	Bellevue	WA	98005	6	\N	0	SemaCharge Network	47.582405	-122.15399	\N	J1772	$1.00-$5.00/Hr Variable Parking Fee	US	0	0		0	0		0
98553	Oroville	WA	98844	1	\N	0	Non-Networked	48.938282	-119.436455	2017-07-01	J1772	Free	US	0	0		0	0		0
98554	Soap Lake	WA	98851	1	\N	0	Non-Networked	47.39125	-119.48365	2017-08-01	J1772	Free	US	0	0		0	0		0
98555	Manson	WA	98831	1	\N	0	Non-Networked	47.883846	-120.15461	2017-10-01	J1772	Free	US	0	0		0	0		0
98726	Seattle	WA	98104	7	\N	0	ChargePoint Network	47.597954	-122.33307	\N	J1772	$1.5 per kWh	US	0	0		0	0		0
98727	Seattle	WA	98134	1	\N	0	ChargePoint Network	47.59796	-122.33257	\N	J1772	$1.5 per kWh	US	0	0		0	0		0
98737	Olympia	WA	98502	2	\N	0	ChargePoint Network	47.047493	-122.939545	\N	J1772	Pricing is based on length of time and kWh used. $0 per hour, and $10 per additional hour, $0.49 per kWh	US	0	0		0	0		0
98770	Seattle	WA	98103	0	\N	2	ChargePoint Network	47.699226	-122.334625	\N	CHADEMO J1772COMBO	$0.2 per hour, minimum payment of $4.95, maximum payment of $20, $4.95 per session, maximum session time is 2 hours	US	3	4.95	min	0	0	min	0.2
98810	Spokane	WA	99201	2	\N	0	ChargePoint Network	47.653614	-117.430176	\N	J1772	Free	US	0	0		0	0		0
99059	Renton	WA	98057	0	\N	2	Greenlots	47.47077	-122.22021	\N	CHADEMO J1772COMBO	DC Fast: $3.50 per hour, minimum payment of $3.50, maximum payment of $30.00	US	3	0	min	0.058	0	min	0
99067	Puyallup	WA	98372	0	\N	2	Greenlots	47.20664	-122.29223	\N	CHADEMO J1772COMBO	DC Fast: $10.00 per hour, minimum payment of $3.00, maximum payment of $30.00	US	3	0	min	0.167	0	min	0
99070	Tacoma	WA	98409	0	\N	2	Greenlots	47.19061	-122.48442	\N	CHADEMO J1772COMBO	DC Fast: $7.00 per hour, maximum payment of $30.00	US	3	0	min	0.117	0	min	0
99073	seattle	WA	98133	0	\N	2	Greenlots	47.75381	-122.346504	\N	CHADEMO J1772COMBO	DC Fast: $5.00 per hour, maximum payment of $20.00	US	3	0	min	0.083	0	min	0
99158	Spokane	WA	99218	2	\N	0	Greenlots	47.75253	-117.41108	\N	J1772	Level 2: Free	US	0	0		0	0		0
99164	SPOKANE	WA	99204	3	\N	0	Greenlots	47.64919	-117.41288	\N	J1772	Level 2: Free	US	0	0		0	0		0
99169	SPOKANE	WA	99251	4	\N	0	Greenlots	47.75309	-117.41932	\N	J1772	Level 2: Free	US	0	0		0	0		0
99171	Clarkston	WA	99403	2	\N	0	Greenlots	46.426155	-117.05495	\N	J1772	Level 2: Free	US	0	0		0	0		0
99183	Rosalia	WA	99170	2	\N	2	Greenlots	47.234673	-117.37006	\N	CHADEMO J1772 J1772COMBO	Level 2: $0.00 per kWh	US	3	0	kwh	0.35	0	min	0
99191	Spokane Valley	WA	99016	2	\N	0	Greenlots	47.670876	-117.17637	\N	J1772	Level 2: Free	US	0	0		0	0		0
99198	Spokane Valley	WA	99212	1	\N	0	Greenlots	47.678577	-117.32319	\N	J1772	Level 2: Free	US	0	0		0	0		0
99200	LIBERTY LAKE	WA	99019	2	\N	0	Greenlots	47.671555	-117.10294	\N	J1772	Level 2: Free	US	0	0		0	0		0
99201	SPOKANE	WA	99201	2	\N	0	Greenlots	47.662674	-117.42952	\N	J1772	Level 2: Free	US	0	0		0	0		0
99202	Spokane	WA	99210	2	\N	0	Greenlots	47.66191	-117.405235	\N	J1772	Level 2: Free	US	0	0		0	0		0
99208	SPOKANE	WA	99224	2	\N	0	Greenlots	47.642685	-117.47183	\N	J1772	Level 2: Free	US	0	0		0	0		0
99210	Spokane	WA	99202	2	\N	0	Greenlots	47.658752	-117.36906	\N	J1772	Level 2: Free	US	0	0		0	0		0
99224	Liberty Lake	WA	99019	2	\N	0	Greenlots	47.6748	-117.09582	\N	J1772	Level 2: Free	US	0	0		0	0		0
99227	SPOKANE	WA	99201	2	\N	0	Greenlots	47.66576	-117.4158	\N	J1772	Level 2: Free	US	0	0		0	0		0
99228	Rosalia	WA	99170	1	\N	0	Greenlots	47.15608	-117.36445	\N	J1772	Level 2: Free	US	0	0		0	0		0
99229	Spokane	WA	99201	2	\N	0	Greenlots	47.665665	-117.41456	\N	J1772	Level 2: Free	US	0	0		0	0		0
99230	Spokane	WA	99201	3	\N	0	Greenlots	47.66975	-117.41605	\N	J1772	Level 2: Free	US	0	0		0	0		0
99235	MEDICAL LAKE	WA	99022	2	\N	0	Greenlots	47.57162	-117.68155	\N	J1772	Level 2: Free	US	0	0		0	0		0
99257	AIRWAY HEIGHTS	WA	99224	2	\N	0	Greenlots	47.64261	-117.5612	\N	J1772	Level 2: Free	US	0	0		0	0		0
99258	Mead	WA	99021	2	\N	0	Greenlots	47.78688	-117.35407	\N	J1772	Level 2: Free	US	0	0		0	0		0
99262	Spokane	WA	99216	2	\N	0	Greenlots	47.628185	-117.22726	\N	J1772	Level 2: Free	US	0	0		0	0		0
99263	Spokane	WA	99201	2	\N	2	Greenlots	47.662197	-117.43189	\N	CHADEMO J1772 J1772COMBO	Level 2: Free	US	3	0	kwh	0.35	0	min	0
99264	Deer Park	WA	99006	2	\N	0	Greenlots	47.94371	-117.477455	\N	J1772	Level 2: Free	US	0	0		0	0		0
99270	Bellevue	WA	98007	2	\N	0	Greenlots	47.61763	-122.13344	\N	J1772	Level 2: Free	US	0	0		0	0		0
99271	Spokane	WA	99203	2	\N	0	Greenlots	47.626045	-117.40147	\N	J1772	Level 2: Free	US	0	0		0	0		0
99273	Olympia	WA	98501	2	\N	0	Greenlots	47.01109	-122.89606	\N	J1772	Level 2: Free	US	0	0		0	0		0
99277	Pullman	WA	99163	2	\N	2	Greenlots	46.728905	-117.17616	\N	CHADEMO J1772 J1772COMBO	DC Fast: $0.35 per kWh, minimum payment of $0.50, maximum payment of $25.00	US	3	0	kwh	0.35	0	min	0
99280	Liberty Lake	WA	99019	2	\N	2	Greenlots	47.67053	-117.103264	\N	CHADEMO J1772 J1772COMBO	DC Fast: $0.35 per kWh, minimum payment of $0.50, maximum payment of $25.00	US	3	0	kwh	0.35	0	min	0
99282	Seattle	WA	98144	0	\N	4	Greenlots	47.57997	-122.31233	\N	CHADEMO J1772COMBO	DC Fast: $0.43 per kWh, maximum payment of $30.00	US	3	0	kwh	0.43	0	min	0
99283	Spokane	WA	99201	4	\N	0	Greenlots	47.659946	-117.42339	\N	J1772	Level 2: Free	US	0	0		0	0		0
99285	Spokane	WA	99204	2	\N	0	Greenlots	47.646362	-117.42672	\N	J1772	Level 2: Free	US	0	0		0	0		0
99286	Spokane	WA	99208	2	\N	0	Greenlots	47.740513	-117.41386	\N	J1772	Level 2: Free	US	0	0		0	0		0
99288	Liberty Lake	WA	99019	4	\N	0	Greenlots	47.671093	-117.10308	\N	J1772	Level 2: Free	US	0	0		0	0		0
99293	Bellevue	WA	98005	2	\N	0	Greenlots	47.615406	-122.17956	\N	J1772	Level 2: Free	US	0	0		0	0		0
99295	Spokane	WA	99224	2	\N	0	Greenlots	47.629715	-117.53573	\N	J1772	Level 2: Free	US	0	0		0	0		0
99296	Kennewick	WA	99337	1	\N	2	Greenlots	46.181374	-119.1844	\N	CHADEMO J1772 J1772COMBO	DC Fast: $21.00 per hour	US	3	0	min	0.35	0	min	0
99297	Ellensburg	WA	98926	1	\N	2	Greenlots	46.99411	-120.5488	\N	CHADEMO J1772 J1772COMBO	Level 2: $1.50 per hour	US	3	0	min	0.35	0	min	0
99298	Spokane	WA	99217	4	\N	0	Greenlots	47.674606	-117.36355	\N	J1772	Level 2: $0.12 per kWh	US	0	0		0	0		0
99300	Spokane	WA	99216	2	\N	0	Greenlots	47.672005	-117.38622	\N	J1772	Level 2: Free	US	0	0		0	0		0
99303	Spokane	WA	99224	4	\N	0	Greenlots	47.67572	-117.4606	\N	J1772	Level 2: $0.12 per kWh	US	0	0		0	0		0
99304	Garfield	WA	99130	2	\N	0	Greenlots	47.00918	-117.14451	\N	J1772	Level 2: Free	US	0	0		0	0		0
99305	Spokane	WA	99201	6	\N	0	Greenlots	47.655	-117.42483	\N	J1772	Level 2: Free	US	0	0		0	0		0
99358	Kennewick	WA	99336	1	\N	1	Non-Networked	46.179733	-119.188126	2018-05-15	CHADEMO J1772 J1772COMBO	Level 2: $1.25 per hour\r\nDC fast: $0.25 per minute	US	3	0	kwh	0.59	0	min	0
99366	Seattle	WA	98101	2	\N	0	Blink Network	47.610237	-122.33364	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
99403	Bothell	WA	98011	4	\N	0	ChargePoint Network	47.773663	-122.18148	\N	J1772	Free	US	0	0		0	0		0
99405	Bothell	WA	98011	4	\N	0	ChargePoint Network	47.757748	-122.19073	\N	J1772	Free	US	0	0		0	0		0
99407	Bellevue	WA	98004	4	\N	0	ChargePoint Network	47.61452	-122.20138	\N	J1772	Free	US	0	0		0	0		0
99408	Bellevue	WA	98004	8	\N	0	ChargePoint Network	47.61429	-122.20083	\N	J1772	Free	US	0	0		0	0		0
99409	Bellevue	WA	98004	2	\N	0	ChargePoint Network	47.614754	-122.20083	\N	J1772	Free	US	0	0		0	0		0
99410	Bellevue	WA	98004	2	\N	0	ChargePoint Network	47.61465	-122.20075	\N	J1772	Free	US	0	0		0	0		0
99587	Seattle	WA	98103	4	\N	0	ChargePoint Network	47.67153	-122.35143	\N	J1772	$0.2 per hour, minimum payment of $4.95, maximum payment of $20, $4.95 per session, maximum session time is 2 hours	US	0	0		0	0		0
99591	Seattle	WA	98134	0	\N	8	ChargePoint Network	47.597404	-122.330444	\N	CHADEMO J1772COMBO	$0.2 per hour, minimum payment of $4.95, maximum payment of $20, $4.95 per session, maximum session time is 2 hours	US	3	4.95	min	0	0	min	0.2
99620	Tacoma	WA	98402	4	\N	0	ChargePoint Network	47.254322	-122.43941	\N	J1772	Pricing is by session. $3 per session, maximum session time is 8 hours	US	0	0		0	0		0
99621	Tacoma	WA	98402	2	\N	0	ChargePoint Network	47.251656	-122.43765	\N	J1772	Pricing is by session. $3 per session, maximum session time is 8 hours	US	0	0		0	0		0
99705	Ocean Shores	WA	98569	4	\N	0	ChargePoint Network	47.040283	-124.1585	\N	J1772	Free	US	0	0		0	0		0
99807	Vancouver	WA	98660	2	\N	0	ChargePoint Network	45.64343	-122.704216	\N	J1772	$0.22 per kWh	US	0	0		0	0		0
100012	Woodinville	WA	98072	2	\N	0	ChargePoint Network	47.754852	-122.1556	\N	J1772	Pricing is based on length of time. $0 per hour for the first 1 hour, and $1 per additional hour	US	0	0		0	0		0
100029	Kirkland	WA	98033	2	\N	0	ChargePoint Network	47.67531	-122.2055	\N	J1772	$1.5 per hour	US	0	0		0	0		0
100055	Issaquah	WA	98029	2	\N	0	ChargePoint Network	47.545074	-122.00891	\N	J1772	Pricing is based on an hourly rate. $1 per hour	US	0	0		0	0		0
100242	Tacoma	WA	98421	2	\N	2	eVgo Network	47.234898	-122.429535	\N	CHADEMO J1772 J1772COMBO	\N	US	3	0	min	0.29	0	min	0
100287	Port Orchard	WA	98366	1	\N	0	ChargePoint Network	47.53736	-122.638916	\N	J1772	Free	US	0	0		0	0		0
100346	Renton	WA	98057	2	\N	0	ChargePoint Network	47.471546	-122.232	\N	J1772	Pricing is based on length of time and kWh used. $0 per hour for the first 4 hours, and $4 per additional hour, $0.2 per kWh	US	0	0		0	0		0
100365	Renton	WA	98057	2	\N	0	ChargePoint Network	47.47425	-122.233826	\N	J1772	Pricing is based on length of time and kWh used. $0 per hour for the first 4 hours, and $4 per additional hour, $0.2 per kWh	US	0	0		0	0		0
100366	Bothell	WA	98021	2	\N	0	SemaCharge Network	47.796906	-122.19479	\N	J1772	FREE	US	0	0		0	0		0
100402	Poulsbo	WA	98370	2	\N	0	ChargePoint Network	47.746624	-122.63692	\N	J1772	$0.1 per kWh	US	0	0		0	0		0
100416	Mountlake Terrace	WA	98043	2	\N	0	ChargePoint Network	47.7989	-122.3025	\N	J1772	$2.5 per kWh	US	0	0		0	0		0
100499	Kent	WA	98042	2	\N	0	ChargePoint Network	47.3866	-122.10203	\N	J1772	$1 per hour, minimum payment of $1, maximum payment of $10	US	0	0		0	0		0
100564	Walla Walla	WA	99362	2	\N	0	SemaCharge Network	46.07058	-118.330635	\N	J1772	$0.35/Hr Parking Fee	US	0	0		0	0		0
102483	Aberdeen	WA	98520	0	\N	8	Tesla	46.97668	-123.813484	2017-01-15	TESLA	$0.28 per kWh; $0.26 per minute above 60 kW and $0.13 per minute at or below 60 kW	US	4	0		0	0		0
102484	Arlington	WA	98223	0	\N	16	Tesla	48.214504	-122.185715	2017-03-01	TESLA	$0.28 per kWh; $0.26 per minute above 60 kW and $0.13 per minute at or below 60 kW	US	4	0		0	0		0
102485	North Burlington	WA	98233	0	\N	8	Tesla	48.509495	-122.33749	2013-06-01	TESLA	$0.28 per kWh; $0.26 per minute above 60 kW and $0.13 per minute at or below 60 kW	US	4	0		0	0		0
102486	Centralia	WA	98531	0	\N	20	Tesla	46.72984	-122.97733	2013-06-01	TESLA	$0.28 per kWh; $0.26 per minute above 60 kW and $0.13 per minute at or below 60 kW	US	4	0		0	0		0
102487	Ellensburg	WA	98926	0	\N	5	Tesla	46.976917	-120.54162	2013-12-15	TESLA	$0.28 per kWh; $0.26 per minute above 60 kW and $0.13 per minute at or below 60 kW	US	4	0		0	0		0
102488	Kennewick	WA	99336	0	\N	8	Tesla	46.197292	-119.16214	2015-08-01	TESLA	$0.28 per kWh; $0.26 per minute above 60 kW and $0.13 per minute at or below 60 kW	US	4	0		0	0		0
102489	Lynnwood	WA	98087	0	\N	10	Tesla	47.84963	-122.272804	2018-07-23	TESLA	$0.28 per kWh; $0.26 per minute above 60 kW and $0.13 per minute at or below 60 kW	US	4	0		0	0		0
102491	Ritzville	WA	99169	0	\N	4	Tesla	47.116665	-118.36779	2014-06-15	TESLA	$0.28 per kWh; $0.26 per minute above 60 kW and $0.13 per minute at or below 60 kW	US	4	0		0	0		0
102492	Sequim	WA	98382	0	\N	8	Tesla	48.0708	-123.07398	2017-09-01	TESLA	$0.28 per kWh; $0.26 per minute above 60 kW and $0.13 per minute at or below 60 kW	US	4	0		0	0		0
102493	Vancouver	WA	98685	0	\N	12	Tesla	45.721508	-122.66489	2018-07-23	TESLA	$0.28 per kWh; $0.26 per minute above 60 kW and $0.13 per minute at or below 60 kW	US	4	0		0	0		0
102594	Leavenworth	WA	98826	0	\N	16	Tesla	47.598778	-120.65517	2018-07-01	TESLA	$0.28 per kWh; $0.26 per minute above 60 kW and $0.13 per minute at or below 60 kW	US	4	0		0	0		0
102700	Bellingham	WA	98226	1	\N	0	SemaCharge Network	48.788593	-122.50601	\N	J1772	FREE	US	0	0		0	0		0
102937	Bellevue	WA	98004	6	\N	0	ChargePoint Network	47.612194	-122.193115	\N	J1772	Pricing is based on time of day. $0.1 per kWh	US	0	0		0	0		0
103508	Issaquah	WA	98029	2	\N	0	ChargePoint Network	47.54036	-122.02003	\N	J1772	Pricing is based on length of time. $2.5 per hour for the first 1 hour, and $5 per additional hour	US	0	0		0	0		0
103554	Port Angeles	WA	98363	2	\N	0	Non-Networked	47.96937	-123.86338	2018-09-01	J1772	\N	US	0	0		0	0		0
103573	Seattle	WA	98115	0	\N	4	ChargePoint Network	47.7001	-122.32406	\N	CHADEMO J1772COMBO	$0.2 per hour, minimum payment of $4.95, maximum payment of $20, $4.95 per session, maximum session time is 2 hours	US	3	4.95	min	0	0	min	0.2
103577	Spoakane	WA	99201	0	\N	2	Greenlots	47.58997	-117.56584	\N	CHADEMO J1772COMBO	DC Fast: $0.35 per kWh, minimum payment of $0.50, maximum payment of $25.00	US	3	0	kwh	0.35	0	min	0
103581	Yakima	WA	98901	1	\N	2	Greenlots	46.677105	-120.478546	\N	CHADEMO J1772 J1772COMBO	DC Fast: $21.00 per hour	US	3	0	min	0.35	0	min	0
103586	pasco	WA	99301	1	\N	2	Greenlots	46.24173	-119.124176	\N	CHADEMO J1772 J1772COMBO	DC Fast: $21.00 per hour	US	3	0	min	0.35	0	min	0
103612	Spokane	WA	99218	2	\N	2	Greenlots	47.768803	-117.40195	\N	CHADEMO J1772 J1772COMBO	DC Fast: $0.35 per kWh, minimum payment of $0.50, maximum payment of $25.00	US	3	0	kwh	0.35	0	min	0
103652	Seattle	WA	98109	12	\N	0	ChargePoint Network	47.628784	-122.34272	\N	J1772	Free	US	0	0		0	0		0
103654	Seattle	WA	98109	4	\N	0	ChargePoint Network	47.628887	-122.34141	\N	J1772	Free	US	0	0		0	0		0
103819	Everson	WA	98247	1	\N	0	ChargePoint Network	48.893944	-122.280464	\N	J1772	$2 per kWh	US	0	0		0	0		0
103884	Skykomish	WA	98288	2	\N	0	ChargePoint Network	47.74632	-121.08998	\N	J1772	Free	US	0	0		0	0		0
103885	Skykomish	WA	98288	2	\N	0	ChargePoint Network	47.746483	-121.090004	\N	J1772	Free	US	0	0		0	0		0
103923	Aberdeen	WA	98520	1	\N	0	Non-Networked	46.9667	-123.80172	2015-07-01	J1772	Free	US	0	0		0	0		0
103924	Copalis Crossing	WA	98356	1	\N	0	Non-Networked	47.19536	-124.19608	2014-02-01	J1772	Free	US	0	0		0	0		0
103925	Moclips	WA	98562	1	\N	0	Non-Networked	47.24044	-124.2169	2017-07-01	J1772	Free	US	0	0		0	0		0
104003	Carson	WA	98610	1	\N	0	Non-Networked	45.72951	-121.82102	2018-10-01	J1772	Free	US	0	0		0	0		0
104005	Stevenson	WA	98648	4	\N	0	Non-Networked	45.685326	-121.90586	2018-10-01	J1772	Free	US	0	0		0	0		0
104006	Vancouver	WA	98662	2	\N	0	Non-Networked	45.652905	-122.59262	2018-10-01	J1772	Free	US	0	0		0	0		0
104030	Seattle	WA	98104	3	\N	0	SemaCharge Network	47.5987	-122.33519	\N	J1772	$0.00-$5.00/Hr Variable Parking Fee	US	0	0		0	0		0
104031	Seattle	WA	98104	4	\N	0	SemaCharge Network	47.597424	-122.33472	\N	J1772	$0.00-$5.00/Hr Variable Parking Fee	US	0	0		0	0		0
104054	Spokane	WA	99201	1	\N	0	Non-Networked	47.660576	-117.41445	2018-10-01	J1772	Free	US	0	0		0	0		0
104055	Spokane Valley	WA	99216	1	\N	0	Non-Networked	47.675377	-117.20674	2018-10-01	J1772	Free	US	0	0		0	0		0
104058	Spokane	WA	99205	12	\N	0	Non-Networked	47.700623	-117.425575	2018-10-01	J1772	Free	US	0	0		0	0		0
104162	Seattle	WA	98107	2	\N	0	ChargePoint Network	47.668957	-122.38881	\N	J1772	$1.5 per hour	US	0	0		0	0		0
104165	Federal Way	WA	98023	2	\N	2	Blink Network	47.29685	-122.381454	\N	CHADEMO J1772	Level 2: $0.49 per kWh, DC Fast: $0.59 per kWh	US	1	0	kwh	0.59	0	min	0
104227	Kirkland	WA	98033	2	\N	0	ChargePoint Network	47.675556	-122.20738	\N	J1772	Free	US	0	0		0	0		0
104265	Ridgefield	WA	98642	5	\N	0	Non-Networked	45.852337	-122.7084	2018-10-01	J1772	Free	US	0	0		0	0		0
104285	Seattle	WA	98125	0	\N	2	ChargePoint Network	47.713223	-122.298416	\N	CHADEMO J1772COMBO	$0.2 per hour, minimum payment of $4.95, maximum payment of $20, $4.95 per session, maximum session time is 2 hours	US	3	4.95	min	0	0	min	0.2
104286	Seattle	WA	98109	0	\N	2	ChargePoint Network	47.619434	-122.35137	\N	CHADEMO J1772COMBO	$0.2 per hour, minimum payment of $4.95, maximum payment of $20, $4.95 per session, maximum session time is 2 hours	US	3	4.95	min	0	0	min	0.2
104316	Seattle	WA	98121	6	\N	0	SemaCharge Network	47.611374	-122.343704	\N	J1772	$1.50-$5.00/Hr Variable Parking Fee	US	0	0		0	0		0
104371	Seattle	WA	98195	4	\N	0	ChargePoint Network	47.65033	-122.30757	\N	J1772	Free	US	0	0		0	0		0
104381	Seattle	WA	98109	4	\N	0	ChargePoint Network	47.623505	-122.34564	\N	J1772	$0.08 per kWh	US	0	0		0	0		0
104408	Kent	WA	98042	2	\N	0	Non-Networked	47.320953	-122.13822	2017-04-01	TESLA	Free	US	4	0		0	0		0
104446	Issaquah	WA	98029	0	\N	8	Tesla	47.548073	-122.039955	2018-10-01	TESLA	$0.28 per kWh; $0.26 per minute above 60 kW and $0.13 per minute at or below 60 kW	US	4	0		0	0		0
104454	Seattle	WA	98109	6	\N	0	SemaCharge Network	47.628384	-122.341896	\N	J1772	$0.00-$15.00/Hr Variable Parking Fee	US	0	0		0	0		0
104475	Seattle	WA	98105	1	\N	0	Non-Networked	47.661583	-122.32426	2018-10-01	J1772	Free	US	0	0		0	0		0
104574	Issaquah	WA	98029	4	\N	0	ChargePoint Network	47.5547	-122.04654	\N	J1772	Pricing is based on length of time and kWh used. $0 per hour, and $0.5 per additional hour, $0.15 per kWh	US	0	0		0	0		0
104636	Seattle	WA	98109	6	\N	0	ChargePoint Network	47.619705	-122.33829	\N	J1772	Free	US	0	0		0	0		0
104648	Renton	WA	98055	1	\N	0	Blink Network	47.44118	-122.199394	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
104823	Winthrop	WA	98862	1	\N	0	Non-Networked	48.47936	-120.186035	2018-01-01	J1772	Free	US	0	0		0	0		0
104981	Rochester	WA	98579	2	\N	0	Non-Networked	46.798298	-123.012245	2017-01-01	J1772	Free	US	0	0		0	0		0
105039	Ritzville	WA	99169	1	\N	0	Non-Networked	47.118637	-118.365585	2018-11-01	J1772	Free	US	0	0		0	0		0
105066	Bellevue	WA	98005	2	\N	0	ChargePoint Network	47.582336	-122.158646	\N	J1772	Pricing is by session. $2 per session, maximum session time is 24 hours	US	0	0		0	0		0
105080	Yakima	WA	98902	1	\N	0	Blink Network	46.585064	-120.54595	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
105098	Seattle	WA	98122	6	\N	0	SemaCharge Network	47.60787	-122.31966	\N	J1772	$1.00-$5.00/Hr Variable Parking Fee	US	0	0		0	0		0
116121	Seattle	WA	98101	1	\N	0	Tesla Destination	47.61044	-122.341484	2017-03-01	TESLA	Free	US	4	0		0	0		0
105118	Mercer Island	WA	98040	2	\N	0	ChargePoint Network	47.588123	-122.237206	\N	J1772	Pricing is based on length of time. $1 per hour for the first 4 hours, and $3 per additional hour	US	0	0		0	0		0
105123	Colville	WA	99114	2	\N	0	Greenlots	48.543915	-117.9048	\N	J1772	Level 2: Free	US	0	0		0	0		0
105138	Bellevue	WA	98007	1	\N	0	Blink Network	47.636677	-122.14	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
105150	Seattle	WA	98121	2	\N	0	ChargePoint Network	47.616943	-122.343895	\N	J1772	Free	US	0	0		0	0		0
105169	Bellevue	WA	98004	2	\N	0	ChargePoint Network	47.611458	-122.19324	\N	J1772	Free	US	0	0		0	0		0
105361	Yakima	WA	98901	2	\N	1	Non-Networked	46.60424	-120.48158	2018-12-01	J1772 J1772COMBO	Free	US	2	0	min	0	0	min	0
105362	Wenatchee	WA	98801	1	\N	1	Non-Networked	47.467464	-120.33692	2018-12-01	J1772 J1772COMBO	Free	US	2	0	min	0	0	min	0
105363	Port Angeles	WA	98362	0	\N	1	Non-Networked	48.11967	-123.43101	2018-12-01	CHADEMO J1772COMBO	Free	US	3	0	min	0.025	0	min	0
116073	Arlington	WA	98223	3	\N	0	Tesla Destination	48.214504	-122.185715	2017-03-01	TESLA	Free	US	4	0		0	0		0
116074	Ashford	WA	98304	2	\N	0	Tesla Destination	46.75148	-121.93684	2016-04-01	TESLA	Free	US	4	0		0	0		0
116075	Bellevue	WA	98004	2	\N	0	Tesla Destination	47.617664	-122.19311	2017-03-01	TESLA	Free	US	4	0		0	0		0
116076	Bellevue	WA	98004	1	\N	0	Tesla Destination	47.61273	-122.192894	2015-12-01	TESLA	Free	US	4	0		0	0		0
116077	Bellevue	WA	98004	2	\N	0	Tesla Destination	47.612125	-122.19801	2018-11-01	TESLA	Free	US	4	0		0	0		0
116078	Bellevue	WA	98004	2	\N	0	Tesla Destination	47.60712	-122.19056	2015-12-01	TESLA	Free	US	4	0		0	0		0
116079	Bellingham	WA	98225	2	\N	0	Tesla Destination	48.754135	-122.497055	2016-04-01	TESLA	Free	US	4	0		0	0		0
116080	Bellingham	WA	98226	1	\N	0	Tesla Destination	48.783142	-122.484	2014-03-21	TESLA	Free	US	4	0		0	0		0
116081	Bellingham	WA	98226	1	\N	0	Tesla Destination	48.788433	-122.48773	2016-04-01	TESLA	Free	US	4	0		0	0		0
116082	Benton City	WA	99320	2	\N	0	Tesla Destination	46.293793	-119.45153	2015-11-01	TESLA	Free	US	4	0		0	0		0
116083	Blaine	WA	98230	1	\N	0	Tesla Destination	48.990494	-122.77446	2014-04-01	TESLA	Free	US	4	0		0	0		0
116084	Carson	WA	98610	1	\N	0	Tesla Destination	45.72935	-121.821304	2016-06-01	TESLA	Free	US	4	0		0	0		0
116085	Cathlamet	WA	98612	1	\N	0	Tesla Destination	46.20249	-123.3842	2018-10-01	TESLA	Free	US	4	0		0	0		0
116086	Chelan	WA	98816	1	\N	0	Tesla Destination	47.842236	-120.098114	2018-11-01	TESLA	Free	US	4	0		0	0		0
116087	Cle Elum	WA	98922	3	\N	0	Tesla Destination	47.20847	-121.019585	2017-09-01	TESLA	Free	US	4	0		0	0		0
116088	Des Moines	WA	98198	4	\N	0	Tesla Destination	47.40063	-122.29699	2016-01-01	TESLA	Free	US	4	0		0	0		0
116089	Federal Way	WA	98003	2	\N	0	Tesla Destination	47.313656	-122.300514	2015-11-01	TESLA	Free	US	4	0		0	0		0
116090	Forks	WA	98331	2	\N	0	Tesla Destination	47.915108	-124.54488	2017-03-01	TESLA	Free	US	4	0		0	0		0
116091	Freeland	WA	98249	2	\N	0	Tesla Destination	48.010777	-122.533295	2016-12-15	TESLA	Free	US	4	0		0	0		0
116092	Gig Harbor	WA	98335	2	\N	0	Tesla Destination	47.306053	-122.58112	2018-11-01	TESLA	Free	US	4	0		0	0		0
116093	Gig Harbor	WA	98335	1	\N	0	Tesla Destination	47.3183	-122.58557	2015-10-01	TESLA	Free	US	4	0		0	0		0
116094	Issaquah	WA	98027	2	\N	0	Tesla Destination	47.55146	-122.057884	2018-11-01	TESLA	Free	US	4	0		0	0		0
116095	Kennewick	WA	99338	2	\N	0	Tesla Destination	46.212822	-119.28762	2017-09-01	TESLA	Free	US	4	0		0	0		0
116096	Kennewick	WA	99338	2	\N	0	Tesla Destination	46.177254	-119.189384	2016-02-01	TESLA	Free	US	4	0		0	0		0
116097	Langley	WA	98260	1	\N	0	Tesla Destination	48.03922	-122.40629	2016-02-01	TESLA	Free	US	4	0		0	0		0
116098	Langley	WA	98260	1	\N	0	Tesla Destination	48.041286	-122.41057	2016-11-01	TESLA	Free	US	4	0		0	0		0
116099	Leavenworth	WA	98826	1	\N	0	Tesla Destination	47.767845	-120.647934	2015-09-16	TESLA	Free	US	4	0		0	0		0
116100	Leavenworth	WA	98826	3	\N	0	Tesla Destination	47.55248	-120.68371	2018-11-01	TESLA	Free	US	4	0		0	0		0
116101	Manson	WA	98831	2	\N	0	Tesla Destination	47.88616	-120.1627	2018-11-01	TESLA	Free	US	4	0		0	0		0
116102	Manson	WA	98831	1	\N	0	Tesla Destination	47.895355	-120.131355	2018-11-01	TESLA	Free	US	4	0		0	0		0
116103	Moclips	WA	98562	3	\N	0	Tesla Destination	47.24085	-124.21701	2017-09-01	TESLA	Free	US	4	0		0	0		0
116104	Moses Lake	WA	98837	1	\N	0	Tesla Destination	47.10323	-119.251045	2017-05-05	TESLA	Free	US	4	0		0	0		0
116105	Mossyrock	WA	98564	2	\N	0	Tesla Destination	46.54478	-122.51062	2017-09-01	TESLA	Free	US	4	0		0	0		0
116106	Neah Bay	WA	98357	2	\N	0	Tesla Destination	48.34004	-124.663536	2015-10-01	TESLA	Free	US	4	0		0	0		0
116107	Neah Bay	WA	98357	2	\N	0	Tesla Destination	48.333225	-124.65978	2015-11-01	TESLA	Free	US	4	0		0	0		0
116108	Olympia	WA	98501	1	\N	0	Tesla Destination	47.039005	-122.88231	2016-02-01	TESLA	Free	US	4	0		0	0		0
116109	Olympia	WA	98502	2	\N	0	Tesla Destination	47.027313	-122.91335	2016-08-15	TESLA	Free	US	4	0		0	0		0
116110	Oroville	WA	98844	2	\N	0	Tesla Destination	48.98807	-119.42111	2017-09-01	TESLA	Free	US	4	0		0	0		0
116111	Pasco	WA	99301	2	\N	0	Tesla Destination	46.25078	-119.11671	2016-03-01	TESLA	Free	US	4	0		0	0		0
116112	Port Angeles	WA	98363	1	\N	0	Tesla Destination	48.10086	-123.47734	2017-09-01	TESLA	Free	US	4	0		0	0		0
116113	Port Angeles	WA	98362	1	\N	0	Tesla Destination	48.115112	-123.26831	2015-10-01	TESLA	Free	US	4	0		0	0		0
116114	Port Angeles	WA	98362	1	\N	0	Tesla Destination	48.11471	-123.25546	2015-10-01	TESLA	Free	US	4	0		0	0		0
116115	Pullman	WA	99163	2	\N	0	Tesla Destination	46.716045	-117.16578	2016-03-01	TESLA	Free	US	4	0		0	0		0
116116	Puyallup	WA	98371	2	\N	0	Tesla Destination	47.17715	-122.2932	2017-09-01	TESLA	Free	US	4	0		0	0		0
116117	Quincy	WA	98848	2	\N	0	Tesla Destination	47.09765	-119.98463	2015-11-01	TESLA	Free	US	4	0		0	0		0
116118	Redmond	WA	98052	2	\N	0	Tesla Destination	47.67118	-122.12174	2016-01-01	TESLA	Free	US	4	0		0	0		0
116119	Richland	WA	99352	2	\N	0	Tesla Destination	46.28144	-119.27301	2017-09-01	TESLA	Free	US	4	0		0	0		0
116120	Richland	WA	99352	2	\N	0	Tesla Destination	46.271503	-119.27027	2017-09-01	TESLA	Free	US	4	0		0	0		0
116122	Seattle	WA	98104	2	\N	0	Tesla Destination	47.60505	-122.336105	2016-05-01	TESLA	Free	US	4	0		0	0		0
116123	Seattle	WA	98101	2	\N	0	Tesla Destination	47.61002	-122.33542	2015-10-01	TESLA	Free	US	4	0		0	0		0
116124	Seattle	WA	98101	3	\N	0	Tesla Destination	47.612293	-122.33442	2018-11-01	TESLA	Free	US	4	0		0	0		0
116125	Seattle	WA	98188	1	\N	0	Tesla Destination	47.436905	-122.28844	2015-12-01	TESLA	Free	US	4	0		0	0		0
116126	Seattle	WA	98121	2	\N	0	Tesla Destination	47.61067	-122.34657	2015-10-01	TESLA	Free	US	4	0		0	0		0
116128	Seattle	WA	98105	2	\N	0	Tesla Destination	47.661583	-122.32426	2018-10-01	TESLA	Free	US	4	0		0	0		0
116129	Seattle	WA	98109	3	\N	0	Tesla Destination	47.622547	-122.333916	2016-01-01	TESLA	Free	US	4	0		0	0		0
116130	Seattle	WA	98101	2	\N	0	Tesla Destination	47.608017	-122.33486	2015-10-01	TESLA	Free	US	4	0		0	0		0
116131	Seattle	WA	98105	2	\N	0	Tesla Destination	47.66171	-122.315765	2017-09-01	TESLA	Free	US	4	0		0	0		0
116132	Seattle	WA	98109	2	\N	0	Tesla Destination	47.623505	-122.34564	2017-09-01	TESLA	Free	US	4	0		0	0		0
116133	Seattle	WA	98109	2	\N	0	Tesla Destination	47.625122	-122.34448	2017-09-01	TESLA	Free	US	4	0		0	0		0
116134	Seattle	WA	98101	1	\N	0	Tesla Destination	47.614216	-122.33661	2015-12-01	TESLA	Free	US	4	0		0	0		0
116135	Seattle	WA	98112	1	\N	0	Tesla Destination	47.62703	-122.31492	2015-11-01	TESLA	Free	US	4	0		0	0		0
116136	Seattle	WA	98101	2	\N	0	Tesla Destination	47.60738	-122.33916	2015-12-01	TESLA	Free	US	4	0		0	0		0
116137	Seaview	WA	98644	1	\N	0	Tesla Destination	46.334797	-124.05508	2015-12-11	TESLA	Free	US	4	0		0	0		0
116138	Sequim	WA	98382	2	\N	0	Tesla Destination	48.062317	-123.16821	2017-09-01	TESLA	Free	US	4	0		0	0		0
116139	Sequim	WA	98382	2	\N	0	Tesla Destination	48.148746	-123.153244	2017-03-01	TESLA	Free	US	4	0		0	0		0
116140	Shelton	WA	98584	3	\N	0	Tesla Destination	47.254364	-123.196815	2018-11-01	TESLA	Free	US	4	0		0	0		0
116141	Snoqualmie	WA	98065	4	\N	0	Tesla Destination	47.516792	-121.84036	2018-11-01	TESLA	Free	US	4	0		0	0		0
116142	Spokane	WA	99201	1	\N	0	Tesla Destination	47.65688	-117.424255	2015-11-01	TESLA	Free	US	4	0		0	0		0
116143	Spokane	WA	99201	1	\N	0	Tesla Destination	47.656254	-117.42299	2015-12-01	TESLA	Free	US	4	0		0	0		0
116144	Spokane	WA	99201	2	\N	0	Tesla Destination	47.66344	-117.41278	2015-11-01	TESLA	Free	US	4	0		0	0		0
116145	Spokane	WA	99224	2	\N	0	Tesla Destination	47.637222	-117.477036	2016-01-01	TESLA	Free	US	4	0		0	0		0
116146	Spokane	WA	99201	1	\N	0	Tesla Destination	47.660572	-117.414246	2016-03-01	TESLA	Free	US	4	0		0	0		0
116147	Spokane	WA	99201	1	\N	0	Tesla Destination	47.659763	-117.41737	2015-10-01	TESLA	Free	US	4	0		0	0		0
116148	Spokane	WA	99201	1	\N	0	Tesla Destination	47.65736	-117.424	2015-11-01	TESLA	Free	US	4	0		0	0		0
116149	Spokane	WA	99224	2	\N	0	Tesla Destination	47.64294	-117.53782	2017-09-01	TESLA	Free	US	4	0		0	0		0
116150	Spokane Valley	WA	99216	2	\N	0	Tesla Destination	47.675377	-117.20674	2017-03-01	TESLA	Free	US	4	0		0	0		0
116151	Stevenson	WA	98648	4	\N	0	Tesla Destination	45.685326	-121.90586	2016-04-01	TESLA	Free	US	4	0		0	0		0
116152	Tacoma	WA	98444	2	\N	0	Tesla Destination	47.2499	-122.43955	2015-10-01	TESLA	Free	US	4	0		0	0		0
116153	Tacoma	WA	98421	2	\N	0	Tesla Destination	47.238613	-122.426704	2015-12-01	TESLA	Free	US	4	0		0	0		0
116154	Union	WA	98592	2	\N	0	Tesla Destination	47.34719	-123.06768	2015-12-01	TESLA	Free	US	4	0		0	0		0
116155	Vancouver	WA	98662	4	\N	0	Tesla Destination	45.65327	-122.59199	2018-10-01	TESLA	Free	US	4	0		0	0		0
116156	Walla Walla	WA	99362	1	\N	0	Tesla Destination	46.089317	-118.27868	2016-02-01	TESLA	Free	US	4	0		0	0		0
116157	Walla Walla	WA	99362	1	\N	0	Tesla Destination	46.012333	-118.36989	2015-12-01	TESLA	Free	US	4	0		0	0		0
116158	Walla Walla	WA	99362	1	\N	0	Tesla Destination	46.08737	-118.22673	2015-11-01	TESLA	Free	US	4	0		0	0		0
116159	Walla Walla	WA	99362	1	\N	0	Tesla Destination	46.01607	-118.38596	2015-10-01	TESLA	Free	US	4	0		0	0		0
116160	Walla Walla	WA	99362	2	\N	0	Tesla Destination	46.067802	-118.34142	2016-12-15	TESLA	Free	US	4	0		0	0		0
116161	Walla Walla	WA	99362	2	\N	0	Tesla Destination	46.085976	-118.27802	2015-11-01	TESLA	Free	US	4	0		0	0		0
116162	Wenatchee	WA	98801	1	\N	0	Tesla Destination	47.47487	-120.37601	2015-12-01	TESLA	Free	US	4	0		0	0		0
116163	Westport	WA	98595	3	\N	0	Tesla Destination	46.860035	-124.107735	2017-03-01	TESLA	Free	US	4	0		0	0		0
116164	Winthrop	WA	98862	2	\N	0	Tesla Destination	48.476864	-120.2559	2016-03-01	TESLA	Free	US	4	0		0	0		0
116165	Woodinville	WA	98072	5	\N	0	Tesla Destination	47.732964	-122.14123	2018-11-01	TESLA	Free	US	4	0		0	0		0
116167	Yakima	WA	98901	4	\N	0	Tesla Destination	46.60458	-120.49495	2018-11-01	TESLA	Free	US	4	0		0	0		0
116741	Vista Dr	WA	99019	2	\N	0	Greenlots	47.66704	-117.11045	\N	J1772	Level 2: Free	US	0	0		0	0		0
116743	Spokane Valley	WA	99202	2	\N	0	Greenlots	47.662693	-117.34669	\N	J1772	Level 2: Free	US	0	0		0	0		0
116820	Cle Elum	WA	98922	0	\N	12	Tesla	47.189312	-120.9026	2018-12-01	TESLA	$0.28 per kWh; $0.26 per minute above 60 kW and $0.13 per minute at or below 60 kW	US	4	0		0	0		0
116964	Seattle	WA	98134	6	\N	0	SemaCharge Network	47.557617	-122.331184	\N	J1772	$0.10/kWh Energy Fee	US	0	0		0	0		0
117128	Vancouver	WA	98662	2	\N	0	Non-Networked	45.658848	-122.58349	2019-01-01	J1772	Free	US	0	0		0	0		0
117302	Bellevue	WA	98006	2	\N	0	ChargePoint Network	47.578255	-122.17137	\N	J1772	Pricing is based on length of time and kWh used. $0 per hour for the first 1 hour, and $3 per additional hour, $0.15 per kWh, minimum payment of $1	US	0	0		0	0		0
117303	Bellevue	WA	98006	2	\N	0	ChargePoint Network	47.578785	-122.17127	\N	J1772	Pricing is based on length of time and kWh used. $0 per hour for the first 1 hour, and $3 per additional hour, $0.15 per kWh, minimum payment of $1	US	0	0		0	0		0
117304	Mercer Island	WA	98040	2	\N	0	ChargePoint Network	47.588562	-122.23813	\N	J1772	Pricing is based on length of time and kWh used. $0 per hour for the first 1 hour, and $3 per additional hour, $0.15 per kWh, minimum payment of $1	US	0	0		0	0		0
117456	University Place	WA	98466	4	\N	0	ChargePoint Network	47.224907	-122.53603	\N	J1772	Free	US	0	0		0	0		0
117457	University Place	WA	98466	2	\N	0	ChargePoint Network	47.226254	-122.53613	\N	J1772	Free	US	0	0		0	0		0
117535	Seattle	WA	98101	6	\N	0	SemaCharge Network	47.61569	-122.33599	\N	J1772	$0.50-$3.00/Hr Variable Parking Fee	US	0	0		0	0		0
117543	Lakewood	WA	98499	6	\N	0	ChargePoint Network	47.17594	-122.50656	\N	J1772	Pricing is based on length of time and kWh used. $0 per hour for the first 4 hours, and $2 per additional hour, $0.4 per kWh	US	0	0		0	0		0
117829	Grayland	WA	98590	2	\N	0	SemaCharge Network	46.725018	-124.02067	\N	J1772	$1.25/Hr Parking Fee	US	0	0		0	0		0
117887	Bellingham	WA	98225	2	\N	0	SemaCharge Network	48.747074	-122.48075	\N	J1772	FREE	US	0	0		0	0		0
117888	Everett	WA	98203	1	\N	0	SemaCharge Network	47.935726	-122.2184	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
117891	Bellevue	WA	98004	2	\N	0	SemaCharge Network	47.613396	-122.197014	\N	J1772	$2.00-$5.00/Hr Variable Parking Fee	US	0	0		0	0		0
117892	Seattle	WA	98117	1	\N	0	SemaCharge Network	47.69064	-122.37675	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
117893	Seattle	WA	98109	6	\N	0	SemaCharge Network	47.61809	-122.33892	\N	J1772	FREE	US	0	0		0	0		0
117894	Seattle	WA	98101	4	\N	0	SemaCharge Network	47.61569	-122.33599	\N	J1772	$0.50-$3.00/Hr Variable Parking Fee	US	0	0		0	0		0
117895	Seattle	WA	98101	4	\N	0	SemaCharge Network	47.611378	-122.33144	\N	J1772	$0.00-$2.00/Hr Variable Parking Fee	US	0	0		0	0		0
117899	Tacoma	WA	98444	1	\N	0	SemaCharge Network	47.180935	-122.434074	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
117900	University Place	WA	98467	1	\N	0	SemaCharge Network	47.213604	-122.53662	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
118061	Cle Elum	WA	98922	0	\N	2	Greenlots	47.188904	-120.9031	\N	CHADEMO J1772COMBO	DC Fast: $21.00 per hour	US	3	0	min	0.35	0	min	0
118070	Everett	WA	98208	1	\N	0	SemaCharge Network	47.878933	-122.20713	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
118072	Bothell	WA	98021	2	\N	0	SemaCharge Network	47.77678	-122.18153	\N	J1772	$1.75/Hr Parking Fee	US	0	0		0	0		0
118073	Shoreline	WA	98155	1	\N	0	SemaCharge Network	47.756237	-122.31346	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
118075	Bellevue	WA	98005	6	\N	0	SemaCharge Network	47.580635	-122.156456	\N	J1772	FREE	US	0	0		0	0		0
118076	Seattle	WA	98199	4	\N	0	SemaCharge Network	47.65588	-122.38277	\N	J1772	$1.00-$4.50/Hr Variable Parking Fee	US	0	0		0	0		0
118078	Seattle	WA	98109	6	\N	0	SemaCharge Network	47.62434	-122.33876	\N	J1772	FREE	US	0	0		0	0		0
118079	Seattle	WA	98109	3	\N	0	SemaCharge Network	47.622875	-122.33942	\N	J1772	FREE	US	0	0		0	0		0
118080	Seattle	WA	98101	6	\N	0	SemaCharge Network	47.615646	-122.33505	\N	J1772	$0.00-$3.00/Hr Variable Parking Fee	US	0	0		0	0		0
118081	Seattle	WA	98104	6	\N	0	SemaCharge Network	47.603962	-122.32412	\N	J1772	FREE	US	0	0		0	0		0
118082	Seattle	WA	98121	1	\N	0	SemaCharge Network	47.619076	-122.35957	\N	J1772	$1.00/Hr Parking Fee	US	0	0		0	0		0
118083	Seattle	WA	98121	1	\N	0	SemaCharge Network	47.61147	-122.34383	\N	J1772	$1.50-$5.00/Hr Variable Parking Fee	US	0	0		0	0		0
118085	Seattle	WA	98101	4	\N	0	SemaCharge Network	47.60728	-122.33609	\N	J1772	$0.55-$15.00/Hr Variable Parking Fee	US	0	0		0	0		0
118086	Seattle	WA	98101	9	\N	0	SemaCharge Network	47.609158	-122.34184	\N	J1772	$1.00/Hr Parking Fee	US	0	0		0	0		0
118087	Port Angeles	WA	98362	1	\N	0	SemaCharge Network	48.119728	-123.4323	\N	J1772	$1.50-$5.00/Hr Variable Parking Fee	US	0	0		0	0		0
118090	Port Angeles	WA	98363	2	\N	0	SemaCharge Network	48.057087	-123.80004	\N	J1772	FREE	US	0	0		0	0		0
118091	Auburn	WA	98001	2	\N	0	SemaCharge Network	47.294468	-122.245834	\N	J1772	$1.00/Hr Parking Fee	US	0	0		0	0		0
118093	Tacoma	WA	98402	4	\N	0	SemaCharge Network	47.251595	-122.440796	\N	J1772	$0.85-$5.00/Hr Variable Parking Fee	US	0	0		0	0		0
118095	Vancouver	WA	98664	1	\N	0	SemaCharge Network	45.621548	-122.5726	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
118096	Vancouver	WA	98660	2	\N	0	SemaCharge Network	45.630493	-122.66769	\N	J1772	$3.00/Hr Parking Fee	US	0	0		0	0		0
118214	Bellevue	WA	98004	2	\N	0	SemaCharge Network	47.617645	-122.191376	\N	J1772	$1.50/Hr Parking Fee	US	0	0		0	0		0
118215	Issaquah	WA	98027	3	\N	0	SemaCharge Network	47.536236	-122.02206	\N	J1772	$2.00-$4.00/Hr Variable Parking Fee	US	0	0		0	0		0
118217	Seattle	WA	98109	4	\N	0	SemaCharge Network	47.622875	-122.33942	\N	J1772	FREE	US	0	0		0	0		0
118219	Seattle	WA	98101	3	\N	0	SemaCharge Network	47.61718	-122.331375	\N	J1772	FREE	US	0	0		0	0		0
118220	Seattle	WA	98191	3	\N	0	SemaCharge Network	47.613235	-122.334404	\N	J1772	$1.80/Hr Parking Fee	US	0	0		0	0		0
118221	Seattle	WA	98101	4	\N	0	SemaCharge Network	47.606007	-122.336716	\N	J1772	$0.20/kWh Energy Fee	US	0	0		0	0		0
118222	Seattle	WA	98101	6	\N	0	SemaCharge Network	47.60352	-122.3329	\N	J1772	$0.00-$2.00/Hr Variable Parking Fee	US	0	0		0	0		0
118223	Seattle	WA	98104	2	\N	0	SemaCharge Network	47.603443	-122.33391	\N	J1772	$0.00-$10.00/Hr Variable Parking Fee, $0.08/kWh Energy Fee	US	0	0		0	0		0
118224	Renton	WA	98059	1	\N	0	SemaCharge Network	47.488495	-122.164215	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
118225	Renton	WA	98056	1	\N	0	SemaCharge Network	47.47783	-122.21628	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
118226	Bremerton	WA	98310	1	\N	0	SemaCharge Network	47.594475	-122.62947	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
118232	Cathlamet	WA	98612	1	\N	0	SemaCharge Network	46.202576	-123.38417	\N	J1772	$1.00/Hr Parking Fee , $0.08/kWh Energy Fee	US	0	0		0	0		0
118349	Lynnwood	WA	98037	1	\N	0	SemaCharge Network	47.848698	-122.246155	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
118350	Seattle	WA	98101	7	\N	0	SemaCharge Network	47.616493	-122.33249	\N	J1772	$0.00-$5.00/Hr Variable Parking Fee	US	0	0		0	0		0
118351	Seattle	WA	98101	1	\N	0	SemaCharge Network	47.609814	-122.3413	\N	J1772	FREE	US	0	0		0	0		0
118354	Kent	WA	98042	1	\N	0	SemaCharge Network	47.3588	-122.164825	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
118355	Auburn	WA	98002	4	\N	0	SemaCharge Network	47.290962	-122.19539	\N	J1772	FREE	US	0	0		0	0		0
118357	Tacoma	WA	98407	2	\N	0	SemaCharge Network	47.29816	-122.50342	\N	J1772	$2.00-$5.00/Hr Variable Parking Fee	US	0	0		0	0		0
118358	Tacoma	WA	98407	1	\N	0	SemaCharge Network	47.28126	-122.51658	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
118530	Bellingham	WA	98225	6	\N	0	SemaCharge Network	48.739197	-122.48515	\N	J1772	FREE	US	0	0		0	0		0
118531	Redmond	WA	98052	2	\N	0	SemaCharge Network	47.703403	-122.153786	\N	J1772	$1.75/Hr Parking Fee	US	0	0		0	0		0
118532	Redmond	WA	98052	6	\N	0	SemaCharge Network	47.666584	-122.099144	\N	J1772	$0.00-$2.00/Hr Variable Parking Fee	US	0	0		0	0		0
118533	Kirkland	WA	98034	1	\N	0	SemaCharge Network	47.70474	-122.21086	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
118534	Seattle	WA	98122	4	\N	0	SemaCharge Network	47.61549	-122.311005	\N	J1772	$2.00-$3.00/Hr Variable Parking Fee	US	0	0		0	0		0
118538	Seattle	WA	98119	2	\N	0	SemaCharge Network	47.624603	-122.35932	\N	J1772	$1.00-$3.00/Hr Variable Parking Fee	US	0	0		0	0		0
118540	Seattle	WA	98134	6	\N	0	SemaCharge Network	47.58925	-122.33581	\N	J1772	FREE	US	0	0		0	0		0
118541	Renton	WA	98056	1	\N	0	SemaCharge Network	47.502506	-122.178024	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
118543	Tacoma	WA	98444	1	\N	0	SemaCharge Network	47.147144	-122.43363	\N	J1772	FREE	US	0	0		0	0		0
118544	DuPont	WA	98327	2	\N	0	SemaCharge Network	47.09394	-122.62606	\N	J1772	$1.00-$5.00/Hr Variable Parking Fee	US	0	0		0	0		0
118546	Olympia	WA	98513	4	\N	0	SemaCharge Network	47.00029	-122.66829	\N	J1772	FREE	US	0	0		0	0		0
118547	Vancouver	WA	98665	1	\N	0	SemaCharge Network	45.69262	-122.657684	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
118548	Vancouver	WA	98661	1	\N	0	SemaCharge Network	45.643375	-122.600105	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
118699	Bellevue	WA	98004	6	\N	0	SemaCharge Network	47.618317	-122.1969	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
118740	Kirkland	WA	98033	1	\N	0	SemaCharge Network	47.67881	-122.17536	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
118741	Seattle	WA	98125	1	\N	0	SemaCharge Network	47.70844	-122.317924	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
118744	Seattle	WA	98109	4	\N	0	SemaCharge Network	47.62669	-122.341934	\N	J1772	FREE	US	0	0		0	0		0
118745	Seattle	WA	98109	6	\N	0	SemaCharge Network	47.623344	-122.33469	\N	J1772	$0.00-$2.00/Hr Variable Parking Fee	US	0	0		0	0		0
118746	Seattle	WA	98101	4	\N	0	SemaCharge Network	47.615646	-122.33505	\N	J1772	$0.00-$3.00/Hr Variable Parking Fee	US	0	0		0	0		0
118747	Bainbridge Island	WA	98110	2	\N	0	SemaCharge Network	47.63579	-122.51483	\N	J1772	$2.00/Hr Parking Fee	US	0	0		0	0		0
118750	Long Beach	WA	98631	1	\N	0	SemaCharge Network	46.345592	-124.06061	\N	J1772	FREE	US	0	0		0	0		0
118751	Vancouver	WA	98662	1	\N	0	SemaCharge Network	45.66157	-122.56363	\N	J1772	$1.00/Hr Parking Fee	US	0	0		0	0		0
119017	Tacoma	WA	98404	1	\N	0	ChargePoint Network	47.206963	-122.40522	\N	J1772	Free	US	0	0		0	0		0
119039	Bellevue	WA	98005	1	\N	1	ChargePoint Network	47.62654	-122.15585	\N	J1772 J1772COMBO	Free	US	2	0	min	0	0	min	0
120851	Seattle	WA	98104	8	\N	0	SemaCharge Network	47.59809	-122.33097	\N	J1772	$1.25-$5.00/Hr Variable Parking Fee	US	0	0		0	0		0
120879	Seattle	WA	98109	2	\N	0	ChargePoint Network	47.625076	-122.339035	\N	J1772	Free	US	0	0		0	0		0
120898	Spokane	WA	99224	2	\N	0	Greenlots	47.614304	-117.50333	\N	J1772	Level 2: Free	US	0	0		0	0		0
120927	Redmond	WA	98052	1	\N	0	Blink Network	47.674374	-122.12717	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
120962	Tacoma	WA	98409	4	\N	0	ChargePoint Network	47.228638	-122.48405	\N	J1772	Pricing is by session. $2 per session, maximum session time is 5 hours	US	0	0		0	0		0
121095	Tacoma	WA	98447	2	\N	0	ChargePoint Network	47.1451	-122.43874	\N	J1772	Free	US	0	0		0	0		0
121096	Tacoma	WA	98447	4	\N	0	ChargePoint Network	47.14519	-122.43897	\N	J1772	Free	US	0	0		0	0		0
121108	Redmond	WA	98052	6	\N	0	SemaCharge Network	47.68882	-122.150314	\N	J1772	$1.25/Hr Parking Fee	US	0	0		0	0		0
121126	Spokane	WA	99224	6	\N	0	ChargePoint Network	47.630135	-117.5382	\N	J1772	Free	US	0	0		0	0		0
121216	Tacoma	WA	98403	4	\N	0	ChargePoint Network	47.274548	-122.46601	\N	J1772	Pricing is by session. $2 per session, maximum session time is 5 hours	US	0	0		0	0		0
121379	Tacoma	WA	98402	6	\N	0	SemaCharge Network	47.24647	-122.439644	\N	J1772	$0.00-$5.00/Hr Variable Parking Fee	US	0	0		0	0		0
121382	Bellingham	WA	98225	2	\N	0	ChargePoint Network	48.73808	-122.46939	\N	J1772	Pricing is based on length of time. $1 per hour for the first 3 hours, and $2.5 per additional hour	US	0	0		0	0		0
121397	BELLEVUE	WA	98004	4	\N	0	Greenlots	47.6123	-122.1966	\N	J1772	Level 2: $1.00 per hour, minimum payment of $2.00	US	0	0		0	0		0
121549	Seattle	WA	98134	4	\N	0	ChargePoint Network	47.589584	-122.33369	\N	J1772	$0.25 per kWh	US	0	0		0	0		0
121601	Tukwila	WA	98188	1	\N	0	Blink Network	47.44897	-122.25331	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
121607	Vancouver	WA	98683	4	\N	0	SemaCharge Network	45.61839	-122.49174	\N	J1772	$1.00-$5.00/Hr Variable Parking Fee	US	0	0		0	0		0
121663	Seattle	WA	98109	0	\N	2	ChargePoint Network	47.61958	-122.35095	\N	CHADEMO J1772COMBO	$0.2 per hour, minimum payment of $4.95, maximum payment of $20, $4.95 per session, maximum session time is 2 hours	US	3	4.95	min	0	0	min	0.2
121703	Spokane Valley	WA	99037	0	\N	8	Electrify America	47.665596	-117.190125	\N	CHADEMO J1772COMBO	\N	US	3	1	min	0.25	0	min	0
121704	North Bend	WA	98045	0	\N	4	Electrify America	47.491287	-121.79356	\N	CHADEMO J1772COMBO	\N	US	3	1	min	0.25	0	min	0
121705	Ellensburg	WA	98926	0	\N	4	Electrify America	46.9789	-120.54343	\N	CHADEMO J1772COMBO	\N	US	3	1	min	0.25	0	min	0
121709	Vancouver	WA	98665	0	\N	6	Electrify America	45.687386	-122.66091	\N	CHADEMO J1772COMBO	\N	US	3	1	min	0.25	0	min	0
122190	Yakima	WA	98901	2	\N	0	Non-Networked	46.60415	-120.50297	2016-05-15	J1772	Free	US	0	0		0	0		0
122217	Mount Vernon	WA	98273	6	\N	0	ChargePoint Network	48.4431	-122.31654	\N	J1772	$0.88 per kWh	US	0	0		0	0		0
122266	Monroe	WA	98272	0	\N	12	Tesla	47.86277	-121.97844	2019-03-01	TESLA	$0.28 per kWh; $0.26 per minute above 60 kW and $0.13 per minute at or below 60 kW	US	4	0		0	0		0
122580	Dayton	WA	99328	2	\N	0	Tesla Destination	46.31017	-117.99763	2019-03-01	TESLA	Free	US	4	0		0	0		0
122581	Seattle	WA	98101	4	\N	0	Tesla Destination	47.609924	-122.33376	2019-03-01	TESLA	Free	US	4	0		0	0		0
122582	Tukwila	WA	98188	4	\N	0	Tesla Destination	47.457314	-122.25113	2019-03-01	TESLA	Free	US	4	0		0	0		0
122583	Woodinville	WA	98072	2	\N	0	Tesla Destination	47.769836	-122.14802	2019-03-01	TESLA	Free	US	4	0		0	0		0
122743	Everett	WA	98204	1	\N	3	Electrify America	47.8935	-122.256004	\N	CHADEMO J1772 J1772COMBO	\N	US	3	1	min	0.25	0	min	0
122765	Bellevue	WA	98004	8	\N	0	ChargePoint Network	47.611504	-122.201256	\N	J1772	Free	US	0	0		0	0		0
122773	Seattle	WA	98102	6	\N	0	ChargePoint Network	47.635098	-122.326775	\N	J1772	Free	US	0	0		0	0		0
122774	Seattle	WA	98102	2	\N	0	ChargePoint Network	47.63512	-122.32587	\N	J1772	Free	US	0	0		0	0		0
122781	Bellevue	WA	98004	4	\N	0	ChargePoint Network	47.615322	-122.20196	\N	J1772	Pricing is based on an hourly rate. $2 per hour, minimum payment of $1, maximum session time is 24 hours	US	0	0		0	0		0
122813	Seattle	WA	98104	6	\N	0	SemaCharge Network	47.6092	-122.32411	\N	J1772	$1.00-$5.00/Hr Variable Parking Fee	US	0	0		0	0		0
122817	Seattle	WA	98109	4	\N	0	ChargePoint Network	47.603664	-122.320145	\N	J1772	Free	US	0	0		0	0		0
122833	Spokane	WA	99201	2	\N	0	Greenlots	47.58806	-117.56153	\N	J1772	Level 2: Free	US	0	0		0	0		0
122836	Liberty Lake	WA	99019	2	\N	0	Greenlots	47.6727	-117.10006	\N	J1772	Level 2: Free	US	0	0		0	0		0
122957	Bellevue	WA	98004	4	\N	0	ChargePoint Network	47.615604	-122.2056	\N	J1772	Pricing is based on an hourly rate. $2 per hour, minimum payment of $1, maximum session time is 24 hours	US	0	0		0	0		0
122963	Port Angeles	WA	98362	1	\N	0	ChargePoint Network	48.102146	-123.3416	\N	J1772	Free	US	0	0		0	0		0
122993	Bellevue	WA	98004	2	\N	0	ChargePoint Network	47.61599	-122.205536	\N	J1772	Pricing is based on an hourly rate. $2 per hour, minimum payment of $1, maximum session time is 24 hours	US	0	0		0	0		0
122994	Bellevue	WA	98004	4	\N	0	ChargePoint Network	47.62847	-122.205734	\N	J1772	Pricing is based on an hourly rate. $2 per hour, minimum payment of $1, maximum session time is 24 hours	US	0	0		0	0		0
123004	Mount Vernon	WA	98273	0	\N	4	Electrify America	48.44174	-122.34476	\N	CHADEMO J1772COMBO	\N	US	3	1	min	0.25	0	min	0
123007	Quinault	WA	98575	2	\N	0	Non-Networked	47.465553	-123.85074	2018-05-01	J1772	\N	US	0	0		0	0		0
123050	Renton	WA	98057	1	\N	3	Electrify America	47.49729	-122.199295	\N	CHADEMO J1772 J1772COMBO	\N	US	3	1	min	0.25	0	min	0
123156	Redmond	WA	98053	4	\N	0	EV Connect	47.673443	-122.065704	2019-04-01	J1772	\N	US	0	0		0	0		0
123157	Bothell	WA	98011	2	\N	0	EV Connect	47.771793	-122.18099	2019-04-01	J1772	\N	US	0	0		0	0		0
123446	Lynnwood	WA	98037	1	\N	3	Electrify America	47.83199	-122.267334	\N	CHADEMO J1772 J1772COMBO	\N	US	3	1	min	0.25	0	min	0
123473	Lakewood	WA	98498	2	\N	0	ChargePoint Network	47.116966	-122.56854	\N	J1772	Free	US	0	0		0	0		0
123479	Lacey	WA	98516	0	\N	6	Electrify America	47.059658	-122.77201	\N	CHADEMO J1772COMBO	\N	US	3	1	min	0.25	0	min	0
123544	Kenmore	WA	98028	1	\N	0	Blink Network	47.759666	-122.2509	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
123545	Renton	WA	98055	4	\N	0	ChargePoint Network	47.44461	-122.212845	\N	J1772	Free	US	0	0		0	0		0
123546	Renton	WA	98055	4	\N	0	ChargePoint Network	47.444965	-122.212975	\N	J1772	Free	US	0	0		0	0		0
123567	Seattle	WA	98109	2	\N	0	ChargePoint Network	47.623966	-122.33769	\N	J1772	Free	US	0	0		0	0		0
123611	Lynnwood	WA	98036	6	\N	0	SemaCharge Network	47.814236	-122.30169	\N	J1772	$0.00-$2.00/Hr Variable Parking Fee, $0.00-$0.11/kWh Variable Energy Fee	US	0	0		0	0		0
123671	Marysville	WA	98271	2	\N	0	ChargePoint Network	48.139507	-122.184616	\N	J1772	Free	US	0	0		0	0		0
123774	Bellevue	WA	98004	6	\N	0	SemaCharge Network	47.614178	-122.19936	\N	J1772	FREE	US	0	0		0	0		0
124057	Covington	WA	98042	1	\N	3	Electrify America	47.36098	-122.11021	\N	CHADEMO J1772 J1772COMBO	\N	US	3	1	min	0.25	0	min	0
124151	Seattle	WA	98134	4	\N	0	SemaCharge Network	47.597507	-122.3286	\N	J1772	$0.00-$5.00/Hr Variable Parking Fee	US	0	0		0	0		0
124683	Tulalip	WA	98271	0	\N	4	Electrify America	48.095463	-122.1869	\N	CHADEMO J1772COMBO	\N	US	3	1	min	0.25	0	min	0
124684	Kelso	WA	98626	0	\N	4	Electrify America	46.139874	-122.90126	\N	CHADEMO J1772COMBO	\N	US	3	1	min	0.25	0	min	0
124987	Steilacoom	WA	98388	1	\N	0	SemaCharge Network	47.172726	-122.598434	\N	J1772	$1.50/Hr Parking Fee	US	0	0		0	0		0
125152	Forks	WA	98331	4	\N	0	SemaCharge Network	47.60552	-124.37156	\N	J1772	FREE	US	0	0		0	0		0
125764	Mount Vernon	WA	98273	1	\N	0	SemaCharge Network	48.49429	-122.48088	\N	J1772	FREE	US	0	0		0	0		0
125765	Woodinville	WA	98072	1	\N	0	SemaCharge Network	47.804565	-122.12055	\N	J1772	FREE	US	0	0		0	0		0
125769	Silverdale	WA	98383	1	\N	0	SemaCharge Network	47.63564	-122.72383	\N	J1772	FREE	US	0	0		0	0		0
125772	Puyallup	WA	98372	1	\N	0	SemaCharge Network	47.20492	-122.288246	\N	J1772	FREE	US	0	0		0	0		0
125992	Moses Lake	WA	98837	2	\N	0	SemaCharge Network	47.129375	-119.27914	\N	J1772	FREE	US	0	0		0	0		0
125993	Seattle	WA	98133	1	\N	0	SemaCharge Network	47.70339	-122.355835	\N	J1772	FREE	US	0	0		0	0		0
125994	Seattle	WA	98133	1	\N	0	SemaCharge Network	47.703632	-122.35651	\N	J1772	FREE	US	0	0		0	0		0
125995	Mercer Island	WA	98040	2	\N	0	SemaCharge Network	47.60692	-122.19872	\N	J1772	FREE	US	0	0		0	0		0
125997	Seattle	WA	98104	2	\N	0	SemaCharge Network	47.604855	-122.33383	\N	J1772	FREE	US	0	0		0	0		0
125998	Seattle	WA	98104	4	\N	0	SemaCharge Network	47.597523	-122.327675	\N	J1772	FREE	US	0	0		0	0		0
126000	Auburn	WA	98002	1	\N	0	SemaCharge Network	47.276863	-122.21347	\N	J1772	FREE	US	0	0		0	0		0
126001	DuPont	WA	98327	1	\N	0	SemaCharge Network	47.092068	-122.64223	\N	J1772	FREE	US	0	0		0	0		0
126005	Vancouver	WA	98661	2	\N	0	SemaCharge Network	45.615425	-122.65362	\N	J1772	FREE	US	0	0		0	0		0
127009	Seattle	WA	98101	2	\N	0	Blink Network	47.611702	-122.33341	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
127013	Seattle	WA	98121	2	\N	0	SemaCharge Network	47.616634	-122.349525	\N	J1772	FREE	US	0	0		0	0		0
127977	Bellevue	WA	98005	4	\N	0	SemaCharge Network	47.580635	-122.156456	\N	J1772	FREE	US	0	0		0	0		0
132978	Edmonds	WA	98020	1	\N	0	SemaCharge Network	47.812454	-122.375824	\N	J1772	$1.50/Hr Parking Fee	US	0	0		0	0		0
132979	Edmonds	WA	98020	1	\N	0	SemaCharge Network	47.812454	-122.375824	\N	J1772	$1.50/Hr Parking Fee	US	0	0		0	0		0
132980	Edmonds	WA	98020	1	\N	0	SemaCharge Network	47.810516	-122.37488	\N	J1772	$1.50/Hr Parking Fee	US	0	0		0	0		0
132981	Edmonds	WA	98020	1	\N	0	SemaCharge Network	47.811337	-122.37709	\N	J1772	$1.50/Hr Parking Fee	US	0	0		0	0		0
132982	Edmonds	WA	98020	1	\N	0	SemaCharge Network	47.80511	-122.381386	\N	J1772	$1.50/Hr Parking Fee	US	0	0		0	0		0
134010	Edmonds	WA	98020	1	\N	0	SemaCharge Network	47.80406	-122.37355	\N	J1772	$1.50/Hr Parking Fee	US	0	0		0	0		0
135872	Tacoma	WA	98405	1	\N	3	Electrify America	47.23947	-122.480255	\N	CHADEMO J1772 J1772COMBO	\N	US	3	1	min	0.25	0	min	0
136697	Yakima	WA	98901	0	\N	4	Electrify America	46.60252	-120.47924	\N	CHADEMO J1772COMBO	\N	US	3	1	min	0.25	0	min	0
137161	Vancouver	WA	98662	2	\N	0	Non-Networked	45.657696	-122.58189	2019-07-19	J1772	\N	US	0	0		0	0		0
137162	Vancouver	WA	98662	2	\N	0	Non-Networked	45.657375	-122.584785	2019-07-19	J1772	\N	US	0	0		0	0		0
137184	Seattle	WA	98101	0	\N	10	Tesla	47.610146	-122.33208	2019-07-19	TESLA	\N	US	4	0		0	0		0
137185	Seattle	WA	98102	4	\N	0	Non-Networked	47.610146	-122.33208	2019-07-19	J1772	\N	US	0	0		0	0		0
138537	Bellingham	WA	98229	0	\N	2	eVgo Network	48.74393	-122.46185	\N	CHADEMO J1772COMBO	\N	US	3	0	min	0.29	0	min	0
140503	Seattle	WA	98133	4	\N	0	SemaCharge Network	47.719986	-122.34409	\N	J1772	FREE	US	0	0		0	0		0
143152	Spokane Valley	WA	99016	0	\N	1	ChargePoint Network	47.66747	-117.14931	\N	J1772COMBO	Free	US	2	0	min	0	0	min	0
143206	Freeland	WA	98249	2	\N	0	ChargePoint Network	48.009823	-122.51769	\N	J1772	Free	US	0	0		0	0		0
143212	Lynnwood	WA	98037	0	\N	1	ChargePoint Network	47.828644	-122.310875	\N	J1772COMBO	Pricing is based on length of time and kWh used. $0 per hour, and $1 per additional hour, $0.16 per kWh	US	2	0	kwh	0.16	0	min	0.0167
143215	Fife	WA	98424	0	\N	1	ChargePoint Network	47.24293	-122.39677	\N	J1772COMBO	Pricing is based on length of time. $0.1 per hour for the first 2 hours, and $0.2 per additional hour	US	2	0	min	0	0	min	0.1
143268	Oak Harbor	WA	98277	2	\N	0	ChargePoint Network	48.309216	-122.641266	\N	J1772	Free	US	0	0		0	0		0
143281	Bellevue	WA	98004	2	\N	0	ChargePoint Network	47.611637	-122.210594	\N	J1772	Free	US	0	0		0	0		0
143313	Bellevue	WA	98005	0	\N	1	ChargePoint Network	47.630585	-122.15664	\N	J1772COMBO	Pricing is based on length of time and kWh used. $0 per hour, and $1 per additional hour, $0.16 per kWh	US	2	1	min	0	0	min	0
143334	Puyallup	WA	98374	2	\N	0	ChargePoint Network	47.155357	-122.28065	\N	J1772	Free	US	0	0		0	0		0
143335	Puyallup	WA	98374	7	\N	0	ChargePoint Network	47.155624	-122.280266	\N	J1772	Free	US	0	0		0	0		0
143369	Seattle	WA	98121	20	\N	0	ChargePoint Network	47.616833	-122.33908	\N	J1772	Free	US	0	0		0	0		0
143374	Lacey	WA	98516	0	\N	1	ChargePoint Network	47.061676	-122.77086	\N	J1772COMBO	Free	US	2	0	min	0	0	min	0
143397	Kirkland	WA	98033	10	\N	0	ChargePoint Network	47.677883	-122.19954	\N	J1772	Free	US	0	0		0	0		0
143416	Lakewood	WA	98499	2	\N	0	ChargePoint Network	47.1532	-122.50402	\N	J1772	$0.25 per kWh	US	0	0		0	0		0
143454	Vancouver	WA	98683	2	\N	0	ChargePoint Network	45.609303	-122.50048	\N	J1772	$0.35 per kWh	US	0	0		0	0		0
143504	Federal Way	WA	98003	5	\N	0	ChargePoint Network	47.31539	-122.307144	\N	J1772	Pricing is based on length of time. $2 per hour for the first 4 hours, and $5 per additional hour	US	0	0		0	0		0
143575	Seattle	WA	98115	2	\N	0	ChargePoint Network	47.678055	-122.31412	\N	J1772	$2 per kWh	US	0	0		0	0		0
143576	Aberdeen	WA	98520	1	\N	0	ChargePoint Network	46.975403	-123.83712	\N	J1772	Free	US	0	0		0	0		0
143670	Seattle	WA	98125	6	\N	0	ChargePoint Network	47.717846	-122.294304	\N	J1772	Free	US	0	0		0	0		0
143782	Orcas	WA	98280	2	\N	0	Non-Networked	48.599216	-122.94575	2017-10-31	CHADEMO J1772	Free	US	1	0		0	0		0
143835	Chehalis	WA	98532	2	\N	1	eVgo Network	46.67925	-122.97526	\N	CHADEMO J1772 J1772COMBO	\N	US	3	0	min	0.29	0	min	0
143863	Vancouver	WA	98684	2	\N	0	Non-Networked	45.616146	-122.497665	2019-08-19	J1772	\N	US	0	0		0	0		0
143867	Shelton	WA	98584	1	\N	0	Blink Network	47.37414	-123.15537	\N	J1772	Level 2: $0.45 per kWh	US	0	0		0	0		0
143885	Spokane	WA	99202	2	\N	0	ChargePoint Network	47.66805	-117.4063	\N	J1772	Pricing is based on length of time. $0 per hour for the first 4 hours, and $3 per additional hour	US	0	0		0	0		0
143939	Spokane	WA	99201	0	\N	2	Greenlots	47.663105	-117.40049	\N	CHADEMO J1772COMBO	DC Fast: $0.35 per kWh	US	3	0	kwh	0.35	0	min	0
143948	Seattle	WA	98101	4	\N	0	SemaCharge Network	47.61634	-122.333084	\N	J1772	FREE	US	0	0		0	0		0
143949	Tacoma	WA	98409	6	\N	0	SemaCharge Network	47.228302	-122.46755	\N	J1772	FREE	US	0	0		0	0		0
143969	DuPont	WA	98327	2	\N	4	eVgo Network	47.092583	-122.64426	\N	CHADEMO J1772 J1772COMBO	\N	US	3	0	min	0.29	0	min	0
143970	Everett	WA	98208	0	\N	10	Electrify America	47.913486	-122.21331	\N	CHADEMO J1772COMBO	\N	US	3	1	min	0.25	0	min	0
143971	Ritzville	WA	99169	0	\N	4	Electrify America	47.11948	-118.36271	\N	CHADEMO J1772COMBO	\N	US	3	1	min	0.25	0	min	0
143999	Lacey	WA	98516	1	\N	0	SemaCharge Network	47.056465	-122.75437	\N	J1772	FREE	US	0	0		0	0		0
144011	Everett	WA	98204	2	\N	0	ChargePoint Network	47.883446	-122.23748	\N	J1772	$0.035 per kWh	US	0	0		0	0		0
144074	Edmonds	WA	98026	0	\N	2	ChargePoint Network	47.778255	-122.34483	\N	CHADEMO J1772COMBO	$6 per session	US	3	6	min	0	0	min	0
144090	Vancouver	WA	98683	1	\N	3	Electrify America	45.617756	-122.47814	\N	CHADEMO J1772 J1772COMBO	\N	US	3	1	min	0.25	0	min	0
144104	Mercer Island	WA	98040	2	\N	0	ChargePoint Network	47.58578	-122.23328	\N	J1772	Pricing is based on an hourly rate. $0.5 per hour, minimum payment of $0.5, maximum payment of $9, maximum session time is 24 hours	US	0	0		0	0		0
144349	Bellevue	WA	98007	1	\N	0	Blink Network	47.5976	-122.142	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
144984	Seattle	WA	98188	0	\N	2	eVgo Network	47.450256	-122.299446	\N	CHADEMO J1772COMBO	\N	US	3	0	min	0.29	0	min	0
145104	Bothell	WA	98021	2	\N	0	SemaCharge Network	47.795395	-122.211655	\N	J1772	FREE	US	0	0		0	0		0
145130	Snoqualmie	WA	98065	1	\N	0	Blink Network	47.5326	-121.87315	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
145131	Port Townsend	WA	98368	1	\N	0	Blink Network	48.10697	-122.77999	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
145133	Bellevue	WA	98004	4	\N	0	SemaCharge Network	47.611008	-122.20216	\N	J1772	FREE	US	0	0		0	0		0
145151	Seattle	WA	98103	0	\N	2	ChargePoint Network	47.66547	-122.35029	\N	CHADEMO J1772COMBO	$0.2 per hour, minimum payment of $4.95, maximum payment of $20, $4.95 per session, maximum session time is 2 hours	US	3	4.95	min	0	0	min	0.2
145252	Olympia	WA	98502	2	\N	0	Non-Networked	47.042023	-122.93831	2019-09-01	J1772	Free	US	0	0		0	0		0
145253	Olympia	WA	98502	2	\N	0	Non-Networked	47.04259	-122.93647	2019-09-01	J1772	Free	US	0	0		0	0		0
145254	Olympia	WA	98502	2	\N	0	Non-Networked	47.04285	-122.93458	2019-09-01	J1772	Free	US	0	0		0	0		0
145255	Tukwila	WA	98188	4	\N	0	Non-Networked	47.459988	-122.25909	2019-09-01	J1772	Free	US	0	0		0	0		0
145256	Bellevue	WA	98006	2	\N	0	Non-Networked	47.578663	-122.17046	2019-09-01	J1772	Free	US	0	0		0	0		0
145257	Seattle	WA	98102	2	\N	0	Non-Networked	47.622047	-122.32161	2019-09-01	J1772	Free	US	0	0		0	0		0
145258	Seattle	WA	98107	2	\N	0	Non-Networked	47.662342	-122.37002	2019-09-01	J1772	Free	US	0	0		0	0		0
145259	Seattle	WA	98115	2	\N	0	Non-Networked	47.682587	-122.317184	2019-09-01	J1772	Free	US	0	0		0	0		0
145260	Seattle	WA	98133	2	\N	0	Non-Networked	47.701878	-122.34309	2019-09-01	J1772	Free	US	0	0		0	0		0
145261	Sammamish	WA	98074	2	\N	0	Non-Networked	47.6141	-122.03415	2019-09-01	J1772	Free	US	0	0		0	0		0
145262	Sammamish	WA	98075	2	\N	0	Non-Networked	47.583103	-122.0339	2019-09-01	J1772	Free	US	0	0		0	0		0
145263	Issaquah	WA	98029	2	\N	0	Non-Networked	47.543755	-122.01731	2019-09-01	J1772	Free	US	0	0		0	0		0
145264	Silverdale	WA	98383	2	\N	0	Non-Networked	47.65698	-122.69214	2019-09-01	J1772	Free	US	0	0		0	0		0
145265	Silverdale	WA	98383	2	\N	0	Non-Networked	47.65881	-122.68875	2019-09-01	J1772	Free	US	0	0		0	0		0
145390	Seattle	WA	98101	10	\N	0	ChargePoint Network	47.616856	-122.33398	\N	J1772	Free	US	0	0		0	0		0
145586	Connell	WA	99326	0	\N	2	Greenlots	46.660126	-118.86118	\N	CHADEMO J1772COMBO	DC Fast: $21.00 per hour	US	3	0	min	0.35	0	min	0
145637	Seattle	WA	98102	6	\N	0	Tesla Destination	47.610146	-122.33208	2019-07-23	TESLA	Free	US	4	0		0	0		0
145684	Lake Stevens	WA	98258	1	\N	6	Electrify America	47.998234	-122.10064	\N	CHADEMO J1772 J1772COMBO	\N	US	3	1	min	0.25	0	min	0
145686	Port Orchard	WA	98366	2	\N	0	Non-Networked	47.542744	-122.63745	2019-09-01	J1772	Free	US	0	0		0	0		0
145687	Gig Harbor	WA	98335	1	\N	0	Non-Networked	47.30604	-122.58106	2019-09-01	J1772	Free	US	0	0		0	0		0
145695	Bremerton	WA	98337	2	\N	0	Non-Networked	47.567585	-122.64072	2019-09-01	J1772	Free	US	0	0		0	0		0
146682	Everett	WA	98201	4	\N	0	SemaCharge Network	48.000004	-122.214645	\N	J1772	$1.35/Hr Parking Fee	US	0	0		0	0		0
146804	Renton	WA	98057	0	\N	1	ChargePoint Network	47.44638	-122.219666	\N	J1772COMBO	Pricing is based on length of time and kWh used. $0 per hour for the first 1 hour, and $0.1 per additional hour, $0.1 per kWh	US	2	0	kwh	0.1	0	min	0
146906	Mead	WA	99005	1	\N	0	Greenlots	47.790718	-117.354126	\N	J1772	Level 2: Free	US	0	0		0	0		0
146907	Spokane	WA	99216	1	\N	0	Greenlots	47.66803	-117.18379	\N	J1772	Level 2: Free	US	0	0		0	0		0
146948	Seattle	WA	98125	1	\N	3	Electrify America	47.708458	-122.32489	\N	CHADEMO J1772 J1772COMBO	\N	US	3	1	min	0.25	0	min	0
146959	Blaine	WA	98230	0	\N	14	Tesla	48.937824	-122.66767	2019-10-01	TESLA	Free	US	4	0		0	0		0
146966	Vancouver	WA	98661	2	\N	0	ChargePoint Network	45.628178	-122.66003	\N	J1772	$0.15 per kWh	US	0	0		0	0		0
146967	Vancouver	WA	98662	2	\N	0	ChargePoint Network	45.685204	-122.55494	\N	J1772	$0.15 per kWh	US	0	0		0	0		0
147015	Sequim	WA	98382	2	\N	0	SemaCharge Network	48.079887	-123.097496	\N	J1772	FREE	US	0	0		0	0		0
147033	Bellevue	WA	98007	2	\N	0	Blink Network	47.61152	-122.1822	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
147069	Kent	WA	98030	2	\N	0	ChargePoint Network	47.380592	-122.19517	\N	J1772	Pricing is based on length of time and kWh used. $0 per hour for the first 4 hours, and $5 per additional hour, $0.09 per kWh	US	0	0		0	0		0
147070	Kent	WA	98030	2	\N	0	ChargePoint Network	47.38073	-122.19693	\N	J1772	Pricing is based on length of time and kWh used. $0 per hour for the first 4 hours, and $5 per additional hour, $0.09 per kWh	US	0	0		0	0		0
147072	Kent	WA	98030	2	\N	0	ChargePoint Network	47.380135	-122.196106	\N	J1772	Pricing is based on length of time and kWh used. $0 per hour for the first 4 hours, and $5 per additional hour, $0.09 per kWh	US	0	0		0	0		0
147075	Marysville	WA	98271	2	\N	0	ChargePoint Network	48.142735	-122.18377	\N	J1772	$0.07 per kWh	US	0	0		0	0		0
147131	Tukwila	WA	98188	0	\N	5	Electrify America	47.45571	-122.25738	\N	CHADEMO J1772COMBO	\N	US	3	0		0	0		0
147146	Tacoma	WA	98405	3	\N	0	ChargePoint Network	47.249584	-122.45284	\N	J1772	Free	US	0	0		0	0		0
147175	Lacey	WA	98503	2	\N	0	SemaCharge Network	47.000134	-122.82801	\N	J1772	FREE	US	0	0		0	0		0
147222	Vancouver	WA	98663	1	\N	0	ChargePoint Network	45.630035	-122.663445	\N	J1772	$0.15 per kWh	US	0	0		0	0		0
147227	Issaquah	WA	98027	1	\N	3	Electrify America	47.541874	-122.05203	\N	CHADEMO J1772 J1772COMBO	\N	US	3	0		0	0		0
147301	Bellevue	WA	98004	6	\N	0	ChargePoint Network	47.618607	-122.191795	\N	J1772	$2.25 per hour	US	0	0		0	0		0
147319	Auburn	WA	98001	0	\N	10	Tesla	47.297894	-122.2487	2019-10-19	TESLA	Free	US	4	0		0	0		0
147397	Seattle	WA	98109	2	\N	0	ChargePoint Network	47.622574	-122.33548	\N	J1772	Pricing is based on length of time. $1 per hour for the first 2 hours, and $1.5 per additional hour	US	0	0		0	0		0
147402	Seattle	WA	98119	2	\N	0	ChargePoint Network	47.628914	-122.37425	\N	J1772	$0.18 per kWh	US	0	0		0	0		0
147419	Renton	WA	98056	2	\N	0	Blink Network	47.490086	-122.17574	\N	J1772	Level 2: $0.49 per kWh	US	0	0		0	0		0
147420	Mukilteo	WA	98275	2	\N	0	SemaCharge Network	47.948757	-122.3062	\N	J1772	FREE	US	0	0		0	0		0
147432	Mercer Island	WA	98040	2	\N	0	ChargePoint Network	47.585808	-122.23324	\N	J1772	$1.5 per hour, maximum payment of $9	US	0	0		0	0		0
\.


-- Completed on 2020-08-06 14:22:00 PDT

--
-- PostgreSQL database dump complete
--

