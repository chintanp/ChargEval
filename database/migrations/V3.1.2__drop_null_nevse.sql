-- This migration removes the NOT NULL constraint from 'input_evse_id' column -- of table new_evses

ALTER TABLE new_evses ALTER COLUMN input_evse_id DROP NOT NULL;