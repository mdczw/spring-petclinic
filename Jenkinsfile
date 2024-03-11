pipeline {
    agent any
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
                echo 'Creating an artifact'
                sh '''
                    COMMIT_HASH=$(git rev-parse --short HEAD)
                    ARTIFACT_NAME="spring-petclinic-${COMMIT_HASH}.jar"
                    cp build/libs/*.jar build/libs/${ARTIFACT_NAME}
                '''
                //archiveArtifacts artifacts: build/libs/${ARTIFACT_NAME}
            }
        }   
        stage('Pushing the artifact to Nexus') {
            when {
                branch 'test-1'
            }
            steps {
                echo 'Pushing the artifact to Nexus'
            }
        }   
    }
}
    
