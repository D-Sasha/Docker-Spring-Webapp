pipeline {
    agent any
    stages {

        stage('Pull Sources') {
            steps {
             git url: 'https://github.com/Sasha-Due/spring-webapp.git'
            }
         }
        
        stage('Build') {
            steps {
                sh 'mvn clean install'
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
