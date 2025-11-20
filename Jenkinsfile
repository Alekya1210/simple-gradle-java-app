pipeline {
    agent any

    tools {
        jdk 'jdk17'
        gradle 'gradle8'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/Alekya1210/simple-gradle-java-app.git'
            }
        }

        stage('Build') {
            steps {
                sh "./gradlew clean build"
            }
        }

        stage('Test Reports') {
            steps {
                junit 'build/test-results/test/*.xml'
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'build/libs/*.jar', fingerprint: true
            }
        }
    }
}

