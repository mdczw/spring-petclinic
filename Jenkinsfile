pipeline {
    agent any
    
    environment {
        COMMIT_HASH = GIT_COMMIT.take(7)
        IMAGE_NAME = "spring-petclinic"
    }

    stages {  
        stage('Create git tag') {
            when {
                branch 'test-1'
            }
            steps {
                echo 'Create git tag'
                sh './gradlew clean build -x test'
                sh 'git tag'
                sh './gradlew currentVersion'
                sh './gradlew release'
                sh 'git tag'
            }
        }   
    }
}
    
