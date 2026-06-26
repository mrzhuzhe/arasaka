1. Install-WindowsFeature -name Web-Server -IncludeManagementTools
2. 

echo -e 'HTTP/1.1 200 OK\r\n https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/96f71ebf-d93a-4a10-80af-5c5380af81f5/MicrosoftEdgeEnterpriseX64.msi' | nc -lp 8000

curl -o test.msi https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/96f71ebf-d93a-4a10-80af-5c5380af81f5/MicrosoftEdgeEnterpriseX64.msi