pipeline {
    agent any
    
    environment {
        COMMIT_HASH = GIT_COMMIT.take(7)
        IMAGE_NAME = "spring-petclinic"
    }

    stages {  
        stage('Checkstyle') {
            when {
                branch 'PR-*'
            }
            steps {
                echo 'Checkstyle stage'
                sh './gradlew clean checkstyleMain'
            }
        } 
        stage('Test') {
            when {
                branch 'PR-*'
            }
            steps {
                echo 'Test stage'
                sh './gradlew clean test'
            }
        }
        stage('Build') {
            when {
                branch 'PR-*'
            }
            steps {
                
                echo 'Build stage'
                sh './gradlew clean build -x test'
            }
        }  
        stage('Creating PR artifact') {
            when {
                branch 'PR-*'
            }
            steps {
                script {
                    echo 'Creating an artifact'
                    sh "docker build -t localhost:8082/${IMAGE_NAME}-pr:${COMMIT_HASH} ."
                }
            }
        }  

        stage('Pushing PR artifact to Nexus') {
            when {
                branch 'PR-*'
            }
            steps {
                script {
                    echo 'Pushing the artifact to Nexus'
                    withCredentials([usernamePassword(credentialsId: 'nexus', passwordVariable: 'PSW', usernameVariable: 'USER')]){
                        sh "echo ${PSW} | docker login -u ${USER} --password-stdin localhost:8082" 
                        sh "docker push localhost:8082/${IMAGE_NAME}-pr:${COMMIT_HASH}"
                    }
                }
            }
        } 

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

    }
}
    
