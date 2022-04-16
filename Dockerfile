FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
MAINTAINER nityaranjan190592@gmail.com
RUN yum install -y httpd \ 
zip \ 
unzip
ADD https://github.com/mdn/beginner-html-site-styled/archive/refs/heads/gh-pages.zip  /var/www/html/
WORKDIR /var/www/html
RUN unzip gh-pages.zip
RUN cp -rvf beginner-html-site-styled-gh-pages/* .
RUN rm -rvf gh-pages.zip beginner-html-site-styled-gh-pages
CMD ["/usr/sbin/httpd" , "-D" , "FOREGROUND"]
EXPOSE 80
