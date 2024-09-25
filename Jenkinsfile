pipeline {
    agent {
        docker {
            image 'dockerproxy.cn/maven:3.8.5-openjdk-11' 
            args '-v /home/maven:/root/.m2' 
        }
    }
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
    }
}
