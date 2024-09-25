pipeline {
    agent any // 可选择其他类型的代理，例如 label

    stages {
        stage('Build') { 
            steps {
                script {
                    docker.image('dockerproxy.cn/maven:3.8.5-openjdk-11').inside('-v /home/maven:/root/.m2 -v /path/to/your/settings:/root/.m2/settings.xml') {
                        sh 'mvn -B -s /root/.m2/settings.xml -DskipTests clean package' 
                    }
                }
            }
        }
    }
}
