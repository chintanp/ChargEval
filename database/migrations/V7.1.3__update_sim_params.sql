ALTER TABLE sim_params 
ADD COLUMN param_lower_bound text, 
ADD COLUMN param_upper_bound text; 

UPDATE sim_params
SET param_lower_bound = 0, 
param_upper_bound = 1000
where param_name = 'global_seed';