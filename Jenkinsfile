pipeline {
    agent any
    stages {
        
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/Sasha-Due/spring-webapp.git']]])
            }
        }

        stage('Maven Install') {
           agent {
              docker {
                 image 'maven:3.5.0'
              }
           }
           steps {
                sh 'mvn clean install'
           }
        }

        stage('Docker Build and Tag') {
            steps {
                sh 'docker build -t spring-webapp .'
            }
        }

        stage('Run Docker container on Remote') {
            steps {
                sh 'docker -H tcp://107.21.59.88:2375 run -d -p 8003:8080 spring-webapp'
            }
        }
    }
}