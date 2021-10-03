echo "Start import-data.sh";
#sleep 20

for i in {1..50};
do
    echo "Attempt import-data.sh $i";

    /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -d master -i setup.sql
    if [ $? -eq 0 ]
    then
        echo "setup.sql completed"
        break
    else
        echo "not ready yet..."
        sleep 1
    fi
done

echo "Finished with import-data.sh";

