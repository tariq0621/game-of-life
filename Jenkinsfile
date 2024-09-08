pipeline {
    agent any
    stages {
        stage("Git Checkout") {
            steps {
                git credentialsId: 'github', poll: false, url: 'https://github.com/tariq0621/game-of-life.git'
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
                    mvn clean package
                    echo "now java 8 is shown"
                   """
            }
        }
        stage('Deploy Stage') {
            steps {
                sshagent(credentials: ['sshid']) {
                    // Exact path to the WAR file is needed, no wildcards
                    sh 'scp -o StrictHostKeyChecking=no gameoflife-web/target/gameoflife.war ubuntu@172.31.10.209:/tmp'
                    
                    // SSH and execute 'mv' command on the remote server
                    sh '''
                        ssh -o StrictHostKeyChecking=no ubuntu@172.31.10.209 '
                        sudo mv /tmp/gameoflife.war /opt/tomcat/webapps/
                        '
                    '''
                }
            }
        }
    }
}