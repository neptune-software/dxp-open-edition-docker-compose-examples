FROM library/postgres
ENV POSTGRES_USER docker
ENV POSTGRES_PASSWORD docker
ENV POSTGRES_DB planet9
COPY init.sql /docker-entrypoint-initdb.d/