cd /vagrant_data/ansible/
ssh -i "/vagrant/<>.pem.txt" ec2-user@ec2-<>.<>.compute.amazonaws.com
ansible-playbook /vagrant_data/ansible/first_playbook.yaml -i /vagrant_data/hosts.yaml
