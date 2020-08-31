#!/bin/sh

# You could probably do this fancier and have an array of extensions
# to create, but this is mostly an illustration of what can be done

psql -v ON_ERROR_STOP=1 -d "$POSTGRES_DB" -U "$POSTGRES_USER" <<EOF
create extension PostGIS;
create extension pgrouting;
create extension hstore;
select * FROM pg_extension;
EOF