FROM tomcat:9.0.78-jre8-temurin-jammy
COPY ./*.jsp /usr/local/tomcat/webapps/ROOT/
COPY ./context.xml /usr/local/tomcat/conf/
COPY ./server.xml /usr/local/tomcat/conf/
COPY ./mysql-connector-java-8.0.30.jar /usr/local/tomcat/lib
COPY ./web.xml /usr/local/tomcat/webapps/ROOT/
