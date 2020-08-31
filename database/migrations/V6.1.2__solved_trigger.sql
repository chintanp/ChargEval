-- This is the code for trigger and notification on trip generation 

--
-- Name: notify_trips_generated(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.notify_solved() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
        PERFORM pg_notify('solved', row_to_json(NEW)::text);
        RETURN NULL;
    END; 
$$;


CREATE TRIGGER trigger_solved
AFTER UPDATE ON  analysis_record
FOR EACH ROW
WHEN (NEW.status = 'solved')
EXECUTE FUNCTION notify_solved();


