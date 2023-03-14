pipeline {
    agent any
    stages {

        stage('Pull Sources') {
            steps {
             git url: 'https://github.com/Sasha-Due/spring-webapp.git'
            }
         }
        

        /*
        stage('Execute Maven') {
           steps {
             
                sh 'mvn package'             
          }
        }
        */
        
       stage('Docker Build and Tag'){
            steps {
                sh 'docker build -t spring-webapp .'
            }
       }

       /*
       stage('Run Docker container on Jenkins'){
            steps {
                sh 'docker run -p 8003:8080 spring-webapp'
            }
       }
        */

        stage('Run Docker container on Remote'){
            steps {
                sh "docker -H tcp://107.21.59.88:2375 run -d -p 8003:8080 spring-webapp"
            }
       }
	    
    }
}
