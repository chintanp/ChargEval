-- CREATE uniqwue index on table
create unique index unique_geom_index on trip_map (md5(geom::TEXT));