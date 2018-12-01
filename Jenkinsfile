pipeline {
    agent { docker { image 'jayabalan/packerbuild:1' } }
    stages {
        stage('Initialize') {
            steps {
                sh 'terraform init'
            }
        }
        stage('buildpacker') {
            steps {
                sh 'packer build -var aws_access_key=${AWS_ACCESS_KEY_ID} -var aws_secret_key=${AWS_SECRET_ACCESS_KEY} jenkinsami'
            }
        }
	stage('RunInstance') {
            steps {
		sh 'terraform apply -auto-approve -var aws_access_key=${AWS_ACCESS_KEY_ID} -var aws_secret_key=${AWS_SECRET_ACCESS_KEY}'
       	    }
        }
    }
}
