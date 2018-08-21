pipeline {
  agent {label 'yi-tensorflow'}
    stages {
	stage('Import Base Docker Image') {
            steps {
                sh '''#!/bin/bash -xe
                   if test ! -z "$(docker images -q ubuntu:16.04)"; then
                      echo "Docker Image Already Exist!!!"
                   else
                      echo "Retrive Basic Image From The Repository..."
                   fi
		            ''' 
            }
        }
        stage('Build yi/tflow:latest Docker Image') {
            steps {
	       sh 'docker build -f Dockerfile.tflow -t yi/tflow:latest .'  
            }
        }
	stage('Test yi/tflow:latest Docker Image') { 
            steps {
                sh '''#!/bin/bash -xe
		    echo 'Hello, yi/tflow!!'
                    image_id="$(docker images -q yi/tflow:latest)"
                      if [[ "$(docker images -q yi/tflow:latest 2> /dev/null)" == "$image_id" ]]; then
                          docker inspect --format='{{range $p, $conf := .RootFS.Layers}} {{$p}} {{end}}' $image_id
                      else
                          echo "It appears that current docker image corrapted!!!"
                          exit 1
                      fi 
                   ''' 
            }
        }
        stage('Build yi/tflow-gui:0.0 Docker Image ') {
            steps {
	        sh 'docker build -f Dockerfile.tflow-gui -t yi/tflow-gui:0.0 .'  
            }
        }
	    stage('Test yi/tflow-gui:0.0 Docker Image') { 
            steps {
                sh '''#!/bin/bash -xe
		      echo 'Hello, yi/tflow-gui'
                      image_id="$(docker images -q yi/tflow-gui:0.0)"
                      if [[ "$(docker images -q yi/tflow-gui:0.0 2> /dev/null)" == "$image_id" ]]; then
                          docker inspect --format='{{range $p, $conf := .RootFS.Layers}} {{$p}} {{end}}' $image_id
                      else
                          echo "It appears that current docker image corrapted!!!"
                          exit 1
                      fi 
                   ''' 
		    }
		}
	 stage('Save & Load Docker Image') { 
            steps {
                sh '''#!/bin/bash -xe
		        echo 'Saving Docker image into tar archive'
                        docker save yi/tflow-gui:0.0 | pv -f | cat > $WORKSPACE/yi-tflow-gui-0.0.tar
			
                        echo 'Remove Original Docker Image' 
	                CURRENT_ID=$(docker images | grep -E '^yi/tflow-gui.*0.0' | awk -e '{print $3}')
			docker rmi -f $CURRENT_ID
			
                        echo 'Loading Docker Image'
                        pv -f $WORKSPACE/yi-tflow-gui-0.0.tar | docker load
			docker tag $CURRENT_ID yi/tflow-gui:0.0
                        
                        echo 'Removing temp archive.'  
                        rm $WORKSPACE/yi-tflow-gui-0.0.tar
			
			echo 'Removing yi/tflow:latest Docker Image'
			docker rmi -f yi/tflow:latest
                   ''' 
		    }
		}
 }
	post {
            always {
               script {
                  if (currentBuild.result == null) {
                     currentBuild.result = 'SUCCESS' 
                  }
               }
               step([$class: 'Mailer',
                     notifyEveryUnstableBuild: true,
                     recipients: "igor.rabkin@xiaoyi.com",
                     sendToIndividuals: true])
            }
         } 
}
