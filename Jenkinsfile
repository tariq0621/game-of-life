pipeline {
    agent any
    docker {
      image 'docker:stable'
      args '-v /var/run/docker.sock:/var/run/docker.sock'
    }
  }
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
                sh "mvn clean package"
            }
        }
        stage("docker build and deploy stage") {
            steps {
                 sh "docker build -t tariq908/gol:1 ."
                 sh "docker run -d --name gmlife -p 8000:8080 tariq908/gol:1"
                 
                }
            }
            stage("docker image push to dockerhub") {
            steps {
                 withCredentials([string(credentialsId: 'dockertoken', variable: 'dockerpwd')]) {
                 sh "docker login -u tariq908 -p ${dockerpwd}"
                 sh "docker push tariq908/gol:1"
                }
            }
        }
    }

  
  



