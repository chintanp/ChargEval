--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3 (Ubuntu 12.3-1.pgdg20.04+1)

-- Started on 2020-08-06 12:06:06 PDT

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
-- TOC entry 659 (class 1255 OID 18499)
-- Name: notify_new_order(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.notify_new_order() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
        PERFORM pg_notify('new_order', row_to_json(NEW)::text);
        RETURN NULL;
    END; 
$$;


--
-- TOC entry 897 (class 1255 OID 18737)
-- Name: sp_len(integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.sp_len(orig integer, dest integer) RETURNS TABLE(shortest_path_length double precision)
    LANGUAGE sql ROWS 1
    AS $$   
 
 SELECT st_length(st_collect(geom)::geography) * 0.000621371 as shortest_path_length -- Convert length to miles
 FROM pgr_dijkstra(
    'SELECT id, source, target, st_length(geom, true) as cost FROM public."WA_roads"',
    (SELECT source FROM public."WA_roads"
     ORDER BY ST_StartPoint(geom) <->
         (select ST_SetSRID(ST_MakePoint(CAST(longitude as double precision), CAST(latitude as double precision)), 4326) from zipcode_record where zip = CAST(orig as text) LIMIT 1) ASC
    LIMIT 1),
    (SELECT source FROM public."WA_roads"
     ORDER BY ST_StartPoint(geom) <->
         (select ST_SetSRID(ST_MakePoint(CAST(longitude as double precision), CAST(latitude as double precision)), 4326) from zipcode_record where zip = CAST(dest as text) LIMIT 1) ASC
    LIMIT 1), directed := false
 ) as pt
 JOIN public."WA_roads" rd ON pt.edge = rd.id;
 
 $$;


--
-- TOC entry 898 (class 1255 OID 18738)
-- Name: sp_od2(integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.sp_od2(orig integer, dest integer) RETURNS TABLE(shortest_path public.geometry)
    LANGUAGE sql ROWS 1
    AS $$ 

  select st_makeline((case when node = source then geom else ST_Reverse(geom) end))  FROM pgr_dijkstra(
    'SELECT id, source, target, st_length(geom) as cost FROM public."WA_roads"',
    (SELECT source FROM public."WA_roads"
     ORDER BY ST_StartPoint(geom) <->
         (select ST_SetSRID(ST_MakePoint(CAST(longitude as double precision), CAST(latitude as double precision)), 4326) from zipcode_record where zip = CAST(orig as text) LIMIT 1) ASC
    LIMIT 1),
    (SELECT source FROM public."WA_roads"
     ORDER BY ST_StartPoint(geom) <->
         (select ST_SetSRID(ST_MakePoint(CAST(longitude as double precision), CAST(latitude as double precision)), 4326) from zipcode_record where zip = CAST(dest as text) LIMIT 1) ASC
    LIMIT 1), directed := false
 ) as sp
 JOIN public."WA_roads" rd ON sp.edge = rd.id;
 $$;


--
-- TOC entry 1186 (class 1255 OID 19037)
-- Name: st_forceclosed(public.geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.st_forceclosed(geom public.geometry) RETURNS public.geometry
    LANGUAGE plpgsql IMMUTABLE COST 42
    AS $$BEGIN
   IF ST_IsClosed(geom) THEN
     RETURN geom;
   ELSIF GeometryType(geom) = 'LINESTRING' THEN
     SELECT ST_AddPoint(geom, ST_StartPoint(geom)) INTO geom;
   ELSIF GeometryType(geom) ~ '(MULTI|COLLECTION)' THEN
     WITH parts AS (
       SELECT ST_ForceClosed(gd.geom) AS closed_geom FROM ST_Dump(geom) AS gd
     ) -- Reconstitute parts
     SELECT ST_Collect(closed_geom) INTO geom
     FROM parts;
   END IF;
   IF NOT ST_IsClosed(geom) THEN
     RAISE EXCEPTION 'Could not close geometry';
   END IF;
   RETURN geom;
 END;$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 26380)
-- Name: WA_roads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WA_roads" (
    id integer NOT NULL,
    geom public.geometry(LineString,4326),
    spd character varying(80),
    source integer,
    target integer,
    trip_count_chademo integer DEFAULT 0,
    od_pairs_chademo text DEFAULT ' '::text,
    trip_count_combo integer DEFAULT 0,
    od_pairs_combo text DEFAULT ' '::text
);


--
-- TOC entry 223 (class 1259 OID 26390)
-- Name: WA_roads_vertices_pgr; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WA_roads_vertices_pgr" (
    id bigint NOT NULL,
    cnt integer,
    chk integer,
    ein integer,
    eout integer,
    the_geom public.geometry(Point,4326)
);


--
-- TOC entry 224 (class 1259 OID 26396)
-- Name: WA_roads_vertices_pgr_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."WA_roads_vertices_pgr_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5732 (class 0 OID 0)
-- Dependencies: 224
-- Name: WA_roads_vertices_pgr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."WA_roads_vertices_pgr_id_seq" OWNED BY public."WA_roads_vertices_pgr".id;


--
-- TOC entry 225 (class 1259 OID 26398)
-- Name: analysis_record; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.analysis_record (
    analysis_id integer NOT NULL,
    user_id text NOT NULL,
    sim_date_time text NOT NULL,
    status text NOT NULL,
    include_tesla boolean
);


--
-- TOC entry 226 (class 1259 OID 26404)
-- Name: analysis_record_analysis_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.analysis_record_analysis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5733 (class 0 OID 0)
-- Dependencies: 226
-- Name: analysis_record_analysis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.analysis_record_analysis_id_seq OWNED BY public.analysis_record.analysis_id;


--
-- TOC entry 227 (class 1259 OID 26406)
-- Name: built_evse; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.built_evse (
    bevse_id real,
    city text,
    state text,
    zip real,
    level2_count real,
    level1_count real,
    dcfc_count real,
    ev_network text,
    latitude real,
    longitude real,
    open_date date,
    ev_connector_types text,
    ev_pricing text,
    country text,
    connector_code real,
    dcfc_fixed_charging_price real,
    dcfc_var_charging_price_unit text,
    dcfc_var_charging_price real,
    dcfc_fixed_parking_price real,
    dcfc_var_parking_price_unit text,
    dcfc_var_parking_price real
);


--
-- TOC entry 228 (class 1259 OID 26412)
-- Name: dest_charger; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dest_charger (
    analysis_id integer NOT NULL,
    zip integer NOT NULL,
    dc_chademo boolean,
    dc_combo boolean,
    dc_level2 boolean
);


--
-- TOC entry 229 (class 1259 OID 26415)
-- Name: ev_finished; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ev_finished (
    fin_id integer NOT NULL,
    fin_ts text NOT NULL,
    veh_id text NOT NULL,
    origin_zip integer NOT NULL,
    destination_zip integer NOT NULL,
    analysis_id integer NOT NULL,
    trip_distance numeric NOT NULL,
    distance_travelled numeric NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 26421)
-- Name: ev_finished_fin_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ev_finished_fin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5734 (class 0 OID 0)
-- Dependencies: 230
-- Name: ev_finished_fin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ev_finished_fin_id_seq OWNED BY public.ev_finished.fin_id;


--
-- TOC entry 231 (class 1259 OID 26423)
-- Name: ev_info; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ev_info (
    info_id bigint NOT NULL,
    simulation_ts text NOT NULL,
    analysis_id integer NOT NULL,
    veh_id text NOT NULL,
    lat_val double precision NOT NULL,
    lng_val double precision NOT NULL,
    soc_val numeric NOT NULL,
    prob_val numeric NOT NULL,
    state_val text NOT NULL,
    tocharge_val boolean NOT NULL,
    speed_val numeric NOT NULL,
    nearest_evse_id text,
    chargers_nearby text,
    nearest_evses text,
    charging_decision_time text
);


--
-- TOC entry 232 (class 1259 OID 26429)
-- Name: ev_info_info_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ev_info_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5735 (class 0 OID 0)
-- Dependencies: 232
-- Name: ev_info_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ev_info_info_id_seq OWNED BY public.ev_info.info_id;


--
-- TOC entry 233 (class 1259 OID 26431)
-- Name: ev_stranded; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ev_stranded (
    stranded_id integer NOT NULL,
    stranded_ts text NOT NULL,
    veh_id text NOT NULL,
    stranded_lat double precision NOT NULL,
    stranded_lng double precision NOT NULL,
    origin_zip integer NOT NULL,
    destination_zip integer NOT NULL,
    analysis_id integer NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 26437)
-- Name: ev_stranded_stranded_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ev_stranded_stranded_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5736 (class 0 OID 0)
-- Dependencies: 234
-- Name: ev_stranded_stranded_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ev_stranded_stranded_id_seq OWNED BY public.ev_stranded.stranded_id;


--
-- TOC entry 235 (class 1259 OID 26439)
-- Name: evse_charging_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.evse_charging_session (
    cs_id integer NOT NULL,
    charge_start_time text NOT NULL,
    charge_end_time text NOT NULL,
    veh_id text NOT NULL,
    starting_soc numeric NOT NULL,
    ending_soc numeric NOT NULL,
    evse_id text NOT NULL,
    analysis_id integer NOT NULL
);


--
-- TOC entry 236 (class 1259 OID 26445)
-- Name: evse_charging_session_cs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.evse_charging_session_cs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5737 (class 0 OID 0)
-- Dependencies: 236
-- Name: evse_charging_session_cs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.evse_charging_session_cs_id_seq OWNED BY public.evse_charging_session.cs_id;


--
-- TOC entry 237 (class 1259 OID 26447)
-- Name: evse_evs_passed; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.evse_evs_passed (
    pass_id integer NOT NULL,
    simulation_ts text NOT NULL,
    evse_id text NOT NULL,
    veh_id text NOT NULL,
    soc_val numeric NOT NULL,
    analysis_id integer NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 26453)
-- Name: evse_evs_passed_pass_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.evse_evs_passed_pass_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5738 (class 0 OID 0)
-- Dependencies: 238
-- Name: evse_evs_passed_pass_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.evse_evs_passed_pass_id_seq OWNED BY public.evse_evs_passed.pass_id;


--
-- TOC entry 239 (class 1259 OID 26455)
-- Name: evse_evs_waiting; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.evse_evs_waiting (
    wait_id integer NOT NULL,
    wait_start_time text,
    wait_end_time text,
    veh_id text,
    soc_val numeric,
    evse_id text,
    analysis_id integer,
    evs_waiting text
);


--
-- TOC entry 240 (class 1259 OID 26461)
-- Name: evse_evs_waiting_wait_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.evse_evs_waiting_wait_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5739 (class 0 OID 0)
-- Dependencies: 240
-- Name: evse_evs_waiting_wait_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.evse_evs_waiting_wait_id_seq OWNED BY public.evse_evs_waiting.wait_id;


--
-- TOC entry 241 (class 1259 OID 26463)
-- Name: evse_power_draw; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.evse_power_draw (
    pd_id integer NOT NULL,
    simulation_ts text NOT NULL,
    evse_id text NOT NULL,
    analysis_id integer,
    power_val integer NOT NULL
);


--
-- TOC entry 242 (class 1259 OID 26469)
-- Name: evse_power_draw_pd_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.evse_power_draw_pd_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5740 (class 0 OID 0)
-- Dependencies: 242
-- Name: evse_power_draw_pd_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.evse_power_draw_pd_id_seq OWNED BY public.evse_power_draw.pd_id;


--
-- TOC entry 243 (class 1259 OID 26471)
-- Name: evse_util; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.evse_util (
    util_id integer NOT NULL,
    analysis_id integer NOT NULL,
    evse_id text NOT NULL,
    util_val numeric NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 26477)
-- Name: evse_util_util_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.evse_util_util_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5741 (class 0 OID 0)
-- Dependencies: 244
-- Name: evse_util_util_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.evse_util_util_id_seq OWNED BY public.evse_util.util_id;


--
-- TOC entry 245 (class 1259 OID 26479)
-- Name: evtrip_scenarios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.evtrip_scenarios (
    evtrip_id integer NOT NULL,
    analysis_id integer NOT NULL,
    simulated_date text NOT NULL,
    veh_id text NOT NULL,
    origin_zip integer NOT NULL,
    destination_zip integer NOT NULL,
    soc numeric NOT NULL,
    trip_start_time text NOT NULL
);


--
-- TOC entry 246 (class 1259 OID 26485)
-- Name: evtrip_scenarios_evtrip_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.evtrip_scenarios_evtrip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5742 (class 0 OID 0)
-- Dependencies: 246
-- Name: evtrip_scenarios_evtrip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.evtrip_scenarios_evtrip_id_seq OWNED BY public.evtrip_scenarios.evtrip_id;


--
-- TOC entry 247 (class 1259 OID 26487)
-- Name: nevse1; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.nevse1 AS
 SELECT row_number() OVER () AS row_number,
    public.st_setsrid(public.st_makepoint(('-121.4146'::numeric)::double precision, (47.82791)::double precision), 4326) AS st_setsrid;


--
-- TOC entry 248 (class 1259 OID 26491)
-- Name: new_evses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.new_evses (
    nevse_id integer NOT NULL,
    analysis_id integer NOT NULL,
    input_evse_id integer NOT NULL,
    trip_count integer,
    od_pairs text,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    dcfc_plug_count integer NOT NULL,
    dcfc_power integer NOT NULL,
    level2_plug_count integer NOT NULL,
    level2_power numeric NOT NULL,
    dcfc_fixed_charging_price numeric,
    dcfc_var_charging_price_unit text,
    dcfc_var_charging_price numeric,
    dcfc_fixed_parking_price numeric,
    dcfc_var_parking_price_unit text,
    dcfc_var_parking_price numeric,
    level2_fixed_charging_price numeric,
    level2_var_charging_price_unit text,
    level2_var_charging_price numeric,
    level2_fixed_parking_price numeric,
    level2_var_parking_price_unit text,
    level2_var_parking_price numeric,
    connector_code integer
);


--
-- TOC entry 249 (class 1259 OID 26497)
-- Name: new_evses_nevse_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.new_evses_nevse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5743 (class 0 OID 0)
-- Dependencies: 249
-- Name: new_evses_nevse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.new_evses_nevse_id_seq OWNED BY public.new_evses.nevse_id;


--
-- TOC entry 250 (class 1259 OID 26499)
-- Name: od_cd; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.od_cd (
    origin integer NOT NULL,
    destination integer NOT NULL,
    cd_chademo double precision,
    cd_combo double precision,
    analysis_id integer NOT NULL,
    cd_chademo_geog public.geography,
    cd_combo_geog public.geography
);


--
-- TOC entry 251 (class 1259 OID 26505)
-- Name: od_sp; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.od_sp (
    origin integer NOT NULL,
    destination integer NOT NULL,
    shortest_path_length double precision
);


--
-- TOC entry 252 (class 1259 OID 26508)
-- Name: sp047651; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.sp047651 AS
 SELECT row_number() OVER () AS row_number,
    public.sp_od2(98047, 98651) AS sp_od2;


--
-- TOC entry 253 (class 1259 OID 26512)
-- Name: sp156; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.sp156 AS
 SELECT row_number() OVER () AS row_number,
    sp_od2.shortest_path
   FROM public.sp_od2(98250, 99156) sp_od2(shortest_path);


--
-- TOC entry 254 (class 1259 OID 26516)
-- Name: table_stats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.table_stats (
    table_id integer NOT NULL,
    table_name text,
    last_updated text
);


--
-- TOC entry 255 (class 1259 OID 26522)
-- Name: table_stats_table_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.table_stats_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5744 (class 0 OID 0)
-- Dependencies: 255
-- Name: table_stats_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.table_stats_table_id_seq OWNED BY public.table_stats.table_id;


--
-- TOC entry 256 (class 1259 OID 26524)
-- Name: user_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_details (
    user_id text NOT NULL,
    user_name text,
    email_id text,
    last_submit_date text
);


--
-- TOC entry 257 (class 1259 OID 26530)
-- Name: wa_bevs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wa_bevs (
    county text,
    city text,
    state text,
    zip_code integer,
    model_year integer,
    make text,
    model text,
    electric_range integer,
    base_msrp real,
    legislative_district real,
    veh_id text,
    range_fe real,
    capacity real,
    fuel_consumption real,
    connector_code real
);


--
-- TOC entry 258 (class 1259 OID 26536)
-- Name: wa_evtrips; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wa_evtrips (
    destination real,
    origin real,
    ocars real,
    dcars real,
    ret real,
    dep real,
    oevs real,
    devs real,
    oevs_no_tesla integer,
    devs_no_tesla integer
);


--
-- TOC entry 259 (class 1259 OID 26539)
-- Name: wa_gas_prices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wa_gas_prices (
    zip text,
    avg_gas_price real
);


--
-- TOC entry 260 (class 1259 OID 26545)
-- Name: wa_long_distance_passenger_trips; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wa_long_distance_passenger_trips (
    ldtrip_id integer NOT NULL,
    origin_zip integer NOT NULL,
    destination_zip integer NOT NULL,
    ldtrip_count integer NOT NULL
);


--
-- TOC entry 261 (class 1259 OID 26548)
-- Name: wa_long_distance_passenger_trips_ldtrip_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wa_long_distance_passenger_trips_ldtrip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5745 (class 0 OID 0)
-- Dependencies: 261
-- Name: wa_long_distance_passenger_trips_ldtrip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wa_long_distance_passenger_trips_ldtrip_id_seq OWNED BY public.wa_long_distance_passenger_trips.ldtrip_id;


--
-- TOC entry 262 (class 1259 OID 26550)
-- Name: wa_state_boundary; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wa_state_boundary (
    id integer NOT NULL,
    geom public.geometry(MultiPolygon,4326),
    objectid bigint,
    shapearea numeric,
    shapelen numeric,
    jurisdict_ bigint,
    jurisdic_1 character varying(80),
    jurisdic_2 character varying(80),
    jurisdic_3 character varying(80),
    jurisdic_4 bigint,
    jurisdic_5 bigint,
    jurisdic_6 character varying(80),
    edit_date character varying(80),
    edit_statu character varying(80),
    edit_who character varying(80)
);


--
-- TOC entry 263 (class 1259 OID 26556)
-- Name: wa_state_boundary_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wa_state_boundary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5746 (class 0 OID 0)
-- Dependencies: 263
-- Name: wa_state_boundary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wa_state_boundary_id_seq OWNED BY public.wa_state_boundary.id;


--
-- TOC entry 264 (class 1259 OID 26558)
-- Name: wa_trip_inf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wa_trip_inf (
    road_id integer NOT NULL,
    analysis_id integer NOT NULL,
    trip_count_chademo integer DEFAULT 0 NOT NULL,
    od_pairs_chademo text DEFAULT ' '::text NOT NULL,
    trip_count_combo integer DEFAULT 0 NOT NULL,
    od_pairs_combo text DEFAULT ' '::text NOT NULL
);


--
-- TOC entry 265 (class 1259 OID 26568)
-- Name: zipcode_record; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.zipcode_record (
    zip text NOT NULL,
    city text,
    state text NOT NULL,
    latitude double precision,
    longitude double precision
);


--
-- TOC entry 5504 (class 2604 OID 19835)
-- Name: WA_roads_vertices_pgr id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WA_roads_vertices_pgr" ALTER COLUMN id SET DEFAULT nextval('public."WA_roads_vertices_pgr_id_seq"'::regclass);


--
-- TOC entry 5505 (class 2604 OID 19836)
-- Name: analysis_record analysis_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.analysis_record ALTER COLUMN analysis_id SET DEFAULT nextval('public.analysis_record_analysis_id_seq'::regclass);


--
-- TOC entry 5506 (class 2604 OID 19837)
-- Name: ev_finished fin_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ev_finished ALTER COLUMN fin_id SET DEFAULT nextval('public.ev_finished_fin_id_seq'::regclass);


--
-- TOC entry 5507 (class 2604 OID 19838)
-- Name: ev_info info_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ev_info ALTER COLUMN info_id SET DEFAULT nextval('public.ev_info_info_id_seq'::regclass);


--
-- TOC entry 5508 (class 2604 OID 19839)
-- Name: ev_stranded stranded_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ev_stranded ALTER COLUMN stranded_id SET DEFAULT nextval('public.ev_stranded_stranded_id_seq'::regclass);


--
-- TOC entry 5509 (class 2604 OID 19840)
-- Name: evse_charging_session cs_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_charging_session ALTER COLUMN cs_id SET DEFAULT nextval('public.evse_charging_session_cs_id_seq'::regclass);


--
-- TOC entry 5510 (class 2604 OID 19841)
-- Name: evse_evs_passed pass_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_evs_passed ALTER COLUMN pass_id SET DEFAULT nextval('public.evse_evs_passed_pass_id_seq'::regclass);


--
-- TOC entry 5511 (class 2604 OID 19842)
-- Name: evse_evs_waiting wait_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_evs_waiting ALTER COLUMN wait_id SET DEFAULT nextval('public.evse_evs_waiting_wait_id_seq'::regclass);


--
-- TOC entry 5512 (class 2604 OID 19843)
-- Name: evse_power_draw pd_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_power_draw ALTER COLUMN pd_id SET DEFAULT nextval('public.evse_power_draw_pd_id_seq'::regclass);


--
-- TOC entry 5513 (class 2604 OID 19844)
-- Name: evse_util util_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_util ALTER COLUMN util_id SET DEFAULT nextval('public.evse_util_util_id_seq'::regclass);


--
-- TOC entry 5514 (class 2604 OID 19845)
-- Name: evtrip_scenarios evtrip_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evtrip_scenarios ALTER COLUMN evtrip_id SET DEFAULT nextval('public.evtrip_scenarios_evtrip_id_seq'::regclass);


--
-- TOC entry 5515 (class 2604 OID 19846)
-- Name: new_evses nevse_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.new_evses ALTER COLUMN nevse_id SET DEFAULT nextval('public.new_evses_nevse_id_seq'::regclass);


--
-- TOC entry 5516 (class 2604 OID 19847)
-- Name: table_stats table_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.table_stats ALTER COLUMN table_id SET DEFAULT nextval('public.table_stats_table_id_seq'::regclass);


--
-- TOC entry 5517 (class 2604 OID 19848)
-- Name: wa_long_distance_passenger_trips ldtrip_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wa_long_distance_passenger_trips ALTER COLUMN ldtrip_id SET DEFAULT nextval('public.wa_long_distance_passenger_trips_ldtrip_id_seq'::regclass);


--
-- TOC entry 5518 (class 2604 OID 19849)
-- Name: wa_state_boundary id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wa_state_boundary ALTER COLUMN id SET DEFAULT nextval('public.wa_state_boundary_id_seq'::regclass);


--
-- TOC entry 5526 (class 2606 OID 19850)
-- Name: WA_roads WA_roads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WA_roads"
    ADD CONSTRAINT "WA_roads_pkey" PRIMARY KEY (id);


--
-- TOC entry 5531 (class 2606 OID 19851)
-- Name: WA_roads_vertices_pgr WA_roads_vertices_pgr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WA_roads_vertices_pgr"
    ADD CONSTRAINT "WA_roads_vertices_pgr_pkey" PRIMARY KEY (id);


--
-- TOC entry 5534 (class 2606 OID 19852)
-- Name: analysis_record analysis_record_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.analysis_record
    ADD CONSTRAINT analysis_record_pkey PRIMARY KEY (analysis_id);


--
-- TOC entry 5536 (class 2606 OID 19853)
-- Name: dest_charger dest_charger_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dest_charger
    ADD CONSTRAINT dest_charger_pkey PRIMARY KEY (analysis_id, zip);


--
-- TOC entry 5538 (class 2606 OID 19854)
-- Name: ev_finished ev_finished_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ev_finished
    ADD CONSTRAINT ev_finished_pkey PRIMARY KEY (fin_id);


--
-- TOC entry 5540 (class 2606 OID 19855)
-- Name: ev_info ev_info_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ev_info
    ADD CONSTRAINT ev_info_pkey PRIMARY KEY (info_id);


--
-- TOC entry 5543 (class 2606 OID 19856)
-- Name: ev_stranded ev_stranded_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ev_stranded
    ADD CONSTRAINT ev_stranded_pkey PRIMARY KEY (stranded_id);


--
-- TOC entry 5545 (class 2606 OID 19857)
-- Name: evse_charging_session evse_charging_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_charging_session
    ADD CONSTRAINT evse_charging_session_pkey PRIMARY KEY (cs_id);


--
-- TOC entry 5547 (class 2606 OID 19858)
-- Name: evse_evs_passed evse_evs_passed_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_evs_passed
    ADD CONSTRAINT evse_evs_passed_pkey PRIMARY KEY (pass_id);


--
-- TOC entry 5549 (class 2606 OID 19859)
-- Name: evse_evs_waiting evse_evs_waiting_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_evs_waiting
    ADD CONSTRAINT evse_evs_waiting_pkey PRIMARY KEY (wait_id);


--
-- TOC entry 5551 (class 2606 OID 19860)
-- Name: evse_power_draw evse_power_draw_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_power_draw
    ADD CONSTRAINT evse_power_draw_pkey PRIMARY KEY (pd_id);


--
-- TOC entry 5554 (class 2606 OID 19861)
-- Name: evse_util evse_util_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_util
    ADD CONSTRAINT evse_util_pkey PRIMARY KEY (util_id);


--
-- TOC entry 5556 (class 2606 OID 19862)
-- Name: evtrip_scenarios evtrip_scenarios_analysis_id_veh_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evtrip_scenarios
    ADD CONSTRAINT evtrip_scenarios_analysis_id_veh_id_key UNIQUE (analysis_id, veh_id);


--
-- TOC entry 5558 (class 2606 OID 19863)
-- Name: evtrip_scenarios evtrip_scenarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evtrip_scenarios
    ADD CONSTRAINT evtrip_scenarios_pkey PRIMARY KEY (evtrip_id);


--
-- TOC entry 5560 (class 2606 OID 19864)
-- Name: new_evses new_evses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.new_evses
    ADD CONSTRAINT new_evses_pkey PRIMARY KEY (nevse_id);


--
-- TOC entry 5562 (class 2606 OID 19865)
-- Name: od_cd od_cd_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.od_cd
    ADD CONSTRAINT od_cd_pkey PRIMARY KEY (origin, destination, analysis_id);


--
-- TOC entry 5566 (class 2606 OID 19866)
-- Name: od_sp od_sp_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.od_sp
    ADD CONSTRAINT od_sp_pkey PRIMARY KEY (origin, destination);


--
-- TOC entry 5568 (class 2606 OID 19868)
-- Name: table_stats table_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.table_stats
    ADD CONSTRAINT table_stats_pkey PRIMARY KEY (table_id);


--
-- TOC entry 5570 (class 2606 OID 19869)
-- Name: table_stats table_stats_table_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.table_stats
    ADD CONSTRAINT table_stats_table_name_key UNIQUE (table_name);


--
-- TOC entry 5572 (class 2606 OID 19870)
-- Name: user_details user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_details
    ADD CONSTRAINT user_details_pkey PRIMARY KEY (user_id);


--
-- TOC entry 5574 (class 2606 OID 19871)
-- Name: wa_long_distance_passenger_trips wa_long_distance_passenger_trips_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wa_long_distance_passenger_trips
    ADD CONSTRAINT wa_long_distance_passenger_trips_pkey PRIMARY KEY (ldtrip_id);


--
-- TOC entry 5576 (class 2606 OID 19872)
-- Name: wa_state_boundary wa_state_boundary_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wa_state_boundary
    ADD CONSTRAINT wa_state_boundary_pkey PRIMARY KEY (id);


--
-- TOC entry 5578 (class 2606 OID 19873)
-- Name: wa_trip_inf wa_trip_inf_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wa_trip_inf
    ADD CONSTRAINT wa_trip_inf_pkey PRIMARY KEY (road_id, analysis_id);


--
-- TOC entry 5580 (class 2606 OID 19874)
-- Name: zipcode_record zipcode_record_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zipcode_record
    ADD CONSTRAINT zipcode_record_pkey PRIMARY KEY (zip);


--
-- TOC entry 5532 (class 1259 OID 891447)
-- Name: WA_roads_vertices_pgr_the_geom_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "WA_roads_vertices_pgr_the_geom_idx" ON public."WA_roads_vertices_pgr" USING gist (the_geom);


--
-- TOC entry 5552 (class 1259 OID 891448)
-- Name: idx_aid_evseid_evsepd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aid_evseid_evsepd ON public.evse_power_draw USING btree (analysis_id, evse_id);


--
-- TOC entry 5541 (class 1259 OID 891449)
-- Name: idx_aid_vid_evinfo; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aid_vid_evinfo ON public.ev_info USING btree (analysis_id, veh_id);


--
-- TOC entry 5563 (class 1259 OID 891451)
-- Name: sidx_cd_chademo_geog__od_cd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_cd_chademo_geog__od_cd ON public.od_cd USING gist (cd_chademo_geog);

ALTER TABLE public.od_cd CLUSTER ON sidx_cd_chademo_geog__od_cd;


--
-- TOC entry 5564 (class 1259 OID 891452)
-- Name: sidx_cd_combo_geog__od_cd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_cd_combo_geog__od_cd ON public.od_cd USING gist (cd_combo_geog);


--
-- TOC entry 5527 (class 1259 OID 891453)
-- Name: sidx_geom__wa_roads; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_geom__wa_roads ON public."WA_roads" USING gist (geom);


--
-- TOC entry 5528 (class 1259 OID 891454)
-- Name: sidx_source__wa_roads; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_source__wa_roads ON public."WA_roads" USING btree (source);


--
-- TOC entry 5529 (class 1259 OID 891455)
-- Name: sidx_target__wa_roads; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_target__wa_roads ON public."WA_roads" USING btree (target);


--
-- TOC entry 5588 (class 2620 OID 19878)
-- Name: analysis_record notify_new_order; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER notify_new_order AFTER INSERT ON public.analysis_record FOR EACH ROW EXECUTE FUNCTION public.notify_new_order();


--
-- TOC entry 5581 (class 2606 OID 19879)
-- Name: ev_finished ev_finished_analysis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ev_finished
    ADD CONSTRAINT ev_finished_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES public.analysis_record(analysis_id);


--
-- TOC entry 5582 (class 2606 OID 19884)
-- Name: ev_info ev_info_analysis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ev_info
    ADD CONSTRAINT ev_info_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES public.analysis_record(analysis_id);


--
-- TOC entry 5583 (class 2606 OID 19889)
-- Name: ev_stranded ev_stranded_analysis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ev_stranded
    ADD CONSTRAINT ev_stranded_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES public.analysis_record(analysis_id);


--
-- TOC entry 5584 (class 2606 OID 19894)
-- Name: evse_power_draw evse_power_draw_analysis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_power_draw
    ADD CONSTRAINT evse_power_draw_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES public.analysis_record(analysis_id);


--
-- TOC entry 5585 (class 2606 OID 19899)
-- Name: evse_util evse_util_analysis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_util
    ADD CONSTRAINT evse_util_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES public.analysis_record(analysis_id);


--
-- TOC entry 5586 (class 2606 OID 19904)
-- Name: evtrip_scenarios evtrip_scenarios_analysis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evtrip_scenarios
    ADD CONSTRAINT evtrip_scenarios_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES public.analysis_record(analysis_id);


--
-- TOC entry 5587 (class 2606 OID 19909)
-- Name: wa_trip_inf wa_trip_inf_road_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wa_trip_inf
    ADD CONSTRAINT wa_trip_inf_road_id_fkey FOREIGN KEY (road_id) REFERENCES public."WA_roads"(id);


-- Completed on 2020-08-06 12:15:22 PDT

--
-- PostgreSQL database dump complete
--

