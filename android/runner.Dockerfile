FROM ubuntu:20.10

LABEL maintainer="Samick"

RUN useradd -ms /bin/bash user

WORKDIR /home/user

RUN apt update && apt install -y openjdk-8-jdk wget unzip && \
    wget https://services.gradle.org/distributions/gradle-5.4.1-bin.zip -P /tmp && \
    unzip -d /opt/gradle /tmp/gradle-5.4.1-bin.zip  && \
    mkdir /opt/gradlew && \
    /opt/gradle/gradle-5.4.1/bin/gradle wrapper --gradle-version 5.4.1 --distribution-type all -p /opt/gradlew && \
    /opt/gradle/gradle-5.4.1/bin/gradle wrapper -p /opt/gradlew

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

RUN apt install openjdk-11-jdk -y
