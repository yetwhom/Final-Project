FROM ubuntu:20.04
LABEL maintainer="Simple Nginx-Tomcat WAS Service"
RUN apt-get update && apt-get install -y openjdk-8-jdk wget
WORKDIR /tmp
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.76/bin/apache-tomcat-9.0.76.tar.gz -O /tmp/tomcat.tar.gz
RUN tar xvfz tomcat.tar.gz
RUN mkdir /usr/local/tomcat
RUN mkdir /usr/local/tomcat/webapps/ROOT/backend/
RUN mv /tmp/apache-tomcat-9.0.76/* /usr/local/tomcat/
RUN rm -rf /tmp/apache* /tmp/tomcat.tar.gz
COPY cardata.jsp /usr/local/tomcat/webapps/ROOT/backend/
COPY context.xml /usr/local/tomcat/conf/
COPY mysql-connector-j-8.0.30.jar /usr/local/tomcat/lib
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV PATH=$PATH:$JAVA_HOME/bin
ENV CLASSPATH=$JAVA_HOME/jre/lib:$JAVA_HOME/lib/tools.jar
ENV CATALINA_HOME=/usr/local/tomcat
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
EXPOSE 8080
