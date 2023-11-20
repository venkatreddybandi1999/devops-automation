FROM openjdk:11
COPY /target/final-project.jar .
ENTRYPOINT [ "java", "-jar", "final-project.jar" ]
EXPOSE 8080

