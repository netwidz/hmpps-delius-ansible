deps:
	ansible-galaxy install -r requirements.yml

bastion:
	ansible-playbook --ssh-common-args='-o ControlPath=~/.ssh/control/bastion' -i inventory/bastion bastion.yml
