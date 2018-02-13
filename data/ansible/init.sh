sudo yum install ansible -y
sudo yum-builddep python -y

ansible-playbook /vagrant_data/first_playbook.yaml
sudo yum updatedb
sudo curl -O https://bootstrap.pypa.io/get-pip.py
sudo /usr/bin/python3.4 get-pip.py
pip --version
pip install awscli --upgrade --user
wget https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip
sudo mkdir /opt/terraform/
sudo chmod 777 /opt/terraform/
unzip terraform_0.11.3_linux_amd64.zip
mv terraform /opt/terraform/
sudo rm ~/.bash_profile
cp /vagrant_data/.bash_profile ~/.bash_profile
runuser -l  vagrant -c 'cp /vagrant_data/.bash_profile ~/.bash_profile'
source ~/.bash_profile
mkdir ~/.aws
ansible local -m ping -i /vagrant_data/hosts.yaml

