pipeline {
    agent { docker { image 'jayabalan/packerbuild:1' } }
    stages {
        stage('buildImage') {
            steps {
                sh 'pwd'
                sh 'ls'
            }
        }
        stage('buildpacker') {
            steps {
                sh 'packer build -var aws_access_key=${AWS_ACCESS_KEY_ID} -var aws_secret_key=${AWS_SECRET_ACCESS_KEY} jenkinsami'
            }
        }
	stage('RunInstance') {
            steps {
	        sh 'terraform init'
		sh 'terraform apply -var aws_access_key=${AWS_ACCESS_KEY_ID} -var aws_secret_key=${AWS_SECRET_ACCESS_KEY}'
       	    }
        }
    }
}
