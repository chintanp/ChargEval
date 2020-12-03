ALTER TABLE ONLY analysis_record ALTER COLUMN set_id SET DEFAULT currval('analysis_sets_set_id_seq');

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