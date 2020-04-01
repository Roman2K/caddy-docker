FROM alpine:3.10

RUN wget -O /usr/bin/caddy \
  'https://github.com/caddyserver/caddy/releases/download/v2.0.0-beta.20/caddy2_beta20_linux_amd64'
RUN chmod +x /usr/bin/caddy

RUN mkdir /app
RUN addgroup -g 1000 -S app \
  && adduser -u 1000 -S app -G app \
  && chown -R app: /app

WORKDIR /app
COPY config.json .

ENTRYPOINT ["caddy"]
CMD ["run", "-config", "config.json"]
