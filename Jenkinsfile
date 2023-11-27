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
                    docker.build("modul13/spring_petclinic")   
                    NEXUS_DOCKER_REPO = 'http://localhost:8084'
                    withCredentials([usernamePassword(credentialsId: 'nexus_admin_login', usernameVariable: 'NEXUS_USERNAME', passwordVariable: 'NEXUS_PASSWORD')]) {
                        sh ' echo $NEXUS_PASSWORD | docker login -u $NEXUS_USERNAME --password-stdin http://localhost:8081/repository/mr/'
                        sh 'docker tag modul13/spring_petclinic:${GIT_COMMIT[0..6]} http://localhost:8081/repository/mr/'
                        sh "docker push http://localhost:8084/repository/mr/"
                    }

                
                   /* withCredentials([usernamePassword(credentialsId: 'nexus_admin_login', usernameVariable: 'USER', passwordVariable: 'PASS' )]){
                        sh ' echo $NEXUS_PASSWORD | docker login -u $NEXUS_USERNAME --password-stdin $NEXUS_DOCKER_REPO'
                        sh 'docker push $NEXUS_DOCKER_REPO/spring_petclinic:$GIT_COMMIT[0..6]'

                    }
                    'docker build -t jenkins/spring-petclinic .'*/
                }
            }
        }
    }
}
