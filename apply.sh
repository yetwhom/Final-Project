#!/bin/bash

kubectl apply -f /home/ec2-user/jenkins-yaml/test-web-nginx.yaml

kubectl apply -f /home/ec2-user/jenkins-yaml/test-web-tomcat.yaml

