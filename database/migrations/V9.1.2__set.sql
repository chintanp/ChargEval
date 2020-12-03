-- Create new table set 
CREATE TABLE analysis_sets (
    set_id serial primary key, 
    description text
);

ALTER TABLE analysis_record ADD COLUMN set_id integer DEFAULT 0;

-- CREATE TABLE analysis_sets_record_xref (
--     set_id integer NOT NULL, 
--     analysis_id integer NOT NULL, 
--     CONSTRAINT fk_set
--       FOREIGN KEY(set_id) 
-- 	  REFERENCES analysis_sets(set_id), 
--     CONSTRAINT fk_record
--       FOREIGN KEY(analysis_id) 
-- 	  REFERENCES analysis_record(analysis_id)
-- );