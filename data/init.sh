sudo yum install mlocate -y
sudo yum updatedb
sudo yum install vim -y
sudo yum install -y  yum-utils python-argparse
sudo yum-builddep python -y
sudo yum install epel-release -y
sudo yum install python34 -y
sudo curl -O https://bootstrap.pypa.io/get-pip.py
sudo /usr/bin/python3.4 get-pip.py
pip --version
pip install awscli --upgrade --user
sudo yum install ansible -y
sudo yum install wget -y
wget https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip
sudo mkdir /opt/terraform/
sudo chmod 777 /opt/terraform/
unzip terraform_0.11.3_linux_amd64.zip
mv terraform /opt/terraform/
echo "PATH=$PATH:$HOME/.local/bin:$HOME/bin" > ~/.bash_profile
echo "export TERRAFORM_HOME=/opt/terraform/terraform" >> ~/.bash_profile
echo "export PATH=$TERRAFORM_HOME:$PATH" >> ~/.bash_profile
source ~/.bash_profile
mkdir ~/.aws
ansible local -m ping -i /vagrant_data/hosts.yaml

