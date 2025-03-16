FROM docker.io/library/alpine:3.21.3 AS base
FROM base AS build
RUN apk add --no-cache curl
RUN curl -sL https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz \
  | gunzip > /usr/local/bin/elm && chmod +x /usr/local/bin/elm
FROM base AS final
COPY --from=build /usr/local/bin/elm /usr/local/bin/elm
ENTRYPOINT ["/usr/local/bin/elm"]
