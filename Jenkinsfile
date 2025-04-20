pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/rishabkm/StellarTrack.git', branch: 'main'
            }
        }

        stage('Deploy to NGINX') {
            steps {
                script {
                    bat 'del /s /q "C:\\nginx\\html\\stellartrack\\*"'
                    bat 'xcopy /s /e . "C:\\nginx\\html\\stellartrack\\"'
                }
            }
        }

        stage('Restart NGINX') {
            steps {
                script {
                    bat 'taskkill /F /IM nginx.exe'
                    bat 'start "" "C:\\nginx\\nginx.exe"'
                }
            }
        }
    }
}
