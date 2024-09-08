pipeline{
    agent any
    stages{
        stage("Git Checkout") {
            steps {
                git credentialsId: 'githubtoken', poll: false, url: 'https://github.com/tariq0621/game-of-life.git'
            }
        }
        stage("build stage") {
          
          environment { 
               JAVA_HOME = "/usr/lib/jvm/java-8-openjdk-amd64"
               PATH = "${JAVA_HOME}/bin:/usr/share/maven/bin:${env.PATH}"
               }
        steps{
               sh "mvn -v"
            }
         
            
        }
    }
}