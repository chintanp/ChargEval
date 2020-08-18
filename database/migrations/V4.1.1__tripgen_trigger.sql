-- This is the code for trigger and notification on trip generation 

--
-- Name: notify_trips_generated(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.notify_trips_generated() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
        PERFORM pg_notify('trips_generated', row_to_json(NEW)::text);
        RETURN NULL;
    END; 
$$;


CREATE TRIGGER trigger_trip_generation
AFTER UPDATE ON  analysis_record
FOR EACH ROW
WHEN (NEW.status = 'trips_generated')
EXECUTE FUNCTION notify_trips_generated();


