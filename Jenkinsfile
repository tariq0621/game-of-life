pipeline {
    agent any
    stages {
        stage("Git Checkout") {
            environment {
                JAVA_PATH = "/usr/lib/jvm/java-8-openjdk-amd64/jre"
                PATH = "${env.PATH}:/usr/share/maven/bin:${JAVA_PATH}/bin"
            }
            steps {
                sh "mvn -v // Check Maven version to ensure it's available
            }
        }
    }
}
