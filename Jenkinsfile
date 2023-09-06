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
    }
}