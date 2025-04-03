pipeline {
    agent any
    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/rishabkm/StellarTrack.git'
            }
        }
        stage('Build') {
            steps {
                sh 'npm install'   // Install dependencies (modify if using another framework)
                sh 'npm run build' // Build the project (modify for your stack)
            }
        }
        stage('Test') {
            steps {
                sh 'npm test' // Run tests (if available)
            }
        }
        stage('Deploy') {
            steps {
                sshagent(['your-server-ssh-key']) {
                    sh '''
                    scp -r ./build/ user@yourserver:/var/www/yourwebsite
                    ssh user@yourserver 'sudo systemctl restart nginx'
                    '''
                }
            }
        }
    }
}
