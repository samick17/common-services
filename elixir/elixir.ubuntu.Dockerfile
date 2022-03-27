FROM ubuntu:20.04 AS server_builder

ENV MIX_ENV=dev \
    TEST=1 \
    LANG=C.UTF-8

RUN apt update && \
    apt install -y git wget && \
    apt install gnupg -y

RUN mkdir /app
WORKDIR /app

RUN wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && dpkg -i erlang-solutions_2.0_all.deb && \
	apt update && \
    apt install esl-erlang -y && \
    apt install elixir -y && \
    apt install inotify-tools -y && \
    apt clean autoclean && \
    apt autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/
