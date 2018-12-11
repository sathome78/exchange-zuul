FROM java:8
VOLUME /tmp
ARG APP_PATH=/zuul
ARG ENVIRONMENT

RUN mkdir -p zuul
COPY ./target/zuul-0.0.1.jar ${APP_PATH}/zuul-0.0.1.jar
COPY ./target/config/${ENVIRONMENT}/application.yml ${APP_PATH}/application.yml


ARG CONFIG_FILE_PATH="-Dspring.config.location="${ENVIRONMENT}"/application.yml"

WORKDIR ${APP_PATH}

EXPOSE 8080
CMD java -jar sbadmin.jar CONFIG_FILE_PATH
