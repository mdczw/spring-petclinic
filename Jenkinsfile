pipeline {
    agent any
    
    environment {
        COMMIT_HASH = ${GIT_REVISION,length=6}
        ARTIFACT_NAME = "spring-petclinic-${COMMIT_HASH}.jar"
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
                echo 'Creating an artifact'
                sh 'cp build/libs/*.jar build/libs/${ARTIFACT_NAME}'
                archiveArtifacts artifacts: 'build/libs/env.ARTIFACT_NAME'
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
    
