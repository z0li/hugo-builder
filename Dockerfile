FROM ruby:2.6-alpine3.9

ENV HUGO_VERSION=0.55.5

RUN apk add --no-cache make gcc libc-dev bash libcurl ruby-nokogiri \
      openssh-client rsync git && \
    gem install --no-document html-proofer

RUN mkdir /tmp/hugo && \
    cd /tmp/hugo && \
    wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    tar xzvf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    mv /tmp/hugo/hugo /usr/local/bin/ && \
    rm -rf /tmp/hugo

CMD [ "hugo", "version" ]
