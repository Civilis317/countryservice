FROM openjdk:8u121-jre-alpine

MAINTAINER civilis


#VOLUME /tmp
ADD countryService.jar countryService.jar
ADD application.yml application.yml
#COPY data /data/

EXPOSE 8080
ENTRYPOINT ["java","-jar","/countryService.jar"]
