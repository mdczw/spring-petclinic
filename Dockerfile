FROM eclipse-temurin:17-jdk-alpine as build
WORKDIR /workspace/app
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .
COPY src src
RUN ./gradlew clean build -x test 

FROM eclipse-temurin:17-jre-alpine
VOLUME /tmp
COPY --from=build /workspace/app/build/libs/*.jar app.jar
COPY monitoring monitoring
ADD https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.20.0/jmx_prometheus_javaagent-0.20.0.jar ./monitoring/
ENTRYPOINT ["java","-javaagent:./monitoring/jmx_prometheus_javaagent-0.20.0.jar=1234:monitoring/config.yaml", "-jar","/app.jar"]
