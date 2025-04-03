pipeline {
    agent any

    environment {
        APP_DIR = "C:/nginx/html/stellartrack"  // NGINX root directory
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/rishabkm/StellarTrack.git'
            }
        }

        stage('Deploy to NGINX') {
            steps {
                script {
                    sh "rm -rf ${APP_DIR}/*"
                    sh "cp -r * ${APP_DIR}/"
                }
            }
        }

        stage('Restart NGINX') {
            steps {
                script {
                    sh "nginx -s reload"
                }
            }
        }
    }
}
