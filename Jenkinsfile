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

            steps {
                echo 'Start deploying'
                script{
                    sh 'docker pull localhost:8082/${IMAGE_NAME}-main:${COMMIT_HASH}'
                }
            }
        }
        

    }
}
    
