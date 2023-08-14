FROM tomcat:9.0.78-jre8-temurin-jammy
COPY /home/ec2-user/jenkins/test/tomcat/*.jsp /usr/local/tomcat/webapps/ROOT/
COPY /home/ec2-user/jenkins/test/tomcat/context.xml /usr/local/tomcat/conf/
COPY /home/ec2-user/jenkins/test/tomcat/server.xml /usr/local/tomcat/conf/
COPY /home/ec2-user/jenkins/test/tomcat/mysql-connector-java-8.0.30.jar /usr/local/tomcat/lib
COPY /home/ec2-user/jenkins/test/tomcat/web.xml /usr/local/tomcat/webapps/ROOT/
