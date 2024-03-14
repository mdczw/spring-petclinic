pipeline {
    agent any
    
    environment {
        COMMIT_HASH = GIT_COMMIT.take(7)
        IMAGE_NAME = "spring-petclinic"
    }

    stages {  
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
                    sh 'gcloud compute ssh --zone "us-central1-a" "spring-petclinic-md-instance-546m" --project "gd-gcp-internship-devops"'
                    withCredentials([usernamePassword(credentialsId: 'nexus', passwordVariable: 'PSW', usernameVariable: 'USER')]){
                        sh "echo ${PSW} | docker login -u ${USER} --password-stdin localhost:8082" 
                        sh "docker pull localhost:8082/${IMAGE_NAME}-main:${COMMIT_HASH}"
                    }
                }
            }
        }     

    }
}
    
