FROM nginx:1.24.0
COPY /home/ec2-user/jenkins/test/nginx/default.conf /etc/nginx/conf.d/
COPY /home/ec2-user/jenkins/test/nginx/index.html /usr/share/nginx/html/
COPY /home/ec2-user/jenkins/test/nginx/style.css /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
