UPDATE sim_params
SET param_lower_bound = 10, 
param_upper_bound = 500
where param_name = 'critical_distance_miles';

UPDATE sim_params
SET param_lower_bound = 50, 
param_upper_bound = 100
where param_name = 'soc_lower_limit_pc';

UPDATE sim_params
SET param_lower_bound = 80, 
param_upper_bound = 100
where param_name = 'soc_upper_limit_pc';

UPDATE sim_params
SET param_lower_bound = '00:00:00', 
param_upper_bound = '12:00:00'
where param_name = 'start_time';

UPDATE sim_params
SET param_lower_bound = '12:00:00', 
param_upper_bound = '23:59:00'
where param_name = 'end_time';

UPDATE sim_params
SET param_lower_bound = '2019-05-01', 
param_upper_bound = '2020-05-01'
where param_name = 'sim_start_date';

UPDATE sim_params
SET param_lower_bound = '2019-05-01', 
param_upper_bound = '2020-05-01'
where param_name = 'sim_end_date';

UPDATE sim_params
SET param_lower_bound = '10', 
param_upper_bound = '120'
where param_name = 'avg_trip_speed_mph';

UPDATE sim_params
SET param_lower_bound = '2', 
param_upper_bound = '500'
where param_name = 'avg_rental_car_cost_usd';

UPDATE sim_params
SET param_lower_bound = '2', 
param_upper_bound = '100'
where param_name = 'avg_fuel_economy_rental_mpg';

UPDATE sim_params
SET param_lower_bound = '2', 
param_upper_bound = '100'
where param_name = 'avg_fuel_economy_own_mpg';

UPDATE sim_params
SET param_lower_bound = '1', 
param_upper_bound = '100'
where param_name = 'avg_restroom_spacing_miles';

UPDATE sim_params
SET param_lower_bound = '1', 
param_upper_bound = '100'
where param_name = 'lookup_distance_miles';

UPDATE sim_params
SET param_lower_bound = '1', 
param_upper_bound = '60'
where param_name = 'timestep_mins';

UPDATE sim_params
SET param_lower_bound = '1', 
param_upper_bound = '60'
where param_name = 'reconsider_charging_time_mins';

UPDATE sim_params
SET param_lower_bound = '60', 
param_upper_bound = '100'
where param_name = 'soc_max_pc';

UPDATE sim_params
SET param_lower_bound = '0', 
param_upper_bound = '30'
where param_name = 'soc_min_pc';

UPDATE sim_params
SET param_lower_bound = '30', 
param_upper_bound = '90'
where param_name = 'min_soc_charging_pc';

UPDATE sim_params
SET param_lower_bound = '5', 
param_upper_bound = '50'
where param_name = 'max_soc_charging_pc';

UPDATE sim_params
SET param_lower_bound = '50', 
param_upper_bound = '10000'
where param_name = 'block_size_m';