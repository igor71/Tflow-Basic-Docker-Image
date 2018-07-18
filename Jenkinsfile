pipeline {
  agent {label 'yi-tensorflow'}
    stages {
        stage('Build yi/tflow:latest Docker Image') {
            steps {
	       sh 'docker build -f Dockerfile.tflow -t yi/tflow:latest .'  
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
	       sh 'docker build -f Dockerfile.tflow-gui -t yi/tflow-gui:latest .'  
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
