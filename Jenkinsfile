pipeline {
    agent any

    options {
        disableConcurrentBuilds()
    }

    environment {
        TF_VAR_aws_region    = 'ap-south-1'
        TF_VAR_ami_id        = 'ami-01a00762f46d584a1'
        TF_VAR_instance_type = 'c7i-flex.large'
        TF_VAR_my_ip         = '157.35.99.127/32'
        TF_VAR_key_name      = 'Raja'
        TF_VAR_db_username   = 'appuser'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init -input=false'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([
                    string(
                        credentialsId: 'tf-db-password',
                        variable: 'TF_VAR_db_password'
                    )
                ]) {
                    sh 'terraform plan -input=false -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([
                    string(
                        credentialsId: 'tf-db-password',
                        variable: 'TF_VAR_db_password'
                    )
                ]) {
                    sh 'terraform apply -input=false -auto-approve tfplan'
                }
            }
        }
    }
}
