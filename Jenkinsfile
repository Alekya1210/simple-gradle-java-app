pipeline {
    agent any

    tools {
        jdk 'jdk17'
        gradle 'gradle8'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/Alekya1210/simple-gradle-java-app.git'
            }
        }

        stage('Build JAR') {
            steps {
                sh "./gradlew clean build"
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t gradle-web-app:latest .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                    if [ $(docker ps -aq -f name=gradleweb) ]; then
                        docker rm -f gradleweb || true
                    fi
                '''
            }
        }

        stage('Run New Container') {
            steps {
                sh 'docker run -d -p 9090:8080 --name gradleweb gradle-web-app:latest'
            }
        }

        stage('Success') {
            steps {
                echo "Application deployed successfully!"
                echo "Visit your app at: http://${env.NODE_NAME}:9090"
            }
        }
    }
}

