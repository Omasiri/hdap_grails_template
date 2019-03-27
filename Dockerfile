################## BUILD ##################
FROM openjdk:8u151-jdk as BUILD

# this first part only copies the basic configuration file
# so we can download and cache dependencies
WORKDIR /app
COPY build.gradle gradlew gradle.properties /app/
COPY gradle /app/gradle
COPY grails-app/conf /app/grails-app/conf
# notice that we are explicitly ignoring the result
# because we just want to force gradle to download the dependencies
RUN ./gradlew build || return 0

# now we'll compile the application for real
COPY . .
RUN ./gradlew appJar
RUN mv build/binary/*.jar /app/app.jar

################## RUNTIME ##################
FROM java:8u111-jre-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY --from=BUILD /app/app.jar .

CMD ["/usr/bin/java","-Djava.security.egd=file:/dev/./urandom","-jar","/usr/src/app/app.jar"]