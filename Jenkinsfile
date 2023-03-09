pipeline {
  agent any
  stages {
    stage('Welcome') { 
      steps { 
        echo 'This is a DevOps pipeline created by Sasha' 
      }
    }
    stage('Build and Package') {
      steps {
        sh 'docker build -t webapptest .'
        sh 'docker run -d -p 8080:8080 webapptest'
      }
    }
    stage ('Deploy') {
      steps {
        sshagent(['deployuser']) {
          sh "scp -o StrictHostKeyChecking=no target/webapptest.war ubuntu@54.92.220.219:/usr/local/tomcat/webapps/webapptest.war"
        }
      }
    }
  }
}

