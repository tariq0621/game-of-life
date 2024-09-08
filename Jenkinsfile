pipeline {
    agent any
    stages {
        stage("Git Checkout") {
          steps{
            git credentialsId: 'githubtoken', url: 'https://github.com/tariq0621/game-of-life.git'
          }
          }
          stage("build stage") {
          steps{
            sh "mvn -v" #
          }
          }
    }
}
