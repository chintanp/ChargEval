FROM pgrouting/pgrouting:12-3.0-3.1.0

# Variables needed at runtime to configure postgres and run the initdb scripts
ENV POSTGRES_DB ''
ENV POSTGRES_USER ''
ENV POSTGRES_PASSWORD ''

COPY load-extensions.sh /docker-entrypoint-initdb.d/