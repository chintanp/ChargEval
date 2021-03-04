BEGIN;
DROP TRIGGER IF EXISTS trigger_trip_generation on analysis_record;
CREATE TRIGGER trigger_trip_generation
    AFTER UPDATE ON analysis_record
    FOR EACH ROW
    WHEN ((OLD.status IS DISTINCT FROM NEW.status) AND (NEW.status = 'trips_generated'))
EXECUTE FUNCTION notify_trips_generated();

DROP TRIGGER IF EXISTS trigger_solved on analysis_record;
CREATE TRIGGER trigger_solved
    AFTER UPDATE ON analysis_record
    FOR EACH ROW
    WHEN ((OLD.status IS DISTINCT FROM NEW.status) AND (NEW.status = 'solved'))
EXECUTE FUNCTION notify_solved();
COMMIT;