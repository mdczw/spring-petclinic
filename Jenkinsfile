pipeline {
    agent any

    stages {
        stage('Checkstyle') {
            steps {
                echo 'Checkstyle stage'
               /* sh './gradlew check'
                archiveArtifacts artifacts: 'build/reports/main.html'*/
            }
        } 
        stage('Test') {
            steps {
                sh './gradlew test'
            }
        }
        stage('Build') {
            steps {
                sh './gradlew build -x test --no-daemon' 
            }
        }
        stage('Create docker image') {
            steps {
                echo 'Create docker image stage'
                
            }
        }
    }
}
