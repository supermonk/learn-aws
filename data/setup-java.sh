ORACLE_HASHCODE=2f38c3b165be4555a1fa6e98c45e0808
JAVA_HOME=/java
JDK_VERSION=8u161
JDK_BUILD=b12
PATH=$JAVA_HOME/bin:$PATH
mkdir -p "$JAVA_HOME"
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie;" http://download.oracle.com/otn-pub/java/jdk/$JDK_VERSION-$JDK_BUILD/$ORACLE_HASHCODE/jdk-$JDK_VERSION-linux-x64.tar.gz
RUN tar -xf  jdk-$JDK_VERSION-linux-x64.tar.gz -C $JAVA_HOME --strip-components=1 --exclude='src.zip' --exclude='javafx-src.zip' --exclude='lib/missioncontrol' --exclude='lib/visualvm'
