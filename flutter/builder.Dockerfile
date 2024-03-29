FROM ubuntu:20.10 as builder

LABEL maintainer="Samick"

RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget
RUN useradd -ms /bin/bash user
USER user
WORKDIR /home/user

#Installing Android SDK
RUN mkdir -p Android/sdk
ENV ANDROID_SDK_ROOT /home/user/Android/sdk
RUN mkdir -p .android && touch .android/repositories.cfg && \
    wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip  && \
    unzip sdk-tools.zip && rm sdk-tools.zip && \
    mv tools Android/sdk/tools

RUN cd Android/sdk/tools/bin && yes | ./sdkmanager --licenses
RUN cd Android/sdk/tools/bin && ./sdkmanager "build-tools;28.0.3" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"

ENV PATH "$PATH:/home/user/Android/sdk/platform-tools"
ENV PATH "$PATH:/home/user/Android/sdk/tools/bin"

RUN cd Android/sdk/tools/bin && ./sdkmanager --install "cmdline-tools;latest"

#Installing Flutter SDK
RUN git clone https://github.com/flutter/flutter.git
ENV PATH "$PATH:/home/user/flutter/bin"
# RUN flutter channel dev
RUN flutter upgrade
RUN flutter doctor
