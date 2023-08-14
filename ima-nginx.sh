#!/bin/bash

mv /home/ec2-user/jenkins/test/nginx/nginx/Dockerfile /home/ec2-user/jenkins/test/nginx/ 
aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 028954022636.dkr.ecr.ap-northeast-2.amazonaws.com
docker build -t test /home/ec2-user/jenkins/test/nginx/.
docker tag test:latest 028954022636.dkr.ecr.ap-northeast-2.amazonaws.com/test:nginx1.0
docker push 028954022636.dkr.ecr.ap-northeast-2.amazonaws.com/test:nginx1.0
