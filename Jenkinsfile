pipeline {
    agent any // 可选择其他类型的代理，例如 label

    stages {
        stage('Build') { 
            steps {
               
                    
                      //  echo 'mvn -B -s /root/.m2/settings.xml -DskipTests clean package' 
                  // 从版本控制系统检出代码
                sh 'git clone --branch Test https://oauth2:${GITLAB_TOKEN}@gitlab.datacanvas.com/ydyd/wedding-service.git .'
                sh 'docker build --no-cache --build-arg GITLAB_TOKEN=PCRBvaxZ5ynyPS7FHNyh -t tableagent-registry.cn-beijing.cr.aliyuncs.com/wedding/wedding-web:1.0.0 .'
                   
                    
                
            }
        }
    }
}
