pipeline {
    agent any
    stages {
        
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/Sasha-Due/spring-webapp.git']]])
            }
        }

        stage('Execute Maven') {
           steps {

                sh 'mvn clean install'
           }
        }

        stage('Docker Build and Tag') {
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

        stage('Run Docker container on Remote') {
            steps {
                sh 'docker -H tcp://107.21.59.88:4243 run -d -p 8003:8080 spring-webapp'
            }
        }
    
    }
}