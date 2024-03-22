#syntax=docker/dockerfile:1
FROM openjdk:oraclelinux8
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline
COPY src ./src
CMD ["./mvnw","spring-boot:run"]

# FROM maven:3.8.5-openjdk-17 AS build
# COPY . .
# RUN mvn clean package -DskipTests
#
# FROM openjdk:17.0.1-jdk-slim
# COPY --from=build /target/api-0.0.1-SNAPSHOT.jar api.jar
# EXPOSE 8080
# ENTRYPOINT ["java","-jar","api.jar"]