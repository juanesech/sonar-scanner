FROM openjdk:8u191-jre-alpine

ENV SONAR_SCANNER_VERSION="3.3.0.1492"
RUN apk add wget zip

RUN wget "https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.3.0.1492-linux.zip"
RUN unzip "sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip"
RUN rm -rf "/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/jre/bin/java"
RUN ln -s  "/usr/bin/java" "/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/jre/bin/java"
RUN ln -s  /sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin/sonar-scanner /usr/bin/sonar-scanner

ENTRYPOINT sonar-scanner