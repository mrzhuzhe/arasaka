.PHONY:	init,clean
build:
	mvn package
init:
	mvn archetype:generate
#mvn -B archetype:generate -DgroupId=com.zztest  -DartifactId=zztest -DarchetypeArtifactId=maven-archetype-quickstart
test:
	java -cp target/zztest-1.0-SNAPSHOT.jar com.zztest.App
# https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html
clean:
	rm -rf *.class
