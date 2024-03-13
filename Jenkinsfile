pipeline {
    agent any
    
    environment {
        COMMIT_HASH = GIT_COMMIT.take(7)
        IMAGE_NAME = "spring-petclinic"
    }

    stages {  
        stage('Checkstyle') {
            when {
                branch 'test-1'
            }
            steps {
                echo 'Checkstyle stage'
                sh './gradlew clean checkstyleMain'
            }
        } 
        stage('Test') {
            when {
                branch 'test-1'
            }
            steps {
                echo 'Test stage'
                sh './gradlew clean test'
            }
        }
        stage('Build') {
            when {
                branch 'test-1'
            }
            steps {
                
                echo 'Build stage'
                sh './gradlew clean build -x test'
            }
        }  
        stage('Creating an artifact') {
            when {
                branch 'test-1'
            }
            steps {
                script {
                    echo 'Creating an artifact'
                    docker.build(localhost:8082/"${IMAGE_NAME}:${COMMIT_HASH}")
                }
            }
        }  

        stage('Pushing the artifact to Nexus') {
            when {
                branch 'test-1'
            }
            steps {
                script {
                    echo 'Pushing the artifact to Nexus'
                    withCredentials([usernamePassword(credentialsId: 'nexus', passwordVariable: 'PSW', usernameVariable: 'USER')]){
                        sh "echo ${PSW} | docker login -u ${USER} --password-stdin localhost:8082" 
                        sh "docker push localhost:8082/${IMAGE_NAME}:${COMMIT_HASH}"
                        ｝
                    }
                }
            }
        }   
    }
}
    
