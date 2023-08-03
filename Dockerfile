FROM tomcat:9.0.78-jre8-temurin-jammy
COPY /webapps/ROOT/* /usr/local/tomcat/webapps/ROOT/
COPY /lib/context.xml /usr/local/tomcat/conf/
COPY /lib/server.xml /usr/local/tomcat/conf/
COPY /lib/mysql-connector-j-8.0.30.jar /usr/local/tomcat/lib
COPY /webapps/ROOT/WEB-INT/web.xml /usr/local/tomcat/webapps/ROOT/
