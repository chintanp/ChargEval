-- Set the default of column analysis_id in analysis_params as currval
ALTER TABLE ONLY analysis_params ALTER COLUMN analysis_id SET DEFAULT currval('analysis_record_analysis_id_seq');