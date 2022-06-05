FROM tomcat:9-jdk8-corretto

# add repo for installing nginx
ADD yum/nginx.repo /etc/yum.repos.d
ADD docker-entrypoint.sh /usr/local/tomcat/bin

RUN set -eux \
  && yum -y update \
  && yum install -y nginx \
  && chmod +x /usr/local/tomcat/bin/docker-entrypoint.sh

# nginx
ADD nginx/default.conf /etc/nginx/conf.d

# sample.war
ADD tomcat/sample.war /usr/local/tomcat/webapps

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log \
	&& ln -sf /dev/stdout /usr/local/tomcat/logs/catalina.out

ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 80