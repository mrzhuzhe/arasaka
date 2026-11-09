# RoadMap

## Steps 
### Recon
1. Scan port , subdomain, subdir
2. Find form, login , render page , upload
3. Entry mail, Git, Kisosk, wifi sniff
4. SMB ldap entry enumerate

## APP analysis
1. Method SSRF, SSTI, deserilize, XXE, XSS, CORS, JWT forge
2. Misconfig, nginx, php folder traversal
3. APP CVE
4. APP kind
    - CICD 
    - Mail
    - Printer
    - Kisosk
    - LDAP
    - torch or tensorflow
    - MCP workflow, Jupyter Notebook
    - java
    - nodejs, php
    - aws , azura
5. sql inject

## privelege escape
1. internel app , custom app
2. port amd proccess
3. cron.d /etc/systemd/system
4. ip neigh / rdp wmi
5. grep -ri password /etc/ /var/ /opt
6. container 
    - /proc/self/environ
    - /proc/mounts
    - nosuid shared folder traversal
7. reverse engineering
8. windows internal relay attack .etc
9. loot mailbox, memory dump
10. suid 4775 chmod u+s 
11. sudo -l 
12. php-gfx


# Knowlege
1. OWASP enum and payload everything
2. history challenge
3. ldap kerberos impacket ad dc forest
4. windows reversing
5. MITRE AT@TK
6. Misconfigure checklist

# TODOs



# DONE
1. create a internal VMs bridge network for experiment
2. change nic from user to passt
3. experiment and install a enum tools 
4. test copyfail
5. core_pattern crash handle
6. codebuild override environment variable get root in container

# Some Drawback and thought
1. too rely on imformation
2. not enough experiments for enumation
3. not about system level tool development 
4. what about some other not web ctf
5. maybe a summary of all machines
6. how to make it quick, maybe more focus or still just follow and explore or explore all
7. what about weaknessers position