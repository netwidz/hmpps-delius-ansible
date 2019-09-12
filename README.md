# hmpps-delius-ansible
Ansible repo for instance control

# Bastion

## Adding users

First add the user to the file for the correct environment

Either

    group_vars/dev

or 

    group_vars/prod

NOTE: Users must not have the same key for both environments.

To create a 16k rsa key:
    ssh-keygen -t rsa -b 16384  -C "you@youremail.com" -f hmpps-bastion-prod.key


Once the new user is created login to the bastion and run the
the following to set an inital password and for the user to
change their password on next login.

    sudo passwd username
    sudo passwd -e username


## Ansible playbook

First you will need all the external roles.

    make deps

Then you will need to create a control connection to the environment bastion.
Either

    ssh -M -S ~/.ssh/control/bastion ssh.bastion-dev.probation.hmpps.dsd.io
 
or

    ssh -M -S ~/.ssh/control/bastion ssh.bastion-prod.probation.hmpps.dsd.io

You can now use to the control connection to run the environment playbook

Either

    make dev

or

    make prod
