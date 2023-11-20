FROM openjdk:11
WORKDIR /usr/app
COPY target/final-project.war final-project.jar
ENTRYPOINT [ "java", "-jar", "final-project.jar" ]
EXPOSE 8080

