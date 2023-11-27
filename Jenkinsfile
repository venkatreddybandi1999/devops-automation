pipeline {
    agent any
    environment {
        DOCKER_REGISTRY_CREDENTIALS = credentials('dockercredentials')
        DOCKER_USERNAME= "credentials('DOCKER_REGISTRY_CREDENTIALS').username"
        DOCKER_PASSWORD= "credentials('DOCKER_REGISTRY_CREDENTIALS').password"
        // dockerImageName= "venkat4540/final-project"
    }
    tools {
        maven 'maven'
    }
    
    stages {
        stage ("Source code"){
            steps {
                git branch: 'dev', url: 'https://github.com/venkatreddybandi1999/devops-automation.git'
            }
        }
        stage ("Build") {
            steps {
                sh "mvn clean install"
            }
        }
        stage ("Build-Docker-image"){
            steps {
                script {
                    // dockerImage=docker.build dockerImageName
                    sh "docker build -t venkat4540/final-project ."
                }
            }
        }
        stage ("Push image to hub") {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockercredentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh ('docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD')
                    }
                    sh "docker push venkat4540/final-project"
                }
            }
            // environment {
            //     registryCredential= 'dockercredentials'
            // }
            // steps {
            //     script {
            //         docker.withRegistry( 'https://registry.hub.docker.com/', registryCredential) {
            //         sh "docker push venkat4540/final-project"
            //         }
            //     }
            // }
        }
        stage("K8-deploy"){
            steps {
                script {
                    WithKubeConfig(configs: 'deploymentservice.yml' , kubeconfigId: "kubeconfigid")
                }
            }
        }
    }
}
