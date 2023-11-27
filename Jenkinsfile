pipeline {
    agent any 
    /*{
        docker { image 'node:16-alpine'}
    }*/
    stages {  
        stage('Checkstyle') {
            steps {
                echo 'Checkstyle stage'
                sh './gradlew clean checkstyleMain'
                archiveArtifacts artifacts: 'build/reports/checkstyle/main.xml'
            }
        } 
        stage('Test') {
            steps {
                echo 'Test stage'
                sh './gradlew clean test'
            }
        }
        stage('Build') {
            steps {
                echo 'Build stage'
                sh './gradlew clean build -x test'
            }
        }   
        stage('Create docker image') {
            steps {
                script {
                    echo 'Create docker image stage'
                    sh "echo ${GIT_COMMIT[0..6]}"
                    app = docker.build("modul13/spring_petclinic")
                    app.inside {
                        sh 'echo $(curl localhost:8080)'
                    }
                    NEXUS_DOCKER_REPO = 'http://localhost:8084/repository/mr/'
                    withCredentials([usernamePassword(credentialsId: 'nexus_admin_login', usernameVariable: 'USER', passwordVariable: 'PASS' )]){
                        sh ' echo $PASS | docker login -u $USER --password-stdin $NEXUS_DOCKER_REPO'
                        sh 'docker push $NEXUS_DOCKER_REPO/spring_petclinic:$GIT_COMMIT[0..6]'

                    }
                    /*sh 'docker build -t jenkins/spring-petclinic .'*/
                }
            }
        }
    }
}
