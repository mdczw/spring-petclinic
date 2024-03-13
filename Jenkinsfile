pipeline {
    agent any
    
    environment {
        COMMIT_HASH = GIT_COMMIT.take(7)
        IMAGE_NAME = "spring-petclinic"
    }

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
                docker.build("${IMAGE_NAME}:${COMMIT_HASH}")
            }
        }  

        stage('Pushing the artifact to Nexus') {
            when {
                branch 'test-1'
            }
            steps {
                echo 'Pushing the artifact to Nexus'
                docker.withRegistry('http://localhost:8081/repository/dockerhosted-repo/', 'nexus') {
                        app.push("${IMAGE_NAME}:${COMMIT_HASH}")
                    }
            }
        }   
    }
}
    
