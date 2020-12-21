-- Delete nodes causing disconnected islands.

DELETE from wa_roads_ferries_vertices_pgr where id in (2568, 2569, 2559, 2560, 2561, 2562);

DELETE FROM wa_roads_ferries where source in (2568, 2569, 2559, 2560, 2561, 2562);

