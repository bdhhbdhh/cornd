FROM docker.io/openjdk:8-jdk-alpine

#https://github.com/xordiv/docker-alpine-cron
#https://hub.docker.com/r/xordiv/docker-alpine-cron 
COPY /scripts/* /
RUN apk update && apk add dcron && mkdir -p /var/log/cron && mkdir -m 0644 -p /var/spool/cron/crontabs && touch /var/log/cron/cron.log && mkdir -m 0644 -p /etc/cron.d && chmod +x /docker-cmd.sh && chmod +x /docker-entry.sh
ENTRYPOINT ["/docker-entry.sh"]
CMD ["/docker-cmd.sh"]
