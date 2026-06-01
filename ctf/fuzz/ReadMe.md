# fuzz for subdomain
1. ./ffuf -w xxx.txt -u http://FUZZ.starofus.xyz  -H "Host: FUZZ.starofus.xyz" -mc all
2. ./ffuf -w DirBuster-2007_directory-list-2.3-small.txt -u http://starofus.xyz/FUZZ.php
