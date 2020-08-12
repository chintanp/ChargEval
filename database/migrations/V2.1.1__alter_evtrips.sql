ALTER TABLE evtrip_scenarios ADD COLUMN created_at TIMESTAMPTZ;
ALTER TABLE evtrip_scenarios ALTER COLUMN created_at SET DEFAULT now();