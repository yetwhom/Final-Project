FROM nginx:1.24.0
COPY ./default.conf /etc/nginx/conf.d/
COPY ./index.html /usr/share/nginx/html/
COPY ./style.css /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
