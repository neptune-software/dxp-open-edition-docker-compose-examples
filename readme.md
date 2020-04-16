# Planet 9 Docker Compose Examples

All templates start 3 Docker Containers:
* [Planet 9](https://community.neptune-software.com/documentation/planet9)
* [PostgreSQL](https://www.postgresql.org/)
* [Adminer](https://www.adminer.org/) (Web SQL Client to view/admin the PostgreSQL DB)

Planet 9 starts with a PostgreSQL Server which is initialized with 
a DB `planet9` with a schema `planet9`. The DB is data is mounted to a volume,
therefore the data will persists for the same Planet 9 version.

## Start specific version

* Clone this repo
* Navigate to the folder with the Planet 9 version you'd like to run.
* Run `docker-compose up` in the targeted version number.
* Access Planet 9 via `localhost:8080`
* Access your DB GUI via `localhost:3000`
* Run `docker-compose down` to stop all docker images

Might only work for `OSX` and `Linux` (not tested on Windows.)
