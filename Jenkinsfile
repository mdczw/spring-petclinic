pipeline {
    agent { label 'linux'} 
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
        stage('Push to DockerHub') {
            when {
                changeset 'origin/(pull/*)'
            }
            steps {
                script {
                    echo 'Push to DockerHub'
                    app = docker.build("mdczw/mr") 
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_key') {
                        app.push("${GIT_COMMIT[0..6]}")
                    }
                }
            }
        }    
        stage('Push main') {
            when {
                branch 'main'
            }
            steps {
                script {
                    echo 'Push main'
                    app = docker.build("mdczw/main") 
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_key') {
                        app.push("${GIT_COMMIT[0..6]}")
                    }
                }
            }
        }
    }
}
    
