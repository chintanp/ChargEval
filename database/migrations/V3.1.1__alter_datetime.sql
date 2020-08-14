-- This will alter the date time columns in certain tables 
ALTER TABLE analysis_record ALTER COLUMN sim_date_time TYPE TIMESTAMPTZ USING sim_date_time::timestamp with time zone;
ALTER TABLE analysis_record ALTER COLUMN sim_date_time SET DEFAULT now();

ALTER TABLE user_details ALTER COLUMN last_submit_date TYPE TIMESTAMPTZ USING last_submit_date::timestamp with time zone;
ALTER TABLE user_details ALTER COLUMN last_submit_date SET DEFAULT now();