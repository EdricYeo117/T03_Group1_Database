@echo off
@echo Executing SQL Scripts

:: Change address below to where this bat file is located
cd /d C:\Users\zekke\Desktop\T03_Group1_DBAssignment\T03_Group1_DBAssignment_SQLQueries

:: Change -s to system's server name , change -d to database name where you want the tables to be created in.

for %%f in (DDL\*.sql) do (
    sqlcmd -S DESKTOP-RGHQSD1\SQLEXPRESS -d MyCondoApp -E -i "%%f"
)

for %%f in (DML\*.sql) do (
    sqlcmd -S DESKTOP-RGHQSD1\SQLEXPRESS -d MyCondoApp -E -i "%%f"
)

PAUSE