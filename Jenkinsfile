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
                def commitHash = sh(script: 'git rev-parse --short HEAD', returnStdout: true)
                def artefact_name="spring-petclinic-${commit_hash}.jar"
                sh 'cp build/libs/*.jar build/libs/${artefact_name}'
                archiveArtifacts artifacts: build/libs/${artefact_name}
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
    
