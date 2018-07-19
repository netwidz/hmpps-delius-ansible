deps:
	ansible-galaxy install -r requirements.yml

bastion:
	ansible-playbook -K --ssh-common-args='-o ControlPath=~/.ssh/control/bastion' -i inventory/bastion bastion.yml
