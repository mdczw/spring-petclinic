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
                archiveArtifacts artifacts: 'build/reports/checkstyle/main.xml'
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
                    ARTIFACT_NAME="spring-petclinic-${GIT_COMMIT[0..6]}.jar"
                    cp build/libs/*.jar "${ARTIFACT_NAME}"
                '''
                 archiveArtifacts artifacts: "${ARTIFACT_NAME}", fingerprint: true

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
    
