@echo off
setlocal enabledelayedexpansion

rem === Stop the SQL Server service ===
net stop MSSQLSERVER

rem === Set source and destination paths ===
rem Replace the paths below with your actual SQL data folder and backup location
set "source_folder=C:\Path\To\SQL_Data_Folder"
set "destination_folder=\\YourNetworkPath\SharedBackupFolder"

rem === Generate folder name based on current date (YYYY-MM-DD) ===
for /f %%i in ('wmic os get localdatetime ^| find "."') do set datetime=%%i
set "date_folder=!datetime:~0,4!-!datetime:~4,2!-!datetime:~6,2!"

rem === Create destination folder with today's date ===
md "%destination_folder%\!date_folder!"

rem === Copy all contents from source to backup folder ===
xcopy "%source_folder%" "%destination_folder%\!date_folder!\" /E /I /Y /C

echo Backup completed successfully to: !destination_folder!\!date_folder!

rem === Restart SQL Server service ===
net start MSSQLSERVER

rem === Restart any other services if needed ===
rem net stop "YourServiceName" & net start "YourServiceName"

endlocal
exit
