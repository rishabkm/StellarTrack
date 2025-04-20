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
                    sh 'terraform init'  // Initialize Terraform
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve'  // Apply the Terraform configuration
                }
            }
        }
        stage('Deploy to NGINX') {
            steps {
                script {
                    bat 'xcopy /s /e . "C:\\nginx\\html\\stellartrack\\"'
                    bat 'taskkill /F /IM nginx.exe'
                    bat 'start "" "C:\\nginx\\nginx.exe"'
                }
            }
        }
    }
}
