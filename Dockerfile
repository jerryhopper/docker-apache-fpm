FROM httpd:latest
MAINTAINER hopper.jerry@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /app/web && \
	mkdir -p /usr/local/apache2/conf/other/

COPY app.conf /usr/local/apache2/conf/other/app.conf
COPY production.conf /usr/local/apache2/conf/other/production.conf
COPY php-fpm.conf /usr/local/apache2/conf/other/php-fpm.conf
RUN echo 'IncludeOptional /usr/local/apache2/conf/other/*.conf' >> /usr/local/apache2/conf/httpd.conf

# ENV
VOLUME /app
WORKDIR /app
ENV TERM xterm
ENV APACHE_DOCUMENTROOT /app
