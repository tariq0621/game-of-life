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
                PATH = "${JAVA_HOME}/bin:/usr/share/maven/bin:${env.PATH}"
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
                    sh "docker login -u tariq908 -p ${dockerpwd}"
                    sh "docker push tariq908/gol:1"
                }
            }
        }
    }
}

