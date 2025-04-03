pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "rishabkm/stellartrack"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/rishabkm/StellarTrack.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    sh 'docker login -u your-dockerhub-username -p your-dockerhub-password'
                    sh 'docker tag $DOCKER_IMAGE your-dockerhub-username/stellartrack:latest'
                    sh 'docker push your-dockerhub-username/stellartrack:latest'
                }
            }
        }

        stage('Deploy to Server') {
            steps {
                script {
                    sh 'docker pull your-dockerhub-username/stellartrack:latest'
                    sh 'docker run -d -p 80:80 your-dockerhub-username/stellartrack:latest'
                }
            }
        }
    }
}
