pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/rishabkm/StellarTrack.git'
            }
        }

        stage('Build') {
            steps {
                sh 'echo "No build step required for static site"'
            }
        }

        stage('Deploy') {
            steps {
                sh 'git add .'
                sh 'git commit -m "Auto-deploy from Jenkins"'
                sh 'git push origin main'
            }
        }
    }
}
