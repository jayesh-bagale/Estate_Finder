FROM maven:3.9.9-eclipse-temurin-11 AS build

WORKDIR /workspace
COPY . .
RUN mvn -B clean package -DskipTests

FROM eclipse-temurin:11-jre-jammy

WORKDIR /app
COPY --from=build /workspace/target/realestate-0.0.1-SNAPSHOT.war /app/app.war

ENV PORT=8080
ENV UPLOAD_DIR=/app/uploads
ENV SPRING_PROFILES_ACTIVE=railway

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.war"]
