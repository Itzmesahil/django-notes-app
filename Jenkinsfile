@Library('Shared') _
pipeline {
    agent {
        label "uat"
    }
    stages {
        stage("Checkout") {
            steps {
                script {
                    git_clone("https://github.com/Itzmesahil/django-notes-app.git", "uat")
                }
            }
        }
        stage("Code Build") {
            steps {
                script {
                    docker_build("notes-app-cicd-uat", "latest", "itzmesahil")
                }
            }
        }
        stage("Push To Hub") {
            steps {
                script {
                    docker_push("notes-app-cicd-uat", "latest", "itzmesahil")
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
            emailext(
                subject: "Pipeline Status: ${BUILD_NUMBER}",
                body: '''<html>
                            <body>
                                <p>Build Status: ${BUILD_STATUS}</p>
                                <p>Build Number: ${BUILD_NUMBER}</p>
                                <p>Check the <a href="${BUILD_URL}">console output</a>.</p>
                            </body>
                         </html>''',
                to: 'itzmesahilshaikh@gmail.com',
                from: 'jenkins@example.com',
                replyTo: 'jenkins@example.com',
                mimeType: 'text/html'
            )
        }
    }
}
