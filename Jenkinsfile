pipeline {
    agent any 
    stages {  
        stage('Checkstyle') {
            steps {
                echo 'Checkstyle stage'
                /*sh './gradlew clean checkstyleMain'
                archiveArtifacts artifacts: 'build/reports/checkstyle/main.xml'*/
            }
        } 
        stage('Test') {
            steps {
                echo 'Test stage'
                 /*sh './gradlew clean test'*/
            }
        }
        stage('Build') {
            steps {
                echo 'Build stage'
                 /*sh './gradlew clean build -x test'*/
            }
        }   
        stage('Create docker image') {
            steps {
                script {
                    echo 'Create docker image stage'
                    app = docker.build("mdczw/mr")  
                }
            }
        }
        stage('Push to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_key') {
                        app.push("${GIT_COMMIT[0..6]}")
                    }
            }
        }
    }
}
