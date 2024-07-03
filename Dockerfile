FROM ubuntu:24.04

# Based on https://github.com/craumix/jmb-container/tree/master

ENV JMB_VERSION 0.4.1

RUN apt-get update
RUN apt-get install --yes openjdk-11-jre

RUN mkdir -p /jmb
ADD https://github.com/jagrosh/MusicBot/releases/download/$JMB_VERSION/JMusicBot-$JMB_VERSION.jar /jmb/JMusicBot.jar
# ADD https://github.com/jagrosh/MusicBot/releases/download/0.2.9/config.txt /jmb/config/config.txt

COPY ./entry-docker.sh /jmb
RUN chmod +x /jmb/entry-docker.sh

VOLUME /jmb/config

STOPSIGNAL SIGINT

ENTRYPOINT ["/jmb/entry-docker.sh"]
