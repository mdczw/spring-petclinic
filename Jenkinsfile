pipeline {
    agent any /*{
        docker { image 'node:16-alpine'}
    }*/

    stages {  
        stage('Checkstyle') {
            steps {
                sh "echo ${GIT_COMMIT[0..6]}"
                echo 'Checkstyle stage'
                /*sh './gradlew clean checkstyleMain'
                archiveArtifacts artifacts: 'build/reports/checkstyle/main.xml'*/
            }
        } 
        stage('Test') {
            steps {
                echo 'Test stage'
                sh './gradlew test'
            }
        }
        stage('Build') {
            steps {
                echo 'Build stage'
                /*sh './gradlew build -x test'*/ 
            }
        }   
        stage('Create docker image') {
            steps {
                script {
                    echo 'Create docker image stage'
                    /*app = docker.build("willbla/train-schedule")
                    app.inside {
                        sh 'echo $(curl localhost:8080)'
                    }

                    sh 'docker build -t jenkins/spring-petclinic .'*/
                }
            }
        }
    }
}
