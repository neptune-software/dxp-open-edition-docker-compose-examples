# Readme

Image based on [MS SQL Image](https://hub.docker.com/_/microsoft-mssql-server).

## Environment Variables

* `ACCEPT_EULA`: `Y`
* `MSSQL_PID`: `Developer`
* `SA_PASSWORD`: `<some-complex-password>` (e.g. `m8p@assworD`)

## Authentication

* Username : `sa`
* Password: The value specified for environment variable `SA_PASSWORD`.
