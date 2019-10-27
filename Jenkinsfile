// comment
pipeline {
 agent any
 stages {
       
        stage('CreateVirtualEnv') {
            steps {
				sh '''
					bash -c "pip3 install virtualenv && virtualenv entorno_virtual && source entorno_virtual/bin/activate"
				'''

            }
        }
        stage('InstallRequirements') {
            steps {
            	sh '''
            		bash -c "pip3 install source && source ${WORKSPACE}/entorno_virtual/bin/activate && ${WORKSPACE}/entorno_virtual/bin/python ${WORKSPACE}/entorno_virtual/bin/pip install -r requirements.txt"
                '''
            }
        }   
        stage('TestApp') {
            steps {
            	sh '''
            		bash -c "source ${WORKSPACE}/entorno_virtual/bin/activate &&  cd src && ${WORKSPACE}/entorno_virtual/bin/python ${WORKSPACE}/entorno_virtual/bin/pytest && cd .."
                '''
            }
        }  
        stage('RunApp') {
            steps {
            	sh '''
            		bash -c "source entorno_virtual/bin/activate ; ${WORKSPACE}/entorno_virtual/bin/python src/main.py &"
                '''
            }
        } 
        stage('BuildDocker') {
            steps {
            	sh '''
            		docker build -t apptest:latest .
                '''
            }
        } 
    stage('PushDockerImage') {
            steps {
            	sh '''
            		docker tag apptest:latest hdecaceres/apptest:latest
					docker push hdecaceres/apptest:latest
					docker rmi apptest:latest
                '''
            }
        } 
  }
}
