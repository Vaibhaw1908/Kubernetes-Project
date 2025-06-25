FROM centos7
MAINTAINER vaibhaw.rxl@gmail.com
RUN yum install -y httpd \
    zip \
    unzip && \
    yum clean all
ADD https://github.com/Vaibhaw1908/files/blob/cda241da1c4a35c64dd3851fe5b2c884c88c4452/photogenic-master.zip /var/www/html/photogenic-master.zip
WORKDIR /var/www/html/
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip
EXPOSE 80 443
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
