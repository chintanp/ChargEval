-- Create a table EVSEs now to store all the EVSEs for the simulation
CREATE TABLE public.evses_now (
    evse_id integer NOT NULL,
    analysis_id integer NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    dcfc_plug_count integer NOT NULL,
    dcfc_power integer,
    level2_plug_count integer,
    level2_power numeric,
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