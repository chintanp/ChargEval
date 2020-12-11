-- CREATE trip_infeasibility tables

-- TABLE trip_infeasibility_chademo
CREATE TABLE trip_infeasibility_chademo (
    trip_count integer, 
    od_pairs text, 
    length double precision, 
    gid serial primary key, 
    geom geometry
);

-- CREATE unique index on table
create unique index unique_geom_index_chademo on trip_infeasibility_chademo (md5(geom::TEXT));

-- TABLE trip_infeasibility_combo
CREATE TABLE trip_infeasibility_combo (
    trip_count integer, 
    od_pairs text, 
    length double precision, 
    gid serial primary key, 
    geom geometry
);

-- CREATE unique index on table
create unique index unique_geom_index_combo on trip_infeasibility_combo (md5(geom::TEXT));