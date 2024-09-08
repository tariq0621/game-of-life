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
               sh "mvn clean package"
            }   
        }
        stage("deploy environment") {
            steps {
                 sshagent(['sshid']) {
                 sh '''
                    scp -o StrictHostKeyChecking=no gameoflife-web/target/gameoflife.war ubuntu@172.31.10.209:/tmp'
                    ssh -o StrictHostKeyChecking=no ubuntu@172.31.10.209
                    mv /tmp/gameoflife.war /opt/tomcat/webapps

                    '''
}           
                 }
        }
    }
}