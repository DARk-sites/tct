FROM alpine:latest

RUN apk add --no-cache ca-certificates ffmpeg tzdata wget \
 && echo "hosts: files dns" > /etc/nsswitch.conf

WORKDIR /app

ADD https://gist.githubusercontent.com/i-tct/91d711c339d322ea300011cf929b7e0d/raw/entrypoint.sh entrypoint.sh

ADD https://github.com/i-tct/tct/releases/latest/download/tct-linux tct-linux

RUN chmod +x tct-linux entrypoint.sh

EXPOSE 7860

ENTRYPOINT ["/bin/sh", "./entrypoint.sh"]
