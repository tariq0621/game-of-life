pipeline {
    agent any
    stages {
        stage("Git Checkout") {
          steps{
            git credentialsId: 'githubtoken', url: 'https://github.com/tariq0621/game-of-life.git'
          }
          }
          stage('build stage') {
            environment { 
                JAVA_HOME = "/usr/lib/jvm/java-8-openjdk-amd64"
                PATH = "$JAVA_HOME/bin:/usr/share/maven/bin:$PATH"
            }
            steps {
                sh """
                    ls -ltr
                    mvn -v
                    echo "now java 8 is shown"
                    mvn clean package
                   """
             }
             } 
             stage('deploy stage') {
            
            steps {
                sshagent(['sshid']) {
                  sh 'scp -o StrictHostKeyChecking=no **/target/gameoflife.war ubuntu@172.31.37.68:/tmp'
            }
             }
             } 
    }
}