#!/bin/bash

oc apply -f /home/ec2-user/jenkins/mirroring/mirroring-tomcat-web.yaml
oc apply -f /home/ec2-user/jenkins/mirroring/mirroring-nginx-web.yaml