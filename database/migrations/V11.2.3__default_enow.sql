-- Set the default value of column analysis_id in evses_now as currval
ALTER TABLE ONLY evses_now ALTER COLUMN analysis_id SET DEFAULT currval('analysis_record_analysis_id_seq');