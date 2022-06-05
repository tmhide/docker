### nginx-tomcat
```
# build
docker build -t nginx-tomcat:0.0.1 .
docker run --name nginx-tomcat -p 80:80 -d nginx-tomcat:0.0.1
# test
http://localhost/sample/
```

### Reference
 - https://github.com/wongnai/docker-tomcat-nginx