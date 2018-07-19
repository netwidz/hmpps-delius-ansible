# hmpps-delius-ansible
Ansible repo for instance control

# Bastion

## Adding users

First add the user to the file

    group_vars/bastion
    
Once the new user is created login to the bastion and run the
the following to set an inital password and for the user to 
change their password on next login.

    sudo passwd username
    sudo passwd -e username
    

## Ansible playbook

First you will need all the external roles.

    make dep

Then you will need to create a control connection to the bastion

    ssh -M -S ~/.ssh/control/bastion dev.bastion.probation.hmpps.dsd.io
    
You can now use to the control connection to run the playbook

    make bastion