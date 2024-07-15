FROM ubuntu:24.04

# Based on https://github.com/craumix/jmb-container/tree/master

# Set version from compose build
ARG JMB_VERSION

RUN apt-get update
RUN apt-get install --yes openjdk-11-jre

RUN mkdir -p /jmb
ADD https://github.com/jagrosh/MusicBot/releases/download/$JMB_VERSION/JMusicBot-$JMB_VERSION.jar /jmb/JMusicBot.jar

COPY ./entry-docker.sh /jmb
RUN chmod +x /jmb/entry-docker.sh

VOLUME /jmb/config

STOPSIGNAL SIGINT

ENTRYPOINT ["/jmb/entry-docker.sh"]
