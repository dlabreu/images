FROM ubi7/ubi:7.7

MAINTAINER Daniel Abreu daniel@deabreu.co.za

LABEL description="A custom Apache container based on UBI 7"

RUN yum install -y httpd && \
    yum clean all

RUN echo "Hello from my first Dockerfile" > /var/www/html/index.html

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]
