pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
    }
    stages {
        stage('Checkout') {
            steps { checkout scm }
        }
        stage('Install Dependencies') {
            steps { sh 'npm install' }
        }
        stage('Test') {
            steps { sh 'npm test' }
        }
        stage('Build Docker Image') {
            steps { sh "docker build -t ${env.DOCKERHUB_CREDENTIALS_USR}/nodejs-demo-app:latest ." }
        }
        stage('Push to Docker Hub') {
            steps {
                sh "echo ${env.DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${env.DOCKERHUB_CREDENTIALS_USR} --password-stdin"
                sh "docker push ${env.DOCKERHUB_CREDENTIALS_USR}/nodejs-demo-app:latest"
            }
        }
    }
}
