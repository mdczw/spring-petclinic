pipeline {
    agent any
    
    environment {
        COMMIT_HASH = GIT_COMMIT.take(7)
        IMAGE_NAME = "spring-petclinic-main"
    }

    stages {  
        stage('Create git tag') {
            when {
                branch 'test-1'
            }
            steps {
                echo 'Create git tag'
                sh './gradlew clean build -x test'
                sh './gradlew currentVersion'
            }
        } 
        stage('Creating an artifact') {
            when {
                branch 'test-1'
            }
            steps {
                script {
                    echo 'Creating an artifact'
                    sh 'docker build -t localhost:8082/${IMAGE_NAME}:${COMMIT_HASH} .'
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
                    }
                }
            }
        }   
    }
}
    
