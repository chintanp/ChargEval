-- Implement a primary on evses_now 
ALTER TABLE evses_now ADD PRIMARY KEY(analysis_id, evse_id);