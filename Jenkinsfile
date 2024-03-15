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
                    sh 'gcloud compute ssh -t --zone "us-central1-c" "spring-petclinic-md-instance-m75t" --project "gd-gcp-internship-devops"'
                    sh 'hostname -i'
                    withCredentials([usernamePassword(credentialsId: 'nexus', passwordVariable: 'PSW', usernameVariable: 'USER')]){    
                        sh 'echo ${PSW} | docker login -u ${USER} --password-stdin 35.209.98.132:8082'
                    }
                        sh 'hostname -i'
                    withCredentials([usernamePassword(credentialsId: 'nexus', passwordVariable: 'PSW', usernameVariable: 'USER')]){
                        sh 'echo ${PSW} | docker login -u ${USER} --password-stdin http://34.171.68.54:8082'
                        sh 'hostname -i'
                        sh 'docker pull 34.66.189.205:8082/spring-petclinic-main:be15e84'
                        sh 'hostname -i'
                        sh 'docker run -p 8080:8080 34.66.189.205:8082/spring-petclinic-main:be15e84'
                    }
                }
            }
        }     

    }
}
    
