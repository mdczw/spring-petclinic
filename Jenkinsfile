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
                    docker.build("localhost:8082/${IMAGE_NAME}:${COMMIT_HASH}")
                }
            }
        }  
    }
}
    
