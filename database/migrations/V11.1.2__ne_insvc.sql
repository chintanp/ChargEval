-- Add in_service column to new EVSES
ALTER TABLE new_evses
ADD COLUMN in_service boolean;