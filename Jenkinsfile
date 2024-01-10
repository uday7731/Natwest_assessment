pipeline {
    agent any
    stages {
        stage('Git Clone') {
            steps {
                // Checkout the source code
                script {
                    git 'https://github.com/uday7731/Natwest_assessment.git'
                }
            }
        }
        stage('Build') {
            steps {
                // Add build steps if needed
                script {
                    echo 'Build steps go here'
                }
            }
        }
        stage('Deploy') {
            steps {
                // Add deployment steps
                script {
                    echo 'Deployment steps go here'
                    // e.g., deploy to a server, push to AWS S3, etc.
                }
            }
        }
    }
    post {
        success {
            // Actions to be taken on success
            echo 'Build and deploy succeeded!'
        }
        failure {
            // Actions to be taken on failure
            echo 'Build or deploy failed! Notify team...'
        }
    }
}
