pipeline {
    agent any
    
    stages {  
        stage('Checkstyle') {
            steps {
                echo 'Checkstyle stage'
                /*sh './gradlew checkstyleMain'
                archiveArtifacts artifacts: 'build/reports/checkstyle/main.xml'*/
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
                echo 'Build stage'
                /*sh './gradlew build -x test'*/ 
            }
        }
        stage("stage-1") {
            steps {
                scmVars = git branch: env.BRANCH_NAME, credentialsId: 'github_key', url: 'https://github.com/mdczw/spring-petclinic'
                commitHash = scmVars.GIT_COMMIT
    
            }
        }
            
        stage('Create docker image') {
            steps {
                script {
                    echo 'Create docker image stage'
                    commitHash = env.GIT_COMMIT
                    echo '$commitHash'
                    /*sh 'docker build -t jenkins/spring-petclinic .'*/
                }
            }
        }
    }
}
