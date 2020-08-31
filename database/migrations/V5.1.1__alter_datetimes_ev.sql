-- Alter datetime data-type in eviabm simulation tables 

-- ev_finished
ALTER TABLE ev_finished ALTER COLUMN fin_ts TYPE TIMESTAMPTZ USING fin_ts::timestamp with time zone;
ALTER TABLE ev_finished ALTER COLUMN fin_ts SET DEFAULT now();

-- ev_info 
ALTER TABLE ev_info ALTER COLUMN simulation_ts TYPE TIMESTAMPTZ USING simulation_ts::timestamp with time zone;
ALTER TABLE ev_info ALTER COLUMN simulation_ts SET DEFAULT now();

-- ev_stranded
ALTER TABLE ev_stranded ALTER COLUMN stranded_ts TYPE TIMESTAMPTZ USING stranded_ts::timestamp with time zone;
ALTER TABLE ev_stranded ALTER COLUMN stranded_ts SET DEFAULT now();

-- evse_evs_passed
ALTER TABLE evse_evs_passed ALTER COLUMN simulation_ts TYPE TIMESTAMPTZ USING simulation_ts::timestamp with time zone;
ALTER TABLE evse_evs_passed ALTER COLUMN simulation_ts SET DEFAULT now();

-- evse_power_draw
ALTER TABLE evse_power_draw ALTER COLUMN simulation_ts TYPE TIMESTAMPTZ USING simulation_ts::timestamp with time zone;
ALTER TABLE evse_power_draw ALTER COLUMN simulation_ts SET DEFAULT now();

