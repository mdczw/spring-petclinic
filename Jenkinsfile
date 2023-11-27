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
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_key') {
                        app.push("${GIT_COMMIT[0..6]}")
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
