#! /bin/bash

chmod 775 apply.sh

chown jenkins:jenkins apply.sh

kubectl apply -f test-web-nginx.yaml

kubectl apply -f test-web-tomcat.yaml
