def prepare_env() {
    sh '''
        docker pull mojdigitalstudio/hmpps-ansible-builder:latest
    '''
}

def run_ansible(environment_type) {
    sshagent (credentials: ['d508efa5-fb82-4bb2-b6cb-a3c1b803e13e']) {
        sh """
            set +x
            docker run --rm -v `pwd`:/home/tools/data \
            -v ~/.ssh:/home/tools/.ssh \
            -v $SSH_AUTH_SOCK:/ssh-agent \
            -e SSH_AUTH_SOCK=/ssh-agent \
            mojdigitalstudio/hmpps-ansible-builder bash -c \"ansible-galaxy install -r requirements.yml && \
             ansible-playbook -i inventory/${environment_type} bastion.yml\"
            set -x
        """
    }
}

pipeline {

    agent { label "jenkins_slave" }

    parameters{
        choice(
            choices:['dev', 'prod'],
            description: 'Select the environment bastion you would like to configure',
            name: 'environment_type'
        )
    }

    stages {

        stage('setup') {
            steps {
                git url: 'git@github.com:ministryofjustice/hmpps-delius-ansible.git',
                    branch: 'master',
                    credentialsId: 'f44bc5f1-30bd-4ab9-ad61-cc32caf1562a'
                prepare_env()
            }
        }

        stage('Ansible') {
            steps {
                run_ansible(environment_type)
            }
        }

    }
}
