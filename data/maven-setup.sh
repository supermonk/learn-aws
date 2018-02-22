wget http://mirror.olnevhost.net/pub/apache/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz
tar xvf apache-maven-3.0.5-bin.tar.gz
mv apache-maven-3.0.5  /usr/local/apache-maven
runuser -l  vagrant -c 'export M2_HOME=/usr/local/apache-maven'
runuser -l  vagrant -c 'export M2=$M2_HOME/bin'
runuser -l  vagrant -c 'export PATH=$M2:$PATH'
runuser -l  vagrant -c 'source ~/.bashrc'
