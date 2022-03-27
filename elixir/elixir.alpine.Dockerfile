FROM elixir:alpine AS server_builder

# Set environment variables for building the application
ENV MIX_ENV=prod \
    TEST=1 \
    LANG=C.UTF-8

RUN mkdir /app
WORKDIR /app

RUN apk add --update git && \
    apk add --virtual build-dependencies && \
    apk add build-base && \
    rm -rf /var/cache/apk/*
