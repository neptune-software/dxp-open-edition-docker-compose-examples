FROM mcr.microsoft.com/mssql/server:2019-latest

USER root

COPY . .
RUN chmod +x ./import-data.sh
RUN chmod +x ./entrypoint.sh
RUN chmod +x ./healthcheck.sh
RUN chmod +x /opt/mssql-tools/bin/sqlcmd

USER mssql

ENTRYPOINT /bin/bash ./entrypoint.sh
