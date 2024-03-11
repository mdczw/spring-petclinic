pipeline {
    agent any
    
    environment {
        COMMIT_HASH = GIT_COMMIT.take(7)
        ARTIFACT_NAME = "spring-petclinic-${COMMIT_HASH}.jar"
    }

    stages {  
        stage('Git tag') {
            when {
                branch 'test-1'
            }
            steps {
                echo 'Creating git tag'
                sh './gradlew release'
                sh 'git tag'
            }
        } 
        stage('Creating an artifact ') {
            when {
                branch 'test-1'
            }
            steps {
                echo 'Creating an artifact'
               // ARTIFACT_NAME = "spring-petclinic-${COMMIT_HASH}.jar"
                //sh 'cp build/libs/*.jar build/libs/${ARTIFACT_NAME}'
                //archiveArtifacts artifacts: "build/libs/${ARTIFACT_NAME}"
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
        stage('Creating an artifact') {
            when {
                branch 'test-1'
            }
            steps {
                echo 'Creating an artifact'
            }
        }   
        stage('the artifact to Nexus') {
            when {
                branch 'test-1'
            }
            steps {
                echo 'Pushing the artifact to Nexus'
            }
        }   
    }
}
    
