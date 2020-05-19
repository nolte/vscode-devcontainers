
FROM nolte/vscode-commons

USER root

RUN apk add --update-cache \
  nodejs npm \
  && rm -rf /var/cache/apk/* 

USER ${USERNAME}

