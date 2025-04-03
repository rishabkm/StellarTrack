pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "rishabkm/stellartrack"
        DOCKER_HUB_USERNAME = "your-dockerhub-username"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/rishabkm/StellarTrack.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $DOCKER_HUB_USERNAME/stellartrack:latest ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'docker-hub-password', variable: 'DOCKER_HUB_PASSWORD')]) {
                        sh "echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin"
                        sh "docker push $DOCKER_HUB_USERNAME/stellartrack:latest"
                    }
                }
            }
        }

        stage('Deploy to Server') {
            steps {
                script {
                    sh "docker pull $DOCKER_HUB_USERNAME/stellartrack:latest"
                    sh "docker stop stellartrack || true"
                    sh "docker rm stellartrack || true"
                    sh "docker run -d --name stellartrack -p 80:80 $DOCKER_HUB_USERNAME/stellartrack:latest"
                }
            }
        }
    }
}
