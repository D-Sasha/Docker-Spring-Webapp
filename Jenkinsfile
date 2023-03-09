pipeline {
    agent {
        docker {
            image 'maven:3.6.3-jdk-8'
            args '-v $HOME/.m2:/root/.m2'
        }
    }

    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Dockerize') {
            steps {
                script {
                    def dockerImage = docker.build("myapp:${env.BUILD_ID}")
                }
            }
        }
        
        stage('Deploy to Tomcat') {
            steps {
                script {
                    sshagent(['deployuser']) {
                        sh "scp -o StrictHostKeyChecking=no target/webapptest.war ubuntu@13.231.243.154:/usr/local/tomcat/webapps/webapptest.war"
                    }
                }
            }
        }
        
        stage('Test') {
            steps {
                script {
                    sh 'curl http://13.231.243.154:8080/webapptest/home'
                }
            }
        }
        
        stage('Cleanup') {
            steps {
                sh 'docker image prune -f'
            }
        }
    }
}
