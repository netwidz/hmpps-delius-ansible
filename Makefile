deps:
	ansible-galaxy install -r requirements.yml

dev:
	ansible-playbook -K --ssh-common-args='-o ControlPath=~/.ssh/control/bastion' -i inventory/dev bastion.yml

prod:
	ansible-playbook -K --ssh-common-args='-o ControlPath=~/.ssh/control/bastion' -i inventory/prod bastion.yml
