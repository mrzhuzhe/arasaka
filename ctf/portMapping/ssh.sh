1. remote port forward 
```
ssh -R 8888:127.0.0.1:9100 -p 2222 sanszhu@10.10.17.229 

ssh -o StrictHostKeyChecking=no -i ./test.pub  -R 8888:127.0.0.1:9100 -p 2222 sanszhu@10.10.17.229 
```