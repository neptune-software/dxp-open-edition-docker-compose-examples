SCHEMA_COUNT="$(/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d planet9 -Q 'set nocount on;Select count(1) from sys.schemas where name = "planet9"' -h -1 | awk '{$1=$1};1')"

if [[ $SCHEMA_COUNT -eq '1' ]]; then
    echo "Healthcheck: Running"
	exit 0;
fi
echo "Healthcheck: Not Running"
exit 1;
