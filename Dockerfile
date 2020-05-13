FROM jenkins/jenkins:lts

#Copying init-script
COPY init-scripts /usr/share/jenkins/ref/init.groovy.d

#Copying configurations as a code
ENV CASC_JENKINS_CONFIG /usr/share/jenkins/ref/
ADD jenkins.yaml /usr/share/jenkins/ref/

#Installing Plugins
COPY plugins.sh /usr/local/bin/plugins.sh
COPY install-plugins.sh /usr/local/bin/install-plugins.sh
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
