pipeline{
    agent any
    environment{
        JAVA_PATH=/usr/lib/jvm/java-8-openjdk-amd64/jre
        PATH="$PATH:/usr/share/maven/bin:$JAVA_PATH/bin"
    }
    stages{
        stage("git checkout"){
            steps{
                sh "ls -ltr"
            }
        }
    }
}