#!/bin/bash

unset MYSQL_PASS
unset MYSQL_USER
unset ON_CREATE_DB_1
unset ON_CREATE_DB_2
unset STARTUP_SQL_1
unset STARTUP_SQL_2

MYSQL_PASS="wm_pass"
MYSQL_USER="wm"
ON_CREATE_DB_1="wm_docker"
ON_CREATE_DB_2="wm_docker_long"
STARTUP_SQL_1="/tmp/mw_clear_databases/wm_docker.sql"
STARTUP_SQL_2="/tmp/mw_clear_databases/wm_docker_long.sql"

StartMySQL ()
{
    /usr/bin/mysqld_safe ${EXTRA_OPTS} > /dev/null 2>&1 &
    # Time out in 1 minute
    LOOP_LIMIT=60
    for (( i=0 ; ; i++ )); do
        if [ ${i} -eq ${LOOP_LIMIT} ]; then
            echo "Time out. Error log is shown as below:"
            tail -n 100 ${LOG}
            exit 1
        fi
        echo "=> Waiting for confirmation of MySQL service startup, trying ${i}/${LOOP_LIMIT} ..."
        sleep 1
        mysql -uroot -e "status" > /dev/null 2>&1 && break
    done
}

CreateMySQLUser()
{
	if [ "$MYSQL_PASS" = "**Random**" ]; then
	    unset MYSQL_PASS
	fi

	PASS=${MYSQL_PASS:-$(pwgen -s 12 1)}
	_word=$( [ ${MYSQL_PASS} ] && echo "preset" || echo "random" )
	echo "=> Creating MySQL user ${MYSQL_USER} with ${_word} password"

	mysql -uroot -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '$PASS'"
	mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION"
	echo "=> Done!"
	echo "========================================================================"
	echo "You can now connect to this MySQL Server using:"
	echo ""
	echo "    mysql -u$MYSQL_USER -p$PASS -h<host> -P<port>"
	echo ""
	echo "Please remember to change the above password as soon as possible!"
	echo "MySQL user 'root' has no password but only allows local connections"
	echo "========================================================================"
}

OnCreateDB()
{
    if [ "$ON_CREATE_DB_1" = "**False**" ]; then
        unset ON_CREATE_DB_1
    else
        echo "Creating MySQL database ${ON_CREATE_DB_1}"
        mysql -uroot -e "CREATE DATABASE IF NOT EXISTS ${ON_CREATE_DB_1};"
        echo "Database created!"
    fi

    if [ "$ON_CREATE_DB_2" = "**False**" ]; then
        unset ON_CREATE_DB_2
    else
        echo "Creating MySQL database ${ON_CREATE_DB_2}"
        mysql -uroot -e "CREATE DATABASE IF NOT EXISTS ${ON_CREATE_DB_2};"
        echo "Database created!"
    fi
}

ImportSql_1()
{
    for FILE_1 in ${STARTUP_SQL_1}; do
	    echo "=> Importing SQL file 1 ${FILE_1}"
        if [ "$ON_CREATE_DB_1" ]; then
            mysql -uroot "$ON_CREATE_DB_1" < "${FILE_1}"
        else
            mysql -uroot < "${FILE_1}"
        fi
    done

}

ImportSql_2()
{
 
    for FILE_2 in ${STARTUP_SQL_2}; do
	    echo "=> Importing SQL file 2 ${FILE_2}"
        if [ "$ON_CREATE_DB_1" ]; then
            mysql -uroot "$ON_CREATE_DB_2" < "${FILE_2}"
        else
            mysql -uroot < "${FILE_2}"
        fi
    done
}


echo "=> Starting MySQL ..."
StartMySQL
tail -F $LOG &

# Create admin user and pre create database
if [ -f /var/lib/mysql/.EMPTY_DB ]; then
    echo "=> Creating admin user ..."
    CreateMySQLUser
    OnCreateDB
    rm /var/lib/mysql/.EMPTY_DB
fi


# Import Startup SQL 1
if [ -n "${STARTUP_SQL_1}" ]; then
    if [ ! -f /sql_imported ]; then
        echo "=> Initializing DB with ${STARTUP_SQL_1}"
        ImportSql_1
        touch /sql_imported_1
    fi
fi

# Import Startup SQL 2
if [ -n "${STARTUP_SQL_2}" ]; then
    if [ ! -f /sql_imported ]; then
        echo "=> Initializing DB with ${STARTUP_SQL_2}"
        ImportSql_2
        touch /sql_imported_2
    fi
fi

