-- Delete few pars causing UI issues 
DELETE FROM sim_params
WHERE param_name IN ('start_time', 'end_time', 'sim_start_date', 'sim_end_date');