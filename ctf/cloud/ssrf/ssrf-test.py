import requests

# fuzz
#url = 'http://1.2.3.4@127.0.0.1:4444'
# data={'key':'value'}
# response = requests.post(url, data=data)

# print(response.text)


# 307
url2 = 'http://127.0.0.1:8080'
response2 = requests.get(url2)

print(response2.text)