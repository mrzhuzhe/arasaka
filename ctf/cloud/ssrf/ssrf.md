1. python Hexadecimal url encode

https://owasp.org/www-community/Double_Encoding


2. ncat 307
```
# 200
while true; do printf "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\nConnection: close\r\n\r\n<h1>Hello from Netcat!</h1>\r\n" | nc -l 127.0.0.1 8080; done

# 307 notice -N mean shutdown when eof
printf "HTTP/1.1 307 OK\r\nContent-Type: text/plain\r\nlocation: https://starofus.xyz\r\nConnection: close\r\n" | nc -Nlvnp 8080

```