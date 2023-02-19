# Build
FROM maven:3.8.4-openjdk-17 as build

COPY . .

RUN mvn clean package


# Run
FROM openjdk:17

ENV ENVIRONMENT=prod

EXPOSE 8080

COPY --from=build target/app.jar app.jar

CMD [ "sh", "-c", "java -jar /app.jar" ]
