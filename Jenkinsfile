pipeline {
  agent {label 'yi-tensorflow'}
    stages {
	stage('Import Base Docker Image') {
            steps {
                sh '''#!/bin/bash -xe
                   if test ! -z "$(docker images -q nvidia/cuda:9.0-cudnn7-base)"; then
                      echo "Docker Image Already Exist!!!"
                   else
                      pv -f /media/common/DOCKER_IMAGES/Nvidia/BasicImages/nvidia-cuda-9.0-cudnn7-base.tar | docker load
                      docker tag 51e73d3af9a7 nvidia/cuda:9.0-cudnn7-base
                      echo "DONE!!!"
                   fi
		            ''' 
            }
        }
        stage('Build yi/tflow:latest Docker Image') {
            steps {
	       sh 'docker build --no-cache -f Dockerfile.tflow -t yi/tflow:latest .'  
            }
        }
	stage('Test yi/tflow:latest Docker Image') { 
            steps {
                sh '''#!/bin/bash -xe
		    echo 'Hello, YI-TFLOW!!'
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
        stage('Build yi/tflow-gui:latest Docker Image ') {
            steps {
	       sh 'docker build --no-cache -f Dockerfile.tflow-gui -t yi/tflow-gui:latest .'  
            }
        }
	stage('Test yi/tflow-gui:latest Docker Image') { 
            steps {
                sh '''#!/bin/bash -xe
		   echo 'Hello, Jenkins_Docker'
                    image_id="$(docker images -q yi/tflow-gui:latest)"
                      if [[ "$(docker images -q yi/tflow-gui:latest 2> /dev/null)" == "$image_id" ]]; then
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
                        docker save yi/tflow-gui:latest | pv -f | cat > $WORKSPACE/yi-tflow-gui-latest.tar
			
                        echo 'Remove Original Docker Image' 
			CURRENT_ID=$(docker images | grep -E '^yi/tflow-gui.*latest' | awk -e '{print $3}')
			docker rmi -f $CURRENT_ID
			
                        echo 'Loading Docker Image'
                        pv -f $WORKSPACE/yi-tflow-gui-latest.tar | docker load
			docker tag $CURRENT_ID yi/tflow-gui:latest
                        
                        echo 'Removing temp archive.'  
                        rm $WORKSPACE/yi-tflow-gui-latest.tar
			
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
