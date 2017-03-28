FROM openjdk:8u121-jre-alpine

MAINTAINER civilis

RUN apt-get install tzdata \
  && rm -rf /var/cache/apk/* \
  && cp /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime \
  && echo "Europe/Amsterdam" >  /etc/timezone 
#  && echo "Europe/Amsterdam" >  /etc/timezone \
#  && apt-get remove tzdata

VOLUME /tmp
ADD countryService.jar countryService.jar
ADD application.yml application.yml
#COPY data /data/

EXPOSE 8070
ENTRYPOINT ["java","-jar","/countryService.jar"]
