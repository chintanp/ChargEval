--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3 (Ubuntu 12.3-1.pgdg20.04+1)

-- Started on 2020-08-13 15:50:48 PDT

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
-- TOC entry 10 (class 2615 OID 969121)
-- Name: audit; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA audit;



--
-- TOC entry 257 (class 1259 OID 969124)
-- Name: logged_actions; Type: TABLE; Schema: audit; Owner: -
--

CREATE TABLE audit.logged_actions (
    event_id bigint NOT NULL,
    schema_name text NOT NULL,
    table_name text NOT NULL,
    relid oid NOT NULL,
    session_user_name text,
    action_tstamp_tx timestamp with time zone NOT NULL,
    action_tstamp_stm timestamp with time zone NOT NULL,
    action_tstamp_clk timestamp with time zone NOT NULL,
    transaction_id bigint,
    application_name text,
    client_addr inet,
    client_port integer,
    client_query text,
    action text NOT NULL,
    row_data hstore,
    changed_fields hstore,
    statement_only boolean NOT NULL,
    CONSTRAINT logged_actions_action_check ); -- CHECK ((action = ANY (ARRAY['I'::text, 'D'::text, 'U'::text, 'T'::text])))
-- );


--
-- TOC entry 5306 (class 0 OID 0)
-- Dependencies: 257
-- Name: TABLE logged_actions; Type: COMMENT; Schema: audit; Owner: -
--

COMMENT ON TABLE audit.logged_actions IS 'History of auditable actions on audited tables, from audit.if_modified_func()';


--
-- TOC entry 5307 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN logged_actions.event_id; Type: COMMENT; Schema: audit; Owner: -
--

-- COMMENT ON COLUMN audit.logged_actions.event_id IS 'Unique identifier for each auditable event';


--
-- TOC entry 5308 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN logged_actions.schema_name; Type: COMMENT; Schema: audit; Owner: -
--

-- COMMENT ON COLUMN audit.logged_actions.schema_name IS 'Database schema audited table for this event is in';


--
-- TOC entry 5309 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN logged_actions.table_name; Type: COMMENT; Schema: audit; Owner: -
--

-- COMMENT ON COLUMN audit.logged_actions.table_name IS 'Non-schema-qualified table name of table event occured in';


--
-- TOC entry 5310 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN logged_actions.relid; Type: COMMENT; Schema: audit; Owner: -
--

-- COMMENT ON COLUMN audit.logged_actions.relid IS 'Table OID. Changes with drop/create. Get with ''tablename''::regclass';


--
-- TOC entry 5311 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN logged_actions.session_user_name; Type: COMMENT; Schema: audit; Owner: -
--

-- COMMENT ON COLUMN audit.logged_actions.session_user_name IS 'Login / session user whose statement caused the audited event';


--
-- TOC entry 5312 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN logged_actions.action_tstamp_tx; Type: COMMENT; Schema: audit; Owner: -
--

-- COMMENT ON COLUMN audit.logged_actions.action_tstamp_tx IS 'Transaction start timestamp for tx in which audited event occurred';


--
-- TOC entry 5313 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN logged_actions.action_tstamp_stm; Type: COMMENT; Schema: audit; Owner: -
--

-- COMMENT ON COLUMN audit.logged_actions.action_tstamp_stm IS 'Statement start timestamp for tx in which audited event occurred';


--
-- TOC entry 5314 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN logged_actions.action_tstamp_clk; Type: COMMENT; Schema: audit; Owner: -
--

-- COMMENT ON COLUMN audit.logged_actions.action_tstamp_clk IS 'Wall clock time at which audited event''s trigger call occurred';


--
-- TOC entry 5315 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN logged_actions.transaction_id; Type: COMMENT; Schema: audit; Owner: -
--

-- COMMENT ON COLUMN audit.logged_actions.transaction_id IS 'Identifier of transaction that made the change. May wrap, but unique paired with action_tstamp_tx.';


--
-- TOC entry 5316 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN logged_actions.application_name; Type: COMMENT; Schema: audit; Owner: -
--

-- COMMENT ON COLUMN audit.logged_actions.application_name IS 'Application name set when this audit event occurred. Can be changed in-session by client.';


--
-- TOC entry 5317 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN logged_actions.client_addr; Type: COMMENT; Schema: audit; Owner: -
--

-- COMMENT ON COLUMN audit.logged_actions.client_addr IS 'IP address of client that issued query. Null for unix domain socket.';


--
-- TOC entry 5318 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN logged_actions.client_port; Type: COMMENT; Schema: audit; Owner: -
--

-- COMMENT ON COLUMN audit.logged_actions.client_port IS 'Remote peer IP port address of client that issued query. Undefined for unix socket.';


--
-- TOC entry 5319 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN logged_actions.client_query; Type: COMMENT; Schema: audit; Owner: -
--

-- COMMENT ON COLUMN audit.logged_actions.client_query IS 'Top-level query that caused this auditable event. May be more than one statement.';


--
-- TOC entry 5320 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN logged_actions.action; Type: COMMENT; Schema: audit; Owner: -
--

-- COMMENT ON COLUMN audit.logged_actions.action IS 'Action type; I = insert, D = delete, U = update, T = truncate';


--
-- TOC entry 5321 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN logged_actions.row_data; Type: COMMENT; Schema: audit; Owner: -
--

-- COMMENT ON COLUMN audit.logged_actions.row_data IS 'Record value. Null for statement-level trigger. For INSERT this is the new tuple. For DELETE and UPDATE it is the old tuple.';


--
-- TOC entry 5322 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN logged_actions.changed_fields; Type: COMMENT; Schema: audit; Owner: -
--

-- COMMENT ON COLUMN audit.logged_actions.changed_fields IS 'New values of fields changed by UPDATE. Null except for row-level UPDATE events.';


--
-- TOC entry 5323 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN logged_actions.statement_only; Type: COMMENT; Schema: audit; Owner: -
--

-- COMMENT ON COLUMN audit.logged_actions.statement_only IS '''t'' if audit event is from an FOR EACH STATEMENT trigger, ''f'' for FOR EACH ROW';


--
-- TOC entry 256 (class 1259 OID 969122)
-- Name: logged_actions_event_id_seq; Type: SEQUENCE; Schema: audit; Owner: -
--

CREATE SEQUENCE audit.logged_actions_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5324 (class 0 OID 0)
-- Dependencies: 256
-- Name: logged_actions_event_id_seq; Type: SEQUENCE OWNED BY; Schema: audit; Owner: -
--

-- ALTER SEQUENCE audit.logged_actions_event_id_seq OWNED BY audit.logged_actions.event_id;


--
-- TOC entry 258 (class 1259 OID 969141)
-- Name: tableslist; Type: VIEW; Schema: audit; Owner: -
--

CREATE VIEW audit.tableslist AS
 SELECT DISTINCT triggers.trigger_schema AS schema,
    triggers.event_object_table AS auditedtable
   FROM information_schema.triggers
  WHERE ((triggers.trigger_name)::text = ANY (ARRAY['audit_trigger_row'::text, 'audit_trigger_stm'::text]))
  ORDER BY triggers.trigger_schema, triggers.event_object_table;


--
-- TOC entry 5325 (class 0 OID 0)
-- Dependencies: 258
-- Name: VIEW tableslist; Type: COMMENT; Schema: audit; Owner: -
--

-- COMMENT ON VIEW audit.tableslist IS '
-- View showing all tables with auditing set up. Ordered by schema, then table.
-- ';


--
-- TOC entry 212 (class 1259 OID 966876)
-- Name: WA_roads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WA_roads" (
    id integer NOT NULL,
    geom geometry(LineString,4326),
    spd character varying(80),
    source integer,
    target integer,
    trip_count_chademo integer DEFAULT 0,
    od_pairs_chademo text DEFAULT ' ',
    trip_count_combo integer DEFAULT 0,
    od_pairs_combo text DEFAULT ' '
);


--
-- TOC entry 213 (class 1259 OID 966886)
-- Name: WA_roads_vertices_pgr; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WA_roads_vertices_pgr" (
    id bigint NOT NULL,
    cnt integer,
    chk integer,
    ein integer,
    eout integer,
    the_geom geometry(Point,4326)
);


--
-- TOC entry 214 (class 1259 OID 966892)
-- Name: WA_roads_vertices_pgr_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."WA_roads_vertices_pgr_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5326 (class 0 OID 0)
-- Dependencies: 214
-- Name: WA_roads_vertices_pgr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

-- ALTER SEQUENCE public."WA_roads_vertices_pgr_id_seq" OWNED BY public."WA_roads_vertices_pgr".id;


--
-- TOC entry 215 (class 1259 OID 966894)
-- Name: analysis_record; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.analysis_record (
    analysis_id integer NOT NULL,
    user_id text NOT NULL,
    sim_date_time timestamp with time zone DEFAULT now() NOT NULL,
    status text NOT NULL,
    include_tesla boolean
);


--
-- TOC entry 216 (class 1259 OID 966900)
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
-- TOC entry 5327 (class 0 OID 0)
-- Dependencies: 216
-- Name: analysis_record_analysis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

-- ALTER SEQUENCE public.analysis_record_analysis_id_seq OWNED BY public.analysis_record.analysis_id;


--
-- TOC entry 217 (class 1259 OID 966902)
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
-- TOC entry 218 (class 1259 OID 966908)
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
-- TOC entry 219 (class 1259 OID 966911)
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
-- TOC entry 220 (class 1259 OID 966917)
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
-- TOC entry 5328 (class 0 OID 0)
-- Dependencies: 220
-- Name: ev_finished_fin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

-- ALTER SEQUENCE public.ev_finished_fin_id_seq OWNED BY public.ev_finished.fin_id;


--
-- TOC entry 221 (class 1259 OID 966919)
-- Name: ev_info; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ev_info (
    info_id bigint NOT NULL,
    simulation_ts text NOT NULL,
    analysis_id integer NOT NULL,
    veh_id text NOT NULL,
    lat_val double NOT NULL,
    lng_val double NOT NULL,
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
-- TOC entry 222 (class 1259 OID 966925)
-- Name: ev_info_info_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ev_info_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5329 (class 0 OID 0)
-- Dependencies: 222
-- Name: ev_info_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

-- ALTER SEQUENCE public.ev_info_info_id_seq OWNED BY public.ev_info.info_id;


--
-- TOC entry 223 (class 1259 OID 966927)
-- Name: ev_stranded; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ev_stranded (
    stranded_id integer NOT NULL,
    stranded_ts text NOT NULL,
    veh_id text NOT NULL,
    stranded_lat double  NOT NULL,
    stranded_lng double  NOT NULL,
    origin_zip integer NOT NULL,
    destination_zip integer NOT NULL,
    analysis_id integer NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 966933)
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
-- TOC entry 5330 (class 0 OID 0)
-- Dependencies: 224
-- Name: ev_stranded_stranded_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

-- ALTER SEQUENCE public.ev_stranded_stranded_id_seq OWNED BY public.ev_stranded.stranded_id;


--
-- TOC entry 225 (class 1259 OID 966935)
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
-- TOC entry 226 (class 1259 OID 966941)
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
-- TOC entry 5331 (class 0 OID 0)
-- Dependencies: 226
-- Name: evse_charging_session_cs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

-- ALTER SEQUENCE public.evse_charging_session_cs_id_seq OWNED BY public.evse_charging_session.cs_id;


--
-- TOC entry 227 (class 1259 OID 966943)
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
-- TOC entry 228 (class 1259 OID 966949)
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
-- TOC entry 5332 (class 0 OID 0)
-- Dependencies: 228
-- Name: evse_evs_passed_pass_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

-- ALTER SEQUENCE public.evse_evs_passed_pass_id_seq OWNED BY public.evse_evs_passed.pass_id;


--
-- TOC entry 229 (class 1259 OID 966951)
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
-- TOC entry 230 (class 1259 OID 966957)
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
-- TOC entry 5333 (class 0 OID 0)
-- Dependencies: 230
-- Name: evse_evs_waiting_wait_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

-- ALTER SEQUENCE public.evse_evs_waiting_wait_id_seq OWNED BY public.evse_evs_waiting.wait_id;


--
-- TOC entry 231 (class 1259 OID 966959)
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
-- TOC entry 232 (class 1259 OID 966965)
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
-- TOC entry 5334 (class 0 OID 0)
-- Dependencies: 232
-- Name: evse_power_draw_pd_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

-- ALTER SEQUENCE public.evse_power_draw_pd_id_seq OWNED BY public.evse_power_draw.pd_id;


--
-- TOC entry 233 (class 1259 OID 966967)
-- Name: evse_util; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.evse_util (
    util_id integer NOT NULL,
    analysis_id integer NOT NULL,
    evse_id text NOT NULL,
    util_val numeric NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 966973)
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
-- TOC entry 5335 (class 0 OID 0)
-- Dependencies: 234
-- Name: evse_util_util_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

-- ALTER SEQUENCE public.evse_util_util_id_seq OWNED BY public.evse_util.util_id;


--
-- TOC entry 235 (class 1259 OID 966975)
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
    trip_start_time text NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


--
-- TOC entry 236 (class 1259 OID 966981)
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
-- TOC entry 5336 (class 0 OID 0)
-- Dependencies: 236
-- Name: evtrip_scenarios_evtrip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

-- ALTER SEQUENCE public.evtrip_scenarios_evtrip_id_seq OWNED BY public.evtrip_scenarios.evtrip_id;


--
-- TOC entry 211 (class 1259 OID 966862)
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 966983)
-- Name: nevse1; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.nevse1 AS
 SELECT row_number() OVER () AS row_number,
    public.st_setsrid(public.st_makepoint(('-121.4146'::numeric)::double precision, (47.82791)::double precision), 4326) AS st_setsrid;


--
-- TOC entry 238 (class 1259 OID 966987)
-- Name: new_evses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.new_evses (
    nevse_id integer NOT NULL,
    analysis_id integer NOT NULL,
    input_evse_id integer NOT NULL,
    trip_count integer,
    od_pairs text,
    latitude double NOT NULL,
    longitude double NOT NULL,
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
-- TOC entry 239 (class 1259 OID 966993)
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
-- TOC entry 5337 (class 0 OID 0)
-- Dependencies: 239
-- Name: new_evses_nevse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

-- ALTER SEQUENCE public.new_evses_nevse_id_seq OWNED BY public.new_evses.nevse_id;


--
-- TOC entry 240 (class 1259 OID 966995)
-- Name: od_cd; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.od_cd (
    origin integer NOT NULL,
    destination integer NOT NULL,
    cd_chademo double,
    cd_combo double,
    analysis_id integer NOT NULL,
    cd_chademo_geog geography,
    cd_combo_geog geography
);


--
-- TOC entry 241 (class 1259 OID 967001)
-- Name: od_sp; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.od_sp (
    origin integer NOT NULL,
    destination integer NOT NULL,
    shortest_path_length double
);


--
-- TOC entry 242 (class 1259 OID 967004)
-- Name: sp047651; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.sp047651 AS
 SELECT row_number() OVER () AS row_number,
    public.sp_od2(98047, 98651) AS sp_od2;


--
-- TOC entry 243 (class 1259 OID 967008)
-- Name: sp156; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.sp156 AS
 SELECT row_number() OVER () AS row_number,
    sp_od2.shortest_path
   FROM public.sp_od2(98250, 99156) sp_od2(shortest_path);


--
-- TOC entry 244 (class 1259 OID 967012)
-- Name: table_stats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.table_stats (
    table_id integer NOT NULL,
    table_name text,
    last_updated text
);


--
-- TOC entry 245 (class 1259 OID 967018)
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
-- TOC entry 5338 (class 0 OID 0)
-- Dependencies: 245
-- Name: table_stats_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

-- ALTER SEQUENCE public.table_stats_table_id_seq OWNED BY public.table_stats.table_id;


--
-- TOC entry 246 (class 1259 OID 967020)
-- Name: user_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_details (
    user_id text NOT NULL,
    user_name text,
    email_id text,
    last_submit_date timestamp with time zone DEFAULT now()
);


--
-- TOC entry 247 (class 1259 OID 967026)
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
-- TOC entry 248 (class 1259 OID 967032)
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
-- TOC entry 249 (class 1259 OID 967035)
-- Name: wa_gas_prices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wa_gas_prices (
    zip text,
    avg_gas_price real
);


--
-- TOC entry 250 (class 1259 OID 967041)
-- Name: wa_long_distance_passenger_trips; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wa_long_distance_passenger_trips (
    ldtrip_id integer NOT NULL,
    origin_zip integer NOT NULL,
    destination_zip integer NOT NULL,
    ldtrip_count integer NOT NULL
);


--
-- TOC entry 251 (class 1259 OID 967044)
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
-- TOC entry 5339 (class 0 OID 0)
-- Dependencies: 251
-- Name: wa_long_distance_passenger_trips_ldtrip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

-- ALTER SEQUENCE public.wa_long_distance_passenger_trips_ldtrip_id_seq OWNED BY public.wa_long_distance_passenger_trips.ldtrip_id;


--
-- TOC entry 252 (class 1259 OID 967046)
-- Name: wa_state_boundary; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wa_state_boundary (
    id integer NOT NULL,
    geom geometry(MultiPolygon,4326),
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
-- TOC entry 253 (class 1259 OID 967052)
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
-- TOC entry 5340 (class 0 OID 0)
-- Dependencies: 253
-- Name: wa_state_boundary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

-- ALTER SEQUENCE public.wa_state_boundary_id_seq OWNED BY public.wa_state_boundary.id;


--
-- TOC entry 254 (class 1259 OID 967054)
-- Name: wa_trip_inf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wa_trip_inf (
    road_id integer NOT NULL,
    analysis_id integer NOT NULL,
    trip_count_chademo integer DEFAULT 0 NOT NULL,
    od_pairs_chademo text DEFAULT ' ' NOT NULL,
    trip_count_combo integer DEFAULT 0 NOT NULL,
    od_pairs_combo text DEFAULT ' ' NOT NULL
);


--
-- TOC entry 255 (class 1259 OID 967064)
-- Name: zipcode_record; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.zipcode_record (
    zip text NOT NULL,
    city text,
    state text NOT NULL,
    latitude double ,
    longitude double 
);


--
-- TOC entry 5080 (class 2604 OID 969127)
-- Name: logged_actions event_id; Type: DEFAULT; Schema: audit; Owner: -
--

ALTER TABLE ONLY audit.logged_actions ALTER COLUMN event_id SET DEFAULT nextval('audit.logged_actions_event_id_seq'::regclass);


--
-- TOC entry 5058 (class 2604 OID 967070)
-- Name: WA_roads_vertices_pgr id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WA_roads_vertices_pgr" ALTER COLUMN id SET DEFAULT nextval('public."WA_roads_vertices_pgr_id_seq"'::regclass);


--
-- TOC entry 5059 (class 2604 OID 967071)
-- Name: analysis_record analysis_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.analysis_record ALTER COLUMN analysis_id SET DEFAULT nextval('public.analysis_record_analysis_id_seq'::regclass);


--
-- TOC entry 5061 (class 2604 OID 967072)
-- Name: ev_finished fin_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ev_finished ALTER COLUMN fin_id SET DEFAULT nextval('public.ev_finished_fin_id_seq'::regclass);


--
-- TOC entry 5062 (class 2604 OID 967073)
-- Name: ev_info info_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ev_info ALTER COLUMN info_id SET DEFAULT nextval('public.ev_info_info_id_seq'::regclass);


--
-- TOC entry 5063 (class 2604 OID 967074)
-- Name: ev_stranded stranded_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ev_stranded ALTER COLUMN stranded_id SET DEFAULT nextval('public.ev_stranded_stranded_id_seq'::regclass);


--
-- TOC entry 5064 (class 2604 OID 967075)
-- Name: evse_charging_session cs_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_charging_session ALTER COLUMN cs_id SET DEFAULT nextval('public.evse_charging_session_cs_id_seq'::regclass);


--
-- TOC entry 5065 (class 2604 OID 967076)
-- Name: evse_evs_passed pass_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_evs_passed ALTER COLUMN pass_id SET DEFAULT nextval('public.evse_evs_passed_pass_id_seq'::regclass);


--
-- TOC entry 5066 (class 2604 OID 967077)
-- Name: evse_evs_waiting wait_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_evs_waiting ALTER COLUMN wait_id SET DEFAULT nextval('public.evse_evs_waiting_wait_id_seq'::regclass);


--
-- TOC entry 5067 (class 2604 OID 967078)
-- Name: evse_power_draw pd_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_power_draw ALTER COLUMN pd_id SET DEFAULT nextval('public.evse_power_draw_pd_id_seq'::regclass);


--
-- TOC entry 5068 (class 2604 OID 967079)
-- Name: evse_util util_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_util ALTER COLUMN util_id SET DEFAULT nextval('public.evse_util_util_id_seq'::regclass);


--
-- TOC entry 5069 (class 2604 OID 967080)
-- Name: evtrip_scenarios evtrip_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evtrip_scenarios ALTER COLUMN evtrip_id SET DEFAULT nextval('public.evtrip_scenarios_evtrip_id_seq'::regclass);


--
-- TOC entry 5071 (class 2604 OID 967081)
-- Name: new_evses nevse_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.new_evses ALTER COLUMN nevse_id SET DEFAULT nextval('public.new_evses_nevse_id_seq'::regclass);


--
-- TOC entry 5072 (class 2604 OID 967082)
-- Name: table_stats table_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.table_stats ALTER COLUMN table_id SET DEFAULT nextval('public.table_stats_table_id_seq'::regclass);


--
-- TOC entry 5074 (class 2604 OID 967083)
-- Name: wa_long_distance_passenger_trips ldtrip_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wa_long_distance_passenger_trips ALTER COLUMN ldtrip_id SET DEFAULT nextval('public.wa_long_distance_passenger_trips_ldtrip_id_seq'::regclass);


--
-- TOC entry 5075 (class 2604 OID 967084)
-- Name: wa_state_boundary id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wa_state_boundary ALTER COLUMN id SET DEFAULT nextval('public.wa_state_boundary_id_seq'::regclass);


--
-- TOC entry 5146 (class 2606 OID 969133)
-- Name: logged_actions logged_actions_pkey; Type: CONSTRAINT; Schema: audit; Owner: -
--

ALTER TABLE ONLY audit.logged_actions
    ADD CONSTRAINT logged_actions_pkey PRIMARY KEY (event_id);


--
-- TOC entry 5088 (class 2606 OID 967086)
-- Name: WA_roads WA_roads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WA_roads"
    ADD CONSTRAINT "WA_roads_pkey" PRIMARY KEY (id);


--
-- TOC entry 5093 (class 2606 OID 967088)
-- Name: WA_roads_vertices_pgr WA_roads_vertices_pgr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WA_roads_vertices_pgr"
    ADD CONSTRAINT "WA_roads_vertices_pgr_pkey" PRIMARY KEY (id);


--
-- TOC entry 5096 (class 2606 OID 967090)
-- Name: analysis_record analysis_record_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.analysis_record
    ADD CONSTRAINT analysis_record_pkey PRIMARY KEY (analysis_id);


--
-- TOC entry 5098 (class 2606 OID 967092)
-- Name: dest_charger dest_charger_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dest_charger
    ADD CONSTRAINT dest_charger_pkey PRIMARY KEY (analysis_id, zip);


--
-- TOC entry 5100 (class 2606 OID 967094)
-- Name: ev_finished ev_finished_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ev_finished
    ADD CONSTRAINT ev_finished_pkey PRIMARY KEY (fin_id);


--
-- TOC entry 5102 (class 2606 OID 967096)
-- Name: ev_info ev_info_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ev_info
    ADD CONSTRAINT ev_info_pkey PRIMARY KEY (info_id);


--
-- TOC entry 5105 (class 2606 OID 967098)
-- Name: ev_stranded ev_stranded_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ev_stranded
    ADD CONSTRAINT ev_stranded_pkey PRIMARY KEY (stranded_id);


--
-- TOC entry 5107 (class 2606 OID 967100)
-- Name: evse_charging_session evse_charging_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_charging_session
    ADD CONSTRAINT evse_charging_session_pkey PRIMARY KEY (cs_id);


--
-- TOC entry 5109 (class 2606 OID 967102)
-- Name: evse_evs_passed evse_evs_passed_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_evs_passed
    ADD CONSTRAINT evse_evs_passed_pkey PRIMARY KEY (pass_id);


--
-- TOC entry 5111 (class 2606 OID 967104)
-- Name: evse_evs_waiting evse_evs_waiting_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_evs_waiting
    ADD CONSTRAINT evse_evs_waiting_pkey PRIMARY KEY (wait_id);


--
-- TOC entry 5113 (class 2606 OID 967106)
-- Name: evse_power_draw evse_power_draw_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_power_draw
    ADD CONSTRAINT evse_power_draw_pkey PRIMARY KEY (pd_id);


--
-- TOC entry 5116 (class 2606 OID 967108)
-- Name: evse_util evse_util_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_util
    ADD CONSTRAINT evse_util_pkey PRIMARY KEY (util_id);


--
-- TOC entry 5118 (class 2606 OID 967110)
-- Name: evtrip_scenarios evtrip_scenarios_analysis_id_veh_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evtrip_scenarios
    ADD CONSTRAINT evtrip_scenarios_analysis_id_veh_id_key UNIQUE (analysis_id, veh_id);


--
-- TOC entry 5120 (class 2606 OID 967112)
-- Name: evtrip_scenarios evtrip_scenarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evtrip_scenarios
    ADD CONSTRAINT evtrip_scenarios_pkey PRIMARY KEY (evtrip_id);


--
-- TOC entry 5085 (class 2606 OID 966870)
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- TOC entry 5122 (class 2606 OID 967114)
-- Name: new_evses new_evses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.new_evses
    ADD CONSTRAINT new_evses_pkey PRIMARY KEY (nevse_id);


--
-- TOC entry 5124 (class 2606 OID 967116)
-- Name: od_cd od_cd_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.od_cd
    ADD CONSTRAINT od_cd_pkey PRIMARY KEY (origin, destination, analysis_id);


--
-- TOC entry 5128 (class 2606 OID 967118)
-- Name: od_sp od_sp_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.od_sp
    ADD CONSTRAINT od_sp_pkey PRIMARY KEY (origin, destination);


--
-- TOC entry 5130 (class 2606 OID 967120)
-- Name: table_stats table_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.table_stats
    ADD CONSTRAINT table_stats_pkey PRIMARY KEY (table_id);


--
-- TOC entry 5132 (class 2606 OID 967122)
-- Name: table_stats table_stats_table_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.table_stats
    ADD CONSTRAINT table_stats_table_name_key UNIQUE (table_name);


--
-- TOC entry 5134 (class 2606 OID 967124)
-- Name: user_details user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_details
    ADD CONSTRAINT user_details_pkey PRIMARY KEY (user_id);


--
-- TOC entry 5136 (class 2606 OID 967126)
-- Name: wa_long_distance_passenger_trips wa_long_distance_passenger_trips_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wa_long_distance_passenger_trips
    ADD CONSTRAINT wa_long_distance_passenger_trips_pkey PRIMARY KEY (ldtrip_id);


--
-- TOC entry 5138 (class 2606 OID 967128)
-- Name: wa_state_boundary wa_state_boundary_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wa_state_boundary
    ADD CONSTRAINT wa_state_boundary_pkey PRIMARY KEY (id);


--
-- TOC entry 5140 (class 2606 OID 967130)
-- Name: wa_trip_inf wa_trip_inf_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wa_trip_inf
    ADD CONSTRAINT wa_trip_inf_pkey PRIMARY KEY (road_id, analysis_id);


--
-- TOC entry 5142 (class 2606 OID 967132)
-- Name: zipcode_record zipcode_record_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zipcode_record
    ADD CONSTRAINT zipcode_record_pkey PRIMARY KEY (zip);


--
-- TOC entry 5143 (class 1259 OID 969136)
-- Name: logged_actions_action_idx; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX logged_actions_action_idx ON audit.logged_actions USING btree (action);


--
-- TOC entry 5144 (class 1259 OID 969135)
-- Name: logged_actions_action_tstamp_tx_stm_idx; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX logged_actions_action_tstamp_tx_stm_idx ON audit.logged_actions USING btree (action_tstamp_stm);


--
-- TOC entry 5147 (class 1259 OID 969134)
-- Name: logged_actions_relid_idx; Type: INDEX; Schema: audit; Owner: -
--

CREATE INDEX logged_actions_relid_idx ON audit.logged_actions USING btree (relid);


--
-- TOC entry 5094 (class 1259 OID 967133)
-- Name: WA_roads_vertices_pgr_the_geom_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "WA_roads_vertices_pgr_the_geom_idx" ON public."WA_roads_vertices_pgr" USING gist (the_geom);


--
-- TOC entry 5086 (class 1259 OID 966871)
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- TOC entry 5114 (class 1259 OID 967134)
-- Name: idx_aid_evseid_evsepd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aid_evseid_evsepd ON public.evse_power_draw USING btree (analysis_id, evse_id);


--
-- TOC entry 5103 (class 1259 OID 967135)
-- Name: idx_aid_vid_evinfo; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aid_vid_evinfo ON public.ev_info USING btree (analysis_id, veh_id);


--
-- TOC entry 5125 (class 1259 OID 967136)
-- Name: sidx_cd_chademo_geog__od_cd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_cd_chademo_geog__od_cd ON public.od_cd USING gist (cd_chademo_geog);

-- ALTER TABLE public.od_cd CLUSTER ON sidx_cd_chademo_geog__od_cd;


--
-- TOC entry 5126 (class 1259 OID 967137)
-- Name: sidx_cd_combo_geog__od_cd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_cd_combo_geog__od_cd ON public.od_cd USING gist (cd_combo_geog);


--
-- TOC entry 5089 (class 1259 OID 967138)
-- Name: sidx_geom__wa_roads; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_geom__wa_roads ON public."WA_roads" USING gist (geom);


--
-- TOC entry 5090 (class 1259 OID 967139)
-- Name: sidx_source__wa_roads; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_source__wa_roads ON public."WA_roads" USING btree (source);


--
-- TOC entry 5091 (class 1259 OID 967140)
-- Name: sidx_target__wa_roads; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sidx_target__wa_roads ON public."WA_roads" USING btree (target);


--
-- TOC entry 5156 (class 2620 OID 969145)
-- Name: analysis_record audit_trigger_row; Type: TRIGGER; Schema: public; Owner: -
--

-- CREATE TRIGGER audit_trigger_row AFTER INSERT OR DELETE OR UPDATE ON public.analysis_record FOR EACH ROW EXECUTE FUNCTION audit.if_modified_func('true');


--
-- TOC entry 5157 (class 2620 OID 969146)
-- Name: analysis_record audit_trigger_stm; Type: TRIGGER; Schema: public; Owner: -
--

-- CREATE TRIGGER audit_trigger_stm AFTER TRUNCATE ON public.analysis_record FOR EACH STATEMENT EXECUTE FUNCTION audit.if_modified_func('true');


--
-- TOC entry 5155 (class 2620 OID 967141)
-- Name: analysis_record notify_new_order; Type: TRIGGER; Schema: public; Owner: -
--

-- CREATE TRIGGER notify_new_order AFTER INSERT ON public.analysis_record FOR EACH ROW EXECUTE FUNCTION public.notify_new_order();


--
-- TOC entry 5148 (class 2606 OID 967142)
-- Name: ev_finished ev_finished_analysis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ev_finished
    ADD CONSTRAINT ev_finished_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES public.analysis_record(analysis_id);


--
-- TOC entry 5149 (class 2606 OID 967147)
-- Name: ev_info ev_info_analysis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ev_info
    ADD CONSTRAINT ev_info_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES public.analysis_record(analysis_id);


--
-- TOC entry 5150 (class 2606 OID 967152)
-- Name: ev_stranded ev_stranded_analysis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ev_stranded
    ADD CONSTRAINT ev_stranded_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES public.analysis_record(analysis_id);


--
-- TOC entry 5151 (class 2606 OID 967157)
-- Name: evse_power_draw evse_power_draw_analysis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_power_draw
    ADD CONSTRAINT evse_power_draw_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES public.analysis_record(analysis_id);


--
-- TOC entry 5152 (class 2606 OID 967162)
-- Name: evse_util evse_util_analysis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evse_util
    ADD CONSTRAINT evse_util_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES public.analysis_record(analysis_id);


--
-- TOC entry 5153 (class 2606 OID 967167)
-- Name: evtrip_scenarios evtrip_scenarios_analysis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evtrip_scenarios
    ADD CONSTRAINT evtrip_scenarios_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES public.analysis_record(analysis_id);


--
-- TOC entry 5154 (class 2606 OID 967172)
-- Name: wa_trip_inf wa_trip_inf_road_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wa_trip_inf
    ADD CONSTRAINT wa_trip_inf_road_id_fkey FOREIGN KEY (road_id) REFERENCES public."WA_roads"(id);


--
-- TOC entry 5299 (class 0 OID 0)
-- Dependencies: 11
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

-- GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2020-08-13 15:53:41 PDT

--
-- PostgreSQL database dump complete
--

