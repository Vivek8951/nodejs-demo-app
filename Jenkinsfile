pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'
            }
        }
        stage('Docker Login') {
            steps {
                sh '''
                    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                '''
            }
        }
        stage('Build Docker Image') {
            steps {
                sh "docker build -t $DOCKERHUB_CREDENTIALS_USR/nodejs-demo-app:latest ."
            }
        }
        stage('Push to Docker Hub') {
            steps {
                sh "docker push $DOCKERHUB_CREDENTIALS_USR/nodejs-demo-app:latest"
            }
        }
    }
}
