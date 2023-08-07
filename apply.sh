#!/bin/bash

kubectl apply -f test-web-nginx.yaml

kubectl apply -f test-web-tomcat.yaml

mkdir ./test1