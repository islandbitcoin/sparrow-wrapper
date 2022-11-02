FROM openjdk:18.0.1.1-jdk-slim-bullseye

# arm64 or amd64
ARG PLATFORM
# aarch64 or x86_64
ARG ARCH
RUN apt-get update && apt-get install -y curl tini bash rpm fakeroot binutils wget
RUN wget https://github.com/mikefarah/yq/releases/download/v4.6.3/yq_linux_${PLATFORM}.tar.gz -O - |\
  tar xz && mv yq_linux_${PLATFORM} /usr/bin/yq

WORKDIR /sparrow/
COPY sparrow .
RUN wget https://services.gradle.org/distributions/gradle-7.5-bin.zip
# RUN ./gradlew jpackage 

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh
