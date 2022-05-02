FROM openjdk:8
EXPOSE 8080
ADD target/springboot-jenkins-part1-0.0.1-SNAPSHOT.jar springboot-jenkins-part1-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/springboot-jenkins-part1-0.0.1-SNAPSHOT.jar"]
