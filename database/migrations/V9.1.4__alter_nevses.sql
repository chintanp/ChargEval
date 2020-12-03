-- Set the default of column analysis_id in new evses as currval
ALTER TABLE ONLY new_evses ALTER COLUMN analysis_id SET DEFAULT currval('analysis_record_analysis_id_seq');