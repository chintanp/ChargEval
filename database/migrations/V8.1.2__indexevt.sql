CREATE INDEX evts_aid_idx ON evtrip_scenarios (analysis_id);

CREATE INDEX estr_aid_idx ON ev_stranded (analysis_id);

CREATE INDEX ecs_aid_idx ON evse_charging_session (analysis_id);

CREATE INDEX ews_aid_idx ON evse_evs_waiting (analysis_id);

CREATE INDEX epd_aid_idx ON evse_power_draw (analysis_id);

CREATE INDEX eutil_aid_idx ON evse_util (analysis_id);
