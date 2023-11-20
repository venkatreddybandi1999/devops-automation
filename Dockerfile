FROM openjdk:11
WORKDIR /usr/app
COPY /var/lib/jenkins/workspace/devops-automaton/target/final-project.jar final-project.jar
ENTRYPOINT [ "java", "-jar", "final-project.jar" ]
EXPOSE 8080

