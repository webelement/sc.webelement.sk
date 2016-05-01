FROM nginx:alpine
MAINTAINER Vladimír Kriška <ujovlado@gmail.com>

COPY _build /etc/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
