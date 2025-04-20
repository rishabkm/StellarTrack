<<<<<<< HEAD
pipeline {
    agent any
    environment {
        NGINX_PATH = 'C:\\nginx\\html\\stellartrack'
    }
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/rishabkm/StellarTrack.git', 
                     branch: 'main'
            }
        }
        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    bat 'terraform init'
                }
            }
        }
        stage('Deploy') {
            steps {
                dir('terraform') {
                    bat 'terraform apply -auto-approve'
                }
            }
            post {
                failure {
                    bat 'powershell -File terraform\\rollback.ps1'
                }
            }
        }
        stage('Restart NGINX') {
            steps {
                bat '''
                    taskkill /F /IM nginx.exe || echo "NGINX not running"
                    start "" "C:\\nginx\\nginx.exe"
                '''
            }
        }
    }
}
=======
pipeline {
    agent any
    environment {
        NGINX_PATH = 'C:\\nginx\\html\\stellartrack'
    }
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/rishabkm/StellarTrack.git', 
                     branch: 'main'
            }
        }
        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    bat 'terraform init'
                }
            }
        }
        stage('Deploy') {
            steps {
                dir('terraform') {
                    bat 'terraform apply -auto-approve'
                }
            }
            post {
                failure {
                    bat 'powershell -File terraform\\rollback.ps1'
                }
            }
        }
        stage('Restart NGINX') {
            steps {
                bat '''
                    taskkill /F /IM nginx.exe || echo "NGINX not running"
                    start "" "C:\\nginx\\nginx.exe"
                '''
            }
        }
    }
}
>>>>>>> 829892dc2cb97bdc2baab9bab4e88b4e1a76e347
