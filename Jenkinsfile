pipeline {
    agent any

    environment {
        APP_DIR = "C:\\nginx\\html\\stellartrack" // Corrected Windows path
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
                    bat """
                        del /s /q "${APP_DIR}\\*"
                        xcopy /s /e . "${APP_DIR}\\"
                    """
                }
            }
        }

        stage('Restart NGINX') {
            steps {
                script {
                    // Check if Nginx is running as a service or executable
                    // If service, use net stop/start
                    // If executable, use nginx.exe -s reload

                    // Example for service:
                    bat """
                        net stop nginx
                        net start nginx
                    """

                    // Example for executable (if Nginx is not in PATH):
                    // bat "\"C:\\nginx\\nginx.exe\" -s reload"

                    // If nginx is in the system's path, this will also work.
                    // bat "nginx -s reload"
                }
            }
        }
    }
}
