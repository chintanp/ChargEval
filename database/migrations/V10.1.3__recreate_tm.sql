-- DROP the table and recreate it, since we ran the analysis incompletely. 
-- May not be needed for others 

DROP table trip_map; 

-- DROP index unique_geom_index;

-- TABLE trip_map 
CREATE TABLE trip_map (
    trip_count integer, 
    od_pairs text, 
    length double precision, 
    gid serial primary key, 
    geom geometry
);

-- CREATE unique index on table
create unique index unique_geom_index on trip_map (md5(geom::TEXT));