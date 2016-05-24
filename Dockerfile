FROM resin/rpi-raspbian:jessie
MAINTAINER Aaron Picht <https://github.com/apicht/docker-rpi-ge-cancellation-checker>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install -y wget g++ flex bison-doc bison gperf ruby ruby-dev perl libsqlite3-dev libfontconfig1-dev icu-doc libicu-dev libfreetype6 libssl-dev libpng12-dev libjpeg8-dev ttf-mscorefonts-installer fontconfig build-essential chrpath git-core openssl libicu52 libfontconfig1 python curl git ca-certificates

WORKDIR /ge-cancellation-checker

RUN wget https://github.com/timstanley1985/phantomjs-linux-armv6l/raw/master/phantomjs-2.1.1-linux-armv6l.tar.gz && \
    tar -xzf phantomjs-2.1.1-linux-armv6l.tar.gz && \
    chmod +x phantomjs-2.1.1-linux-armv6l/bin/phantomjs && \
    cp phantomjs-2.1.1-linux-armv6l/bin/phantomjs /usr/local/bin && \
    rm -rf phantomjs-2.1.1-linux-armv6l phantomjs-2.1.1-linux-armv6l.tar.gz

RUN git clone https://github.com/zeeMonkeez/ge-cancellation-checker.git .

CMD ["/ge-cancellation-checker/ge-checker-cron.py"]
