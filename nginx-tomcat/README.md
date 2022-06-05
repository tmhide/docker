### base image
 - amazonlinux:2
 - amazoncorretto:8
 - tomcat:9-jdk8-corretto
```


### build
```
docker build -t nginx-tomcat:0.0.1 .
docker run --name nginx-tomcat -p 80:80 -d nginx-tomcat:0.0.1
```

### test
```
http://localhost/sample/
```

### Reference
 - https://github.com/wongnai/docker-tomcat-nginx