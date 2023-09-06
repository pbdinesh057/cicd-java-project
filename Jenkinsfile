pipeline{
    agent any

    stages{
        stage("Git Checkout"){
            steps{
                script {
                     git branch: 'main', url: 'https://github.com/pbdinesh057/cicd-java-project.git'
                }
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
                script{
                //sqa_6af406fef6b77bd5b833e93712f05161b7fcb8bf
                    withSonarQubeEnv(credentialsId: 'sonar-api') {
                        sh 'mvn clean package sonar:sonar'
                    }
                }
            }
        }
        stage('Quality Gate Status'){
            steps{
                script {
                    waitForQualityGate abortPipeline: false, credentialsId: 'sonar-api'
                }
            }
        }
        stage('upload artifact to Nexus'){
            steps{
                script{
                    def readPomVersion = readMavenPom file: 'pom.xml'
                    def nexusrepo = readPomVersion().version.endsWith('SNAPSHOT') ? 'cicd-app-snapshots' : 'cicd-app-releases'
                    nexusArtifactUploader artifacts: [
                        [artifactId: 'springboot', 
                        classifier: '', 
                        file: 'target/Uber.jar', 
                        type: 'jar'
                        ]
                    ], 
                        credentialsId: 'nexus-auth', 
                        groupId: 'com.example', 
                        nexusUrl: '54.196.245.6:8081', 
                        nexusVersion: 'nexus3', 
                        protocol: 'http', 
                        repository: nexusrepo, 
                        version: readPomVersion.version
                }
            }
        }
    }
}