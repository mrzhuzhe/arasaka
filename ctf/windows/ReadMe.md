
# Responder NTLM https://en.wikipedia.org/wiki/File_inclusion_vulnerability
1. https://medium.com/@shubhamsonani/leaking-netntlm-hashes-via-ssrf-using-unc-paths-windows-9c37e17b5041
2. john https://www.openwall.com/john/
3. ../run/john --list=Opencl-devices
4. https://github.com/openwall/john/blob/f514ece8ec4ae5e38ad75aaa322eac86d73dcd76/doc/NETNTLM_README ntlmv2 format 
5. todo test john in gpu device (checked)

6. ruby env setup

7. windows shell https://www.hackingarticles.in/mssql-for-pentester-command-execution-with-xp_cmdshell/

 windows shell search: where /r C:\  ConsoleHost_history.txt

 windows PS search: Get-ChildItem -Path C:\ -Recurse root.txt
