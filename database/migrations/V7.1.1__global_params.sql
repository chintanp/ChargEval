-- Global params table

CREATE TABLE sim_params (
    param_id serial primary key, 
    param_name text, 
    param_value text
);

-- Audit the params table

SELECT audit.audit_table('sim_params');