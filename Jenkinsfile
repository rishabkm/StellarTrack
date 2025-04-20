pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Terraform Init') {
            steps {
                script {
                    bat 'terraform init'  // Initialize Terraform (Windows compatible)
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    bat 'terraform apply -auto-approve'  // Apply Terraform config (Windows compatible)
                }
            }
        }
        stage('Deploy to NGINX') {
            steps {
                script {
                    bat 'xcopy /s /e /y . "C:\\nginx\\html\\stellartrack\\"'
                    bat 'taskkill /F /IM nginx.exe'
                    bat 'start "" "C:\\nginx\\nginx.exe"'
                }
            }
        }
    }
}
