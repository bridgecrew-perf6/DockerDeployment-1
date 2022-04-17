FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
MAINTAINER nityaranjan190592@gmail.com
RUN yum install -y httpd \ 
zip \ 
unzip
ADD https://github.com/Selenium100/project-website-template/archive/refs/heads/master.zip  /var/www/html/
WORKDIR /var/www/html
RUN unzip master.zip
RUN cp -rvf project-website-template-master/* .
RUN rm -rvf master.zip project-website-template-master
CMD ["/usr/sbin/httpd" , "-D" , "FOREGROUND"]
EXPOSE 80
