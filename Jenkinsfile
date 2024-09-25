pipeline {
    agent any // 可选择其他类型的代理，例如 label

    stages {
        stage('Build') { 
            steps {
               
                    
                        sh 'mvn -B -s /root/.m2/settings.xml -DskipTests clean package' 
                    
                
            }
        }
    }
}
