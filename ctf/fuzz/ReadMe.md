# fuzz for subdomain
1. ./ffuf -w common.txt -u http://starofus.xyz  -H "Host: FUZZ.starofus.xyz" -fc 301,302 // ignore 301 302

./ffuf -w common.txt -u https://starofus.htb  -H "Host: FUZZ.cohort.htb" -mc all // with all response


2. ./ffuf -w DirBuster-2007_directory-list-2.3-small.txt -u http://starofus.xyz/FUZZ


3. enum ./ffuf -w common.txt -u https://starofus.htb  -H "Host: FUZZ.starofus.htb" -mc 204,301,302,307,401,403,500