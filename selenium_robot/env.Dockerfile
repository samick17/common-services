FROM ubuntu:21.04

WORKDIR /app

# Install deps & RobotFramework
RUN apt install wget build-essential zlib1g-dev \
libncurses5-dev libgdbm-dev libnss3-dev \
libssl-dev libreadline-dev libffi-dev curl python3-pip unzip -y

RUN pip install robotframework && \
    pip install -U selenium && \
    pip install webdriver_manager

# Install Chrome Driver
# RUN wget https://chromedriver.storage.googleapis.com/98.0.4758.102/chromedriver_linux64.zip
# RUN unzip chromedriver_linux64.zip
# RUN rm chromedriver_linux64.zip

# Install Chrome
RUN curl -LO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -y ./google-chrome-stable_current_amd64.deb
RUN rm google-chrome-stable_current_amd64.deb
