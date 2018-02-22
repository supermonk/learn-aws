sudo yum install mlocate -y
sudo yum updatedb
sudo yum install vim -y
sudo yum install -y  yum-utils python-argparse
sudo yum-builddep python -y
sudo yum install epel-release -y
sudo yum install python34 -y
sudo yum install java -y
sudo curl -O https://bootstrap.pypa.io/get-pip.py
sudo /usr/bin/python3.4 get-pip.py
pip --version
runuser -l  vagrant -c 'pip install awscli --upgrade --user'
sudo yum install unzip -y
sudo yum install ansible -y
sudo yum install wget -y
wget https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip
sudo mkdir /opt/terraform/
sudo chmod 777 /opt/terraform/
unzip terraform_0.11.3_linux_amd64.zip
mv terraform /opt/terraform/
sudo rm ~/.bash_profile
cp /vagrant_data/.bash_profile ~/.bash_profile
runuser -l  vagrant -c 'cp /vagrant_data/.bash_profile ~/.bash_profile'
runuser -l  vagrant -c 'source ~/.bash_profile'
runuser -l  vagrant -c 'mkdir ~/.aws'
ansible local -m ping -i /vagrant_data/hosts.yaml

