#!/bin/bash

mv /home/ec2-user/jenkins/test/tomcat/tomcat/Dockerfile /home/ec2-user/jenkins/test/tomcat/ 
aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 028954022636.dkr.ecr.ap-northeast-2.amazonaws.com
docker build -t test /home/ec2-user/jenkins/test/tomcat/.
docker tag test:latest 028954022636.dkr.ecr.ap-northeast-2.amazonaws.com/test:tomcat1.0
docker push 028954022636.dkr.ecr.ap-northeast-2.amazonaws.com/test:tomcat1.0
