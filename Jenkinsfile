pipeline {
    agent any
    stages {
        stage("Git Checkout") {
            steps {
                git credentialsId: 'githubtoken', poll: false, url: 'https://github.com/tariq0621/game-of-life.git'
            }
        }
        stage('Build Stage') {
            environment { 
                JAVA_HOME = "/usr/lib/jvm/java-8-openjdk-amd64"
                PATH = "${JAVA_HOME}/bin:/usr/share/maven/bin:${env.PATH}"
            }
            steps {
                sh """
                    ls -ltr
                    mvn -v
                    echo "now java 8 is shown"
                """
            }
        }
        stage("sshagent") {
            steps {
                sshagent(['sshid']) {
                sh 'ssh -o StrictHostKeyChecking=no /home/ubuntu/shaif ubuntu@172.31.32.102:/tmp'  
            }
            }
        }
  }
  }
