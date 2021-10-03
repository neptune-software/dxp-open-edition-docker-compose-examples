# DXP Open Edition Docker Compose Examples

All templates start 3 Docker Containers:
* [DXP Open Edition](https://community.neptune-software.com/documentation/planet9)
* [PostgreSQL](https://www.postgresql.org/)
* [Adminer](https://www.adminer.org/) (Web SQL Client to view/admin the PostgreSQL DB)

DXP Open Edition starts with a PostgreSQL Server which is initialized with 
a DB `planet9` with a schema `planet9`. The DB is data is mounted to a volume,
therefore the data will persists for the same DXP Open Edition version.

## Start specific version

* Clone this repo
* Navigate to the folder with the DXP Open Edition version you'd like to run.
* Run `docker-compose up` in the targeted version number.
* Access DXP Open Edition via `localhost:8080`
* Access your DB GUI via `localhost:3000`
* Run `docker-compose down` to stop all docker images

Might only work for `OSX` and `Linux` (not tested on Windows.)

## Run locally with MS SQL

To run locally DXP Open Edition with MSSQL, some other steps are required to run locally.

### Using Docker Compose

IMPORTANT: Volume binding is not supported on Mac!

1. Build locally the docker image for MS SQL which creates a default `planet9` database and `planet9` schema.
```sh
cd v21.6.4-mssql
docker build -f docker-image/Dockerfile docker-image -t localmssql:latest --no-cache 
```
2. Now we can run our docker compose command.
```sh
docker-compose up
```

3. When you start for the first time, the database needs to be initialized and Planet 9 will faill to connect (as the DB is still beinig initialized). If you see the following message in the output:
    ```sh
    db_1       | setup.sql completed
    db_1       | Finished with import-data.sh
    db_1       | 2021-10-03 15:10:37.14 spid28s     The tempdb database has 4 data file(s).
    ```
    Just run `docker-compose up` once more in the same folder from another terminal window.

### Using Docker CLI

1. Build locally the docker image for MS SQL which creates a default `planet9` database and `planet9` schema.
```sh
cd v21.6.4-mssql
docker build -f docker-image/Dockerfile docker-image -t localmssql:latest --no-cache 
```
2. Create a docker network
```sh
NETWORK_ID=$(docker network create my_network)
```
3. Start the MS SQL database
```sh
docker run --network $NETWORK_ID \
    -e ACCEPT_EULA=Y \
    -e MSSQL_PID=Developer \
    -e SA_PASSWORD="m8p@assworD" \
    --name MSSQL \
    --hostname db-server \
    localmssql:latest
```
4. Start a new shell for DXP Open Edition
```sh
NETWORK_ID=$(docker network ls --filter NAME=my_network -q)
docker run --network "$NETWORK_ID" \
    -e DB_TYPE=mssql \
    -e DB_MSSQL_HOST=db-server \
    -e DB_MSSQL_USER=sa \
    -e DB_MSSQL_PASSWORD="m8p@assworD" \
    -p 8080:8080 \
    neptunesoftware/planet9:v2.6.4
```
5. Open DXP Open Edition via `localhost:8080`

Don't forget to clean up respources!