pipeline {
    agent any 
    tools {
        maven "Maven 3.8.5"
    
    }
    stages {
        stage('Compile and Clean') { 
            steps {
                // Run Maven on a Unix agent.
              
                sh "mvn clean compile"
            }
        }
        stage('deploy') { 
            steps {
                sh "mvn package"
            }
        }
        
        stage('Build Docker image'){
            steps {
              
                sh 'docker build -t  anvbhaskar/docker_jenkins_springboot:${BUILD_NUMBER} .'
            }
        }
        stage('Docker Login'){
            
            steps {
                 withCredentials([string(credentialsId: 'DockerId', variable: 'Dockerpwd')]) {
                    sh "docker login -u anvbhaskar -p ${Dockerpwd}"
                }
            }                
        }
        stage('Docker Push'){
            steps {
                sh 'docker push anvbhaskar/docker_jenkins_springboot:${BUILD_NUMBER}'
            }
        }
       
        stage('Archving') { 
            steps {
                 archiveArtifacts '**/target/*.jar'
            }
        }
    }
}
