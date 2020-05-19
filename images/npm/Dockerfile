
FROM docker.pkg.github.com/nolte/vscode-devcontainers/commons:latest

USER root

RUN apk add --update-cache \
  nodejs npm \
  && rm -rf /var/cache/apk/* 

USER ${USERNAME}

