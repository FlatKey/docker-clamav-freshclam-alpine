FROM alpine:latest

RUN apk --no-cache add clamav \
    && mkdir /run/clamav \
    && chown clamav:clamav /run/clamav

COPY config/ /etc/clamav/

VOLUME /var/lib/clamav
WORKDIR /var/lib/clamav

CMD ["freshclam","-d"]
