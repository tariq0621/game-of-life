pipeline {
    agent any
    stages {
        stage("Git Checkout") {
            
            steps {
                environment {
                JAVA_PATH = "/usr/lib/jvm/java-8-openjdk-amd64"
                PATH = "${env.PATH}:/usr/share/maven/bin:${JAVA_PATH}/bin"
            }
                sh "mvn -v"  // Check Maven version to ensure it's available
            }
        }
    }
}
