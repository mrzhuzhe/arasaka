SHOW DATABASES;

mysql -u USERNAME -pPASSWORD -h HOSTNAMEORIP DATABASENAME -e "SHOW TABLES"

SELECT user FROM mysql.user;

# TODO mysql udf hijacking https://github.com/koparmalbaris/MySQL-UDF-Exploitation

# /etc/mysqlaccess.conf
mysql -u root -e "SHOW DATABASES;"