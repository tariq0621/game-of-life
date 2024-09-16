pipeline {
    agent any
    stages {
        stage("Git Checkout") {
            steps {
              git changelog: false, credentialsId: 'gittoken', poll: false, url: 'https://github.com/tariq0621/game-of-life.git'
            }
        }
        stage('Build Stage') {
            environment { 
                JAVA_HOME = "/usr/lib/jvm/java-8-openjdk-amd64"
                PATH = "${JAVA_HOME}/bin:/opt/maven3.9/bin:${env.PATH}"
            }
            steps {
                sh "mvn clean package"
            }
        }
        stage("Docker Build and Deploy") {
         
            steps {
                sh "docker build -t tariq908/gol:1 ."
                sh "docker run -d --name gol1 -p 9000:8080 tariq908/gol:1"
            }
        }
        stage("Docker Push to DockerHub") {
            steps {
                   withCredentials([usernameColonPassword(credentialsId: 'dockerhubtoken', variable: 'dockerpwd')]) {              
                    echo $dockerpwd | docker login -u tariq908 --password-stdin
                    sh "docker push tariq908/gol:1"
                }
            }
        }
    }
}

