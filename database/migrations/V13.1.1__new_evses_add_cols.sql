-- Add new columns to new_evses 
ALTER TABLE new_evses 
ADD COLUMN station_type VARCHAR(20) DEFAULT 'new',  -- store whether new or an upgrade
ADD COLUMN comments text;  -- store the station ID when type is upgrade