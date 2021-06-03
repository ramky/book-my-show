pipeline {
    agent {
        label('ansible_worker')
    }

    environment{
	    registry = "ramky/book_my_show"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }

    stages {
        stage('SCM Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ramky/book-my-show'
            }
        }

        stage('Build Image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }

        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Execute Ansible') {
            steps {
                script {
                    sh '''final_tag=$(echo "$BUILD_NUMBER" | tr -d ' ')
				        echo ${final_tag}
				        sed -i "s/build_number/$final_tag/g" deploy/k8s/app-deployment.yml
				    '''
                }
                ansiblePlaybook credentialsId: 'riyer_sl', disableHostKeyChecking: true, installation: 'ansible2', inventory: 'prod.inv', playbook: 'ansible.yml'
            }
        }
    }
}