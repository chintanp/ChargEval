ALTER TABLE sim_params ADD COLUMN param_type text;

INSERT INTO sim_params (param_name, param_value, param_type) VALUES 
('global_seed', '123', 'global'), 
('critical_distance_miles', '70', 'global'),
('soc_lower_limit_pc', '80', 'tripgen'),
('soc_upper_limit_pc', '100', 'tripgen'),
('start_time', '06:00:00', 'tripgen'),
('end_time', '22:00:00', 'tripgen'),
('sim_start_date', '2019-07-01', 'tripgen'),
('sim_end_date', '2019-08-01', 'tripgen'),
('avg_trip_speed_mph', '40', 'tripgen'),
('avg_rental_car_cost_usd', '50', 'tripgen'),
('avg_fuel_economy_rental_mpg', '25', 'tripgen'),
('avg_fuel_economy_own_mpg', '23', 'tripgen'),
('avg_restroom_spacing_miles', '20', 'tripgen'),
('lookup_distance_miles', '10', 'global'),
('timestep_mins', '1', 'eviabm'),
('reconsider_charging_time_mins', '10', 'eviabm'),
('soc_max_pc', '80', 'eviabm'),
('soc_min_pc', '0', 'eviabm'),
('min_soc_charging_pc', '60', 'eviabm'),
('max_soc_charging_pc', '20', 'eviabm'),
('block_size_m', '200', 'eviabm');

-- Create table analysis_params to store analysis parameters
CREATE TABLE analysis_params (
  ap_id serial primary key, 
  analysis_id integer, 
  param_id integer, 
  CONSTRAINT fk_sim_parmas
    FOREIGN KEY(param_id) 
    REFERENCES sim_params(param_id), 
  CONSTRAINT fk_analysis_record
    FOREIGN KEY(analysis_id) 
    REFERENCES analysis_record(analysis_id)
);
