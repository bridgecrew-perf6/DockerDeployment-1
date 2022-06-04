FROM centos:latest
MAINTAINER nityaranjan190592@gmail.com
RUN yum install -y httpd \ 
zip \ 
unzip
ADD https://github.com/Selenium100/JavascriptPractice/archive/refs/heads/master.zip  /var/www/html/
WORKDIR /var/www/html
RUN unzip master.zip
RUN cp -rvf JavascriptPractice-master/* .
RUN rm -rvf master.zip JavascriptPractice-master
CMD ["/usr/sbin/httpd" , "-D" , "FOREGROUND"]
EXPOSE 80
