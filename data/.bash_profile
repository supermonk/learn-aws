# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export PATH=$PATH:$HOME/.local/bin:$HOME/bin
export TERRAFORM_HOME=/opt/terraform
export PATH=$TERRAFORM_HOME:$PATH
export JAVA_HOME=/java
export PATH=$M2:$JAVA_HOME
export M2_HOME=/usr/local/apache-maven
export M2=$M2_HOME/bin
export PATH=$M2:$PATH
