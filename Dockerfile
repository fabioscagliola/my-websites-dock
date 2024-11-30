FROM nginx:latest
COPY nginx.conf /etc/nginx/nginx.conf
COPY websites /websites
EXPOSE 443

