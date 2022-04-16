FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
MAINTAINER nityaranjan190592@gmail.com
RUN yum install -y httpd \ 
zip \ 
unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page277/pigga.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip pigga.zip
RUN cp -rvf pigga/* .
RUN rm -rvf pigga.zip pigga
CMD ["/usr/sbin/httpd" , "-D" , "FOREGROUND"]
EXPOSE 80
