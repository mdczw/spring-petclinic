pipeline {
    agent any

    stages {
        stage('Checkstyle') {
            steps {
                echo 'Checkstyle stage'
                sh './gradlew checkstyleMain'
                sh 'ls -la'
                /*archiveArtifacts artifacts: 'reports/main.html'*/
            }
        } 
        stage('Test') {
            steps {
                echo 'Test stage'
                /*sh './gradlew test'*/
            }
        }
        stage('Build') {
            steps {
                sh './gradlew build -x test' 
            }
        }
        stage('Create docker image') {
            steps {
                echo 'Create docker image stage'
                
            }
        }
    }
}
