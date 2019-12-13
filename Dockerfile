FROM nginx
SHELL ["bash", "-c"]
WORKDIR /usr/share/nginx
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y openssl
COPY . .
RUN rm -fr html && ln -sfn public html \
 && . ssl-keygen \
 && . ssl-client-keygen \
 && openssl dhparam 2048 > tls/dhparam.pem \
 && cp nginx.conf /etc/nginx/nginx.conf \
 && cp default.conf /etc/nginx/conf.d/default.conf
RUN rm -fr /var/lib/apt/lists/*
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
