@Library('Shared') _
pipeline {
    agent {
        label "rocky"
    }
    stages {
        stage("Checkout") {
            steps {
                script {
                    git_clone("https://github.com/Itzmesahil/django-notes-app.git", "main")
                }
            }
        }
        stage("Code Build") {
            steps {
                script {
                    docker_build("notes-app-cicd", "latest", "itzmesahil")
                }
            }
        }
        stage("Push To Hub") {
            steps {
                script {
                    docker_push("notes-app-cicd", "latest", "itzmesahil")
                }
            }
        }
        stage("Deploy") {
            steps {
                script {
                    docker_compose()
                }
            }
        }
    }
    post {
        always {
            script {
                clean_all()
            }
        }
    }
}
