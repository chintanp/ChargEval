--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

-- Started on 2019-10-19 11:38:07

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
-- TOC entry 3 (class 3079 OID 16394)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 4161 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- TOC entry 2 (class 3079 OID 17396)
-- Name: pgrouting; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgrouting WITH SCHEMA public;


--
-- TOC entry 4162 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgrouting; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgrouting IS 'pgRouting Extension';


--
-- TOC entry 1181 (class 1255 OID 17637)
-- Name: notify_new_order(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.notify_new_order() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
        PERFORM pg_notify('new_order', row_to_json(NEW)::text);
        RETURN NULL;
    END; 
$$;


ALTER FUNCTION public.notify_new_order() OWNER TO postgres;

--
-- TOC entry 1182 (class 1255 OID 17638)
-- Name: sp_len(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
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


ALTER FUNCTION public.sp_len(orig integer, dest integer) OWNER TO postgres;

--
-- TOC entry 1183 (class 1255 OID 17639)
-- Name: sp_od2(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
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


ALTER FUNCTION public.sp_od2(orig integer, dest integer) OWNER TO postgres;

--
-- TOC entry 1184 (class 1255 OID 17640)
-- Name: st_forceclosed(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
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


ALTER FUNCTION public.st_forceclosed(geom public.geometry) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 17641)
-- Name: WA_roads; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public."WA_roads" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17651)
-- Name: WA_roads_vertices_pgr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WA_roads_vertices_pgr" (
    id bigint NOT NULL,
    cnt integer,
    chk integer,
    ein integer,
    eout integer,
    the_geom public.geometry(Point,4326)
);


ALTER TABLE public."WA_roads_vertices_pgr" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17657)
-- Name: WA_roads_vertices_pgr_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WA_roads_vertices_pgr_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WA_roads_vertices_pgr_id_seq" OWNER TO postgres;

--
-- TOC entry 4163 (class 0 OID 0)
-- Dependencies: 211
-- Name: WA_roads_vertices_pgr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WA_roads_vertices_pgr_id_seq" OWNED BY public."WA_roads_vertices_pgr".id;


--
-- TOC entry 212 (class 1259 OID 17659)
-- Name: analysis_record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.analysis_record (
    analysis_id integer NOT NULL,
    user_id text NOT NULL,
    sim_date_time text NOT NULL,
    status text NOT NULL
);


ALTER TABLE public.analysis_record OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17665)
-- Name: analysis_record_analysis_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.analysis_record_analysis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.analysis_record_analysis_id_seq OWNER TO postgres;

--
-- TOC entry 4164 (class 0 OID 0)
-- Dependencies: 213
-- Name: analysis_record_analysis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.analysis_record_analysis_id_seq OWNED BY public.analysis_record.analysis_id;


--
-- TOC entry 214 (class 1259 OID 17667)
-- Name: built_evse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.built_evse (
    city text,
    state text,
    zip integer,
    level2_count integer,
    level1_count text,
    dcfc_count integer,
    ev_network text,
    latitude double precision,
    longitude double precision,
    open_date date,
    ev_connector_types text,
    ev_pricing text,
    bevse_id integer NOT NULL,
    country text,
    connector_code integer,
    charging_cost real
);


ALTER TABLE public.built_evse OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17673)
-- Name: chademo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.chademo AS
 SELECT built_evse.bevse_id,
    public.st_makepoint(built_evse.longitude, built_evse.latitude) AS st_makepoint
   FROM public.built_evse
  WHERE ((built_evse.connector_code = 1) OR (built_evse.connector_code = 3));


ALTER TABLE public.chademo OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17677)
-- Name: combo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.combo AS
 SELECT built_evse.bevse_id,
    public.st_makepoint(built_evse.longitude, built_evse.latitude) AS st_makepoint
   FROM public.built_evse
  WHERE ((built_evse.connector_code = 2) OR (built_evse.connector_code = 3));


ALTER TABLE public.combo OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17681)
-- Name: dest_charger; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dest_charger (
    analysis_id integer NOT NULL,
    zip integer NOT NULL,
    dc_chademo boolean,
    dc_combo boolean,
    dc_level2 boolean
);


ALTER TABLE public.dest_charger OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17684)
-- Name: ev_finished; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.ev_finished OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17690)
-- Name: ev_finished_fin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ev_finished_fin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ev_finished_fin_id_seq OWNER TO postgres;

--
-- TOC entry 4165 (class 0 OID 0)
-- Dependencies: 219
-- Name: ev_finished_fin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ev_finished_fin_id_seq OWNED BY public.ev_finished.fin_id;


--
-- TOC entry 220 (class 1259 OID 17692)
-- Name: ev_info; Type: TABLE; Schema: public; Owner: postgres
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
    speed_val numeric NOT NULL
);


ALTER TABLE public.ev_info OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17698)
-- Name: ev_info_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ev_info_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ev_info_info_id_seq OWNER TO postgres;

--
-- TOC entry 4166 (class 0 OID 0)
-- Dependencies: 221
-- Name: ev_info_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ev_info_info_id_seq OWNED BY public.ev_info.info_id;


--
-- TOC entry 222 (class 1259 OID 17700)
-- Name: ev_stranded; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.ev_stranded OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17706)
-- Name: ev_stranded_stranded_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ev_stranded_stranded_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ev_stranded_stranded_id_seq OWNER TO postgres;

--
-- TOC entry 4167 (class 0 OID 0)
-- Dependencies: 223
-- Name: ev_stranded_stranded_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ev_stranded_stranded_id_seq OWNED BY public.ev_stranded.stranded_id;


--
-- TOC entry 224 (class 1259 OID 17708)
-- Name: evse_charging_session; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.evse_charging_session OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17714)
-- Name: evse_charging_session_cs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evse_charging_session_cs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evse_charging_session_cs_id_seq OWNER TO postgres;

--
-- TOC entry 4168 (class 0 OID 0)
-- Dependencies: 225
-- Name: evse_charging_session_cs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evse_charging_session_cs_id_seq OWNED BY public.evse_charging_session.cs_id;


--
-- TOC entry 226 (class 1259 OID 17716)
-- Name: evse_evs_passed; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evse_evs_passed (
    pass_id integer NOT NULL,
    simulation_ts text NOT NULL,
    evse_id text NOT NULL,
    veh_id text NOT NULL,
    soc_val numeric NOT NULL,
    analysis_id integer NOT NULL
);


ALTER TABLE public.evse_evs_passed OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17722)
-- Name: evse_evs_passed_pass_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evse_evs_passed_pass_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evse_evs_passed_pass_id_seq OWNER TO postgres;

--
-- TOC entry 4169 (class 0 OID 0)
-- Dependencies: 227
-- Name: evse_evs_passed_pass_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evse_evs_passed_pass_id_seq OWNED BY public.evse_evs_passed.pass_id;


--
-- TOC entry 228 (class 1259 OID 17724)
-- Name: evse_power_draw; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evse_power_draw (
    pd_id integer NOT NULL,
    simulation_ts text NOT NULL,
    evse_id text NOT NULL,
    analysis_id integer,
    power_val integer NOT NULL
);


ALTER TABLE public.evse_power_draw OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17730)
-- Name: evse_power_draw_pd_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evse_power_draw_pd_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evse_power_draw_pd_id_seq OWNER TO postgres;

--
-- TOC entry 4170 (class 0 OID 0)
-- Dependencies: 229
-- Name: evse_power_draw_pd_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evse_power_draw_pd_id_seq OWNED BY public.evse_power_draw.pd_id;


--
-- TOC entry 230 (class 1259 OID 17732)
-- Name: evse_util; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evse_util (
    util_id integer NOT NULL,
    analysis_id integer NOT NULL,
    evse_id text NOT NULL,
    util_val numeric NOT NULL
);


ALTER TABLE public.evse_util OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17738)
-- Name: evse_util_util_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evse_util_util_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evse_util_util_id_seq OWNER TO postgres;

--
-- TOC entry 4171 (class 0 OID 0)
-- Dependencies: 231
-- Name: evse_util_util_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evse_util_util_id_seq OWNED BY public.evse_util.util_id;


--
-- TOC entry 232 (class 1259 OID 17752)
-- Name: evtrip_scenarios; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.evtrip_scenarios OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17758)
-- Name: evtrip_scenarios_evtrip_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evtrip_scenarios_evtrip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evtrip_scenarios_evtrip_id_seq OWNER TO postgres;

--
-- TOC entry 4172 (class 0 OID 0)
-- Dependencies: 233
-- Name: evtrip_scenarios_evtrip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evtrip_scenarios_evtrip_id_seq OWNED BY public.evtrip_scenarios.evtrip_id;


--
-- TOC entry 234 (class 1259 OID 17760)
-- Name: nevse1; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.nevse1 AS
 SELECT row_number() OVER () AS row_number,
    public.st_setsrid(public.st_makepoint(('-121.4146'::numeric)::double precision, (47.82791)::double precision), 4326) AS st_setsrid;


ALTER TABLE public.nevse1 OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17764)
-- Name: new_evses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.new_evses (
    nevse_id integer NOT NULL,
    analysis_id integer NOT NULL,
    input_evse_id integer NOT NULL,
    trip_count integer NOT NULL,
    od_pairs text NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    chademo_plug_count integer NOT NULL,
    combo_plug_count integer NOT NULL,
    chademo_power integer NOT NULL,
    combo_power integer NOT NULL,
    level2_plug_count integer NOT NULL,
    level2_power numeric NOT NULL
);


ALTER TABLE public.new_evses OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17770)
-- Name: new_evses_nevse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.new_evses_nevse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.new_evses_nevse_id_seq OWNER TO postgres;

--
-- TOC entry 4173 (class 0 OID 0)
-- Dependencies: 236
-- Name: new_evses_nevse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.new_evses_nevse_id_seq OWNED BY public.new_evses.nevse_id;


--
-- TOC entry 237 (class 1259 OID 17772)
-- Name: od_cd; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.od_cd OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 17778)
-- Name: od_sp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.od_sp (
    origin integer NOT NULL,
    destination integer NOT NULL,
    shortest_path_length double precision
);


ALTER TABLE public.od_sp OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 17781)
-- Name: sp047651; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.sp047651 AS
 SELECT row_number() OVER () AS row_number,
    public.sp_od2(98047, 98651) AS sp_od2;


ALTER TABLE public.sp047651 OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 17785)
-- Name: sp156; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.sp156 AS
 SELECT row_number() OVER () AS row_number,
    sp_od2.shortest_path
   FROM public.sp_od2(98250, 99156) sp_od2(shortest_path);


ALTER TABLE public.sp156 OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 583629)
-- Name: user_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_details (
    user_id text NOT NULL,
    email_id text,
    user_name text,
    last_submit_date text NOT NULL
);


ALTER TABLE public.user_details OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 17789)
-- Name: wa_bevs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wa_bevs (
    veh_id text NOT NULL,
    county text NOT NULL,
    city text NOT NULL,
    zip_code integer NOT NULL,
    model_year integer NOT NULL,
    make text NOT NULL,
    model text NOT NULL,
    electric_range integer NOT NULL,
    base_msrp integer NOT NULL,
    legislative_district integer NOT NULL,
    capacity numeric NOT NULL,
    fuel_consumption numeric NOT NULL,
    connector_code integer NOT NULL,
    state text NOT NULL,
    range_fe real NOT NULL
);


ALTER TABLE public.wa_bevs OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 17795)
-- Name: wa_evtrips; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wa_evtrips (
    origin integer NOT NULL,
    destination integer NOT NULL,
    ret numeric NOT NULL,
    dep numeric NOT NULL,
    oevs integer NOT NULL,
    devs integer NOT NULL,
    ocars integer NOT NULL,
    dcars integer NOT NULL
);


ALTER TABLE public.wa_evtrips OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 17801)
-- Name: wa_gas_prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wa_gas_prices (
    zip integer NOT NULL,
    avg_gas_price real NOT NULL
);


ALTER TABLE public.wa_gas_prices OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 17804)
-- Name: wa_long_distance_passenger_trips; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wa_long_distance_passenger_trips (
    ldtrip_id integer NOT NULL,
    origin_zip integer NOT NULL,
    destination_zip integer NOT NULL,
    ldtrip_count integer NOT NULL
);


ALTER TABLE public.wa_long_distance_passenger_trips OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 17807)
-- Name: wa_long_distance_passenger_trips_ldtrip_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wa_long_distance_passenger_trips_ldtrip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wa_long_distance_passenger_trips_ldtrip_id_seq OWNER TO postgres;

--
-- TOC entry 4174 (class 0 OID 0)
-- Dependencies: 245
-- Name: wa_long_distance_passenger_trips_ldtrip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wa_long_distance_passenger_trips_ldtrip_id_seq OWNED BY public.wa_long_distance_passenger_trips.ldtrip_id;


--
-- TOC entry 246 (class 1259 OID 17809)
-- Name: wa_state_boundary; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.wa_state_boundary OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 17815)
-- Name: wa_state_boundary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wa_state_boundary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wa_state_boundary_id_seq OWNER TO postgres;

--
-- TOC entry 4175 (class 0 OID 0)
-- Dependencies: 247
-- Name: wa_state_boundary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wa_state_boundary_id_seq OWNED BY public.wa_state_boundary.id;


--
-- TOC entry 248 (class 1259 OID 17817)
-- Name: wa_trip_inf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wa_trip_inf (
    road_id integer NOT NULL,
    analysis_id integer NOT NULL,
    trip_count_chademo integer DEFAULT 0 NOT NULL,
    od_pairs_chademo text DEFAULT ' '::text NOT NULL,
    trip_count_combo integer DEFAULT 0 NOT NULL,
    od_pairs_combo text DEFAULT ' '::text NOT NULL
);


ALTER TABLE public.wa_trip_inf OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 17827)
-- Name: zipcode_record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zipcode_record (
    zip text NOT NULL,
    city text,
    state text NOT NULL,
    latitude double precision,
    longitude double precision
);


ALTER TABLE public.zipcode_record OWNER TO postgres;

--
-- TOC entry 3937 (class 2604 OID 17833)
-- Name: WA_roads_vertices_pgr id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WA_roads_vertices_pgr" ALTER COLUMN id SET DEFAULT nextval('public."WA_roads_vertices_pgr_id_seq"'::regclass);


--
-- TOC entry 3938 (class 2604 OID 17834)
-- Name: analysis_record analysis_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.analysis_record ALTER COLUMN analysis_id SET DEFAULT nextval('public.analysis_record_analysis_id_seq'::regclass);


--
-- TOC entry 3939 (class 2604 OID 17835)
-- Name: ev_finished fin_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ev_finished ALTER COLUMN fin_id SET DEFAULT nextval('public.ev_finished_fin_id_seq'::regclass);


--
-- TOC entry 3940 (class 2604 OID 17836)
-- Name: ev_info info_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ev_info ALTER COLUMN info_id SET DEFAULT nextval('public.ev_info_info_id_seq'::regclass);


--
-- TOC entry 3941 (class 2604 OID 17837)
-- Name: ev_stranded stranded_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ev_stranded ALTER COLUMN stranded_id SET DEFAULT nextval('public.ev_stranded_stranded_id_seq'::regclass);


--
-- TOC entry 3942 (class 2604 OID 17838)
-- Name: evse_charging_session cs_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evse_charging_session ALTER COLUMN cs_id SET DEFAULT nextval('public.evse_charging_session_cs_id_seq'::regclass);


--
-- TOC entry 3943 (class 2604 OID 17839)
-- Name: evse_evs_passed pass_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evse_evs_passed ALTER COLUMN pass_id SET DEFAULT nextval('public.evse_evs_passed_pass_id_seq'::regclass);


--
-- TOC entry 3944 (class 2604 OID 17840)
-- Name: evse_power_draw pd_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evse_power_draw ALTER COLUMN pd_id SET DEFAULT nextval('public.evse_power_draw_pd_id_seq'::regclass);


--
-- TOC entry 3945 (class 2604 OID 17841)
-- Name: evse_util util_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evse_util ALTER COLUMN util_id SET DEFAULT nextval('public.evse_util_util_id_seq'::regclass);


--
-- TOC entry 3946 (class 2604 OID 17842)
-- Name: evtrip_scenarios evtrip_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evtrip_scenarios ALTER COLUMN evtrip_id SET DEFAULT nextval('public.evtrip_scenarios_evtrip_id_seq'::regclass);


--
-- TOC entry 3947 (class 2604 OID 17843)
-- Name: new_evses nevse_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_evses ALTER COLUMN nevse_id SET DEFAULT nextval('public.new_evses_nevse_id_seq'::regclass);


--
-- TOC entry 3948 (class 2604 OID 17844)
-- Name: wa_long_distance_passenger_trips ldtrip_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wa_long_distance_passenger_trips ALTER COLUMN ldtrip_id SET DEFAULT nextval('public.wa_long_distance_passenger_trips_ldtrip_id_seq'::regclass);


--
-- TOC entry 3949 (class 2604 OID 17845)
-- Name: wa_state_boundary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wa_state_boundary ALTER COLUMN id SET DEFAULT nextval('public.wa_state_boundary_id_seq'::regclass);


--
-- TOC entry 3957 (class 2606 OID 513269)
-- Name: WA_roads WA_roads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WA_roads"
    ADD CONSTRAINT "WA_roads_pkey" PRIMARY KEY (id);


--
-- TOC entry 3962 (class 2606 OID 513271)
-- Name: WA_roads_vertices_pgr WA_roads_vertices_pgr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WA_roads_vertices_pgr"
    ADD CONSTRAINT "WA_roads_vertices_pgr_pkey" PRIMARY KEY (id);


--
-- TOC entry 3965 (class 2606 OID 513273)
-- Name: analysis_record analysis_record_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.analysis_record
    ADD CONSTRAINT analysis_record_pkey PRIMARY KEY (analysis_id);


--
-- TOC entry 3967 (class 2606 OID 513275)
-- Name: built_evse built_evse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.built_evse
    ADD CONSTRAINT built_evse_pkey PRIMARY KEY (bevse_id);


--
-- TOC entry 3969 (class 2606 OID 513277)
-- Name: dest_charger dest_charger_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dest_charger
    ADD CONSTRAINT dest_charger_pkey PRIMARY KEY (analysis_id, zip);


--
-- TOC entry 3971 (class 2606 OID 513279)
-- Name: ev_finished ev_finished_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ev_finished
    ADD CONSTRAINT ev_finished_pkey PRIMARY KEY (fin_id);


--
-- TOC entry 3973 (class 2606 OID 513281)
-- Name: ev_info ev_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ev_info
    ADD CONSTRAINT ev_info_pkey PRIMARY KEY (info_id);


--
-- TOC entry 3975 (class 2606 OID 513283)
-- Name: ev_stranded ev_stranded_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ev_stranded
    ADD CONSTRAINT ev_stranded_pkey PRIMARY KEY (stranded_id);


--
-- TOC entry 3977 (class 2606 OID 513285)
-- Name: evse_charging_session evse_charging_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evse_charging_session
    ADD CONSTRAINT evse_charging_session_pkey PRIMARY KEY (cs_id);


--
-- TOC entry 3979 (class 2606 OID 513287)
-- Name: evse_evs_passed evse_evs_passed_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evse_evs_passed
    ADD CONSTRAINT evse_evs_passed_pkey PRIMARY KEY (pass_id);


--
-- TOC entry 3981 (class 2606 OID 513289)
-- Name: evse_power_draw evse_power_draw_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evse_power_draw
    ADD CONSTRAINT evse_power_draw_pkey PRIMARY KEY (pd_id);


--
-- TOC entry 3983 (class 2606 OID 513291)
-- Name: evse_util evse_util_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evse_util
    ADD CONSTRAINT evse_util_pkey PRIMARY KEY (util_id);


--
-- TOC entry 3985 (class 2606 OID 513293)
-- Name: evtrip_scenarios evtrip_scenarios_analysis_id_veh_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evtrip_scenarios
    ADD CONSTRAINT evtrip_scenarios_analysis_id_veh_id_key UNIQUE (analysis_id, veh_id);


--
-- TOC entry 3987 (class 2606 OID 513295)
-- Name: evtrip_scenarios evtrip_scenarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evtrip_scenarios
    ADD CONSTRAINT evtrip_scenarios_pkey PRIMARY KEY (evtrip_id);


--
-- TOC entry 3989 (class 2606 OID 513297)
-- Name: new_evses new_evses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_evses
    ADD CONSTRAINT new_evses_pkey PRIMARY KEY (nevse_id);


--
-- TOC entry 3991 (class 2606 OID 513299)
-- Name: od_cd od_cd_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.od_cd
    ADD CONSTRAINT od_cd_pkey PRIMARY KEY (origin, destination, analysis_id);


--
-- TOC entry 3995 (class 2606 OID 513301)
-- Name: od_sp od_sp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.od_sp
    ADD CONSTRAINT od_sp_pkey PRIMARY KEY (origin, destination);


--
-- TOC entry 4011 (class 2606 OID 583636)
-- Name: user_details user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_details
    ADD CONSTRAINT user_details_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3997 (class 2606 OID 513303)
-- Name: wa_bevs wa_bevs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wa_bevs
    ADD CONSTRAINT wa_bevs_pkey PRIMARY KEY (veh_id);


--
-- TOC entry 3999 (class 2606 OID 513305)
-- Name: wa_evtrips wa_ev_trips_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wa_evtrips
    ADD CONSTRAINT wa_ev_trips_pkey PRIMARY KEY (origin, destination);


--
-- TOC entry 4001 (class 2606 OID 513307)
-- Name: wa_gas_prices wa_gas_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wa_gas_prices
    ADD CONSTRAINT wa_gas_prices_pkey PRIMARY KEY (zip);


--
-- TOC entry 4003 (class 2606 OID 513309)
-- Name: wa_long_distance_passenger_trips wa_long_distance_passenger_trips_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wa_long_distance_passenger_trips
    ADD CONSTRAINT wa_long_distance_passenger_trips_pkey PRIMARY KEY (ldtrip_id);


--
-- TOC entry 4005 (class 2606 OID 513311)
-- Name: wa_state_boundary wa_state_boundary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wa_state_boundary
    ADD CONSTRAINT wa_state_boundary_pkey PRIMARY KEY (id);


--
-- TOC entry 4007 (class 2606 OID 513313)
-- Name: wa_trip_inf wa_trip_inf_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wa_trip_inf
    ADD CONSTRAINT wa_trip_inf_pkey PRIMARY KEY (road_id, analysis_id);


--
-- TOC entry 4009 (class 2606 OID 513315)
-- Name: zipcode_record zipcode_record_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zipcode_record
    ADD CONSTRAINT zipcode_record_pkey PRIMARY KEY (zip);


--
-- TOC entry 3963 (class 1259 OID 513316)
-- Name: WA_roads_vertices_pgr_the_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WA_roads_vertices_pgr_the_geom_idx" ON public."WA_roads_vertices_pgr" USING gist (the_geom);


--
-- TOC entry 3992 (class 1259 OID 513317)
-- Name: sidx_cd_chademo_geog__od_cd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sidx_cd_chademo_geog__od_cd ON public.od_cd USING gist (cd_chademo_geog);

ALTER TABLE public.od_cd CLUSTER ON sidx_cd_chademo_geog__od_cd;


--
-- TOC entry 3993 (class 1259 OID 513321)
-- Name: sidx_cd_combo_geog__od_cd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sidx_cd_combo_geog__od_cd ON public.od_cd USING gist (cd_combo_geog);


--
-- TOC entry 3958 (class 1259 OID 513322)
-- Name: sidx_geom__wa_roads; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sidx_geom__wa_roads ON public."WA_roads" USING gist (geom);


--
-- TOC entry 3959 (class 1259 OID 513323)
-- Name: sidx_source__wa_roads; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sidx_source__wa_roads ON public."WA_roads" USING btree (source);


--
-- TOC entry 3960 (class 1259 OID 513324)
-- Name: sidx_target__wa_roads; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sidx_target__wa_roads ON public."WA_roads" USING btree (target);


--
-- TOC entry 4019 (class 2620 OID 513325)
-- Name: analysis_record notify_new_order; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER notify_new_order AFTER INSERT ON public.analysis_record FOR EACH ROW EXECUTE FUNCTION public.notify_new_order();


--
-- TOC entry 4012 (class 2606 OID 513326)
-- Name: ev_finished ev_finished_analysis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ev_finished
    ADD CONSTRAINT ev_finished_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES public.analysis_record(analysis_id);


--
-- TOC entry 4013 (class 2606 OID 513331)
-- Name: ev_info ev_info_analysis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ev_info
    ADD CONSTRAINT ev_info_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES public.analysis_record(analysis_id);


--
-- TOC entry 4014 (class 2606 OID 513336)
-- Name: ev_stranded ev_stranded_analysis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ev_stranded
    ADD CONSTRAINT ev_stranded_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES public.analysis_record(analysis_id);


--
-- TOC entry 4015 (class 2606 OID 513341)
-- Name: evse_power_draw evse_power_draw_analysis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evse_power_draw
    ADD CONSTRAINT evse_power_draw_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES public.analysis_record(analysis_id);


--
-- TOC entry 4016 (class 2606 OID 513346)
-- Name: evse_util evse_util_analysis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evse_util
    ADD CONSTRAINT evse_util_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES public.analysis_record(analysis_id);


--
-- TOC entry 4017 (class 2606 OID 513351)
-- Name: evtrip_scenarios evtrip_scenarios_analysis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evtrip_scenarios
    ADD CONSTRAINT evtrip_scenarios_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES public.analysis_record(analysis_id);


--
-- TOC entry 4018 (class 2606 OID 513356)
-- Name: wa_trip_inf wa_trip_inf_road_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wa_trip_inf
    ADD CONSTRAINT wa_trip_inf_road_id_fkey FOREIGN KEY (road_id) REFERENCES public."WA_roads"(id);


-- Completed on 2019-10-19 11:40:51

--
-- PostgreSQL database dump complete
--

