pipeline {
    agent any
    
    environment {
        COMMIT_HASH = GIT_COMMIT.take(7)
        IMAGE_NAME = "spring-petclinic"
    }

    stages {  

        stage('Creating MAIN artifact') {
            when {
                branch 'testik'
            }
            steps {
                script {
                    echo 'Creating an artifact'
                    sh "docker build -t localhost:8082/${IMAGE_NAME}-main:${COMMIT_HASH} ."
                }
            }
        }
        stage('Pushing MAIN artifact to Nexus') {
            when {
                branch 'testik'
            }
            steps {
                script {
                    echo 'Pushing the artifact to Nexus'
                    withCredentials([usernamePassword(credentialsId: 'nexus', passwordVariable: 'PSW', usernameVariable: 'USER')]){
                        sh "echo ${PSW} | docker login -u ${USER} --password-stdin localhost:8082" 
                        sh "docker push localhost:8082/${IMAGE_NAME}-main:${COMMIT_HASH}"
                    } 
                }
            }
        } 

        
        stage('Start deploying') {
            when {
                branch 'testik'
            }
            input {
                message "Do you want to deploy Spring petclinic app?"
            }
            steps {
                echo 'Start deploying'
            }
        }
        stage('Connect to VMs') {
            when {
                branch 'testik'
            }

            steps {
                echo 'Start deploying'
                script{
                    sh 'gcloud compute ssh --zone "us-central1-a" "spring-petclinic-md-instance-2kwc" --project "gd-gcp-internship-devops"'
                    withCredentials([usernamePassword(credentialsId: 'nexus', passwordVariable: 'PSW', usernameVariable: 'USER')]){
                        sh "echo ${PSW} | docker login -u ${USER} --password-stdin http://34.66.189.205:8082" 
                        sh "docker pull http://34.66.189.205:8082/${IMAGE_NAME}-main:${COMMIT_HASH}"
                    }
                }
            }
        }     

    }
}
    
