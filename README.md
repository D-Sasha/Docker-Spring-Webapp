# Dockerized Single-Paged Spring Boot Web Application

This SPA (Single-Page App) utilizes Jenkins Pipeline to deploy to a remote host with Docker installed and configured to allow external connection. 

## Explanation

The SPA was created using Spring Initializr. There are some dummy test included for "functionality" purposes. With the Jenkinsfile provided, this application can be deployed either on the Jenkins server or remotely. Docker must be installed and configured correctly with either option. The pipeline will create a new .jar file which will be added to the Docker image. If the container is ran remotely, it will have to pull the image from DockerHub (functionality of pushing to hub is not present). 

## Screenshots

![Pipeline](images/pipeline.png)

![DockerHub](images/dockerhub.png)

![RemoteHost](images/remotehost.png)


