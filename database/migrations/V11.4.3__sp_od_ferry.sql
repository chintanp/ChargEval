-- This function returns the shortest path geometry between origin and destination zip (as ints) for road network including ferries

CREATE FUNCTION public.sp_od_ferry(orig integer, dest integer) RETURNS TABLE(shortest_path public.geometry)
    LANGUAGE sql ROWS 1
    AS $$

  select st_makeline((case when node = source then geom else ST_Reverse(geom) end))  FROM pgr_dijkstra(
    'SELECT id, source, target, evdist as cost FROM public.wa_roads_ferries',
    (SELECT source FROM public."wa_roads_ferries"
     ORDER BY ST_StartPoint(geom) <->
         (select ST_SetSRID(ST_MakePoint(CAST(longitude as double precision), CAST(latitude as double precision)), 4326) from zipcode_record where zip = CAST(orig as text) LIMIT 1) ASC
    LIMIT 1),
    (SELECT source FROM public."wa_roads_ferries"
     ORDER BY ST_StartPoint(geom) <->
         (select ST_SetSRID(ST_MakePoint(CAST(longitude as double precision), CAST(latitude as double precision)), 4326) from zipcode_record where zip = CAST(dest as text) LIMIT 1) ASC
    LIMIT 1), directed := false
 ) as sp
 JOIN public."wa_roads_ferries" rd ON sp.edge = rd.id;
 $$;

CREATE FUNCTION public.sp_len_ferry(orig integer, dest integer) RETURNS TABLE(shortest_path_length double precision)
    LANGUAGE sql ROWS 1
    AS $$

 SELECT sum(evdist) as shortest_path_length -- Convert length to miles
 FROM pgr_dijkstra(
    'SELECT id, source, target, evdist as cost FROM public."wa_roads_ferries"',
    (SELECT source FROM public."wa_roads_ferries"
     ORDER BY ST_StartPoint(geom) <->
         (select ST_SetSRID(ST_MakePoint(CAST(longitude as double precision), CAST(latitude as double precision)), 4326) from zipcode_record where zip = CAST(orig as text) LIMIT 1) ASC
    LIMIT 1),
    (SELECT source FROM public."wa_roads_ferries"
     ORDER BY ST_StartPoint(geom) <->
         (select ST_SetSRID(ST_MakePoint(CAST(longitude as double precision), CAST(latitude as double precision)), 4326) from zipcode_record where zip = CAST(dest as text) LIMIT 1) ASC
    LIMIT 1), directed := false
 ) as pt
 JOIN public."wa_roads_ferries" rd ON pt.edge = rd.id;

 $$;