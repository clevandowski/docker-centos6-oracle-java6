FROM centos:centos6

ENV JAVA_VERSION 6u45
ENV BUILD_VERSION b06

RUN yum -y upgrade
RUN yum -y install wget

# Downloading Java
RUN wget --no-cookies \
         --no-check-certificate \
         --header "Cookie: oraclelicense=accept-securebackup-cookie" \
         "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/jdk-$JAVA_VERSION-linux-x64-rpm.bin" \
         -O /tmp/jdk-$JAVA_VERSION-linux-x64-rpm.bin

RUN chmod a+x /tmp/jdk-$JAVA_VERSION-linux-x64-rpm.bin
RUN /tmp/jdk-$JAVA_VERSION-linux-x64-rpm.bin
RUN rm /tmp/jdk-$JAVA_VERSION-linux-x64-rpm.bin
RUN yum -y localinstall /jdk-$JAVA_VERSION-linux-amd64.rpm
RUN rm /jdk-$JAVA_VERSION-linux-amd64.rpm
RUN yum clean all

ENV JAVA_HOME /usr/java/latest

