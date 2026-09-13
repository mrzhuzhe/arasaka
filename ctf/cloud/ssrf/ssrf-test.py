import requests

url = 'http://1.2.3.4@127.0.0.1:4444'
data={'key':'value'}
response = requests.post(url, data=data)

print(response.text)