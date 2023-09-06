pipeline{
    agent any

    stages{
        stage("Git Checkout"){
            steps{
                git branch: 'main', url: 'https://github.com/pbdinesh057/cicd-java-project.git'
            }
        }
        stage("Unit Test"){
            steps{
                sh 'mvn test'
            }
        }
        stage("Integration Test"){
            steps{
                sh 'mvn verify -DskipunitTests'
            }
        }
        // stage("Package"){
        //     steps{
        //         sh 'mvn package'
        //     }
        // }
        stage('Maven Build'){
            steps{
                sh 'mvn clean install'
            }
        }
        stage('Static Code Analysis'){
            steps{
                //sqa_6af406fef6b77bd5b833e93712f05161b7fcb8bf
                withSonarQubeEnv(credentialsId: 'sonar-api') {
                    sh 'mvn clean package sonar:sonar'
                }
            }
        }
    }
}