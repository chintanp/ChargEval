-- TABLE trip_map 
CREATE TABLE trip_map (
    trip_count integer, 
    od_pairs text, 
    length double precision, 
    gid serial primary key, 
    geom geometry
);