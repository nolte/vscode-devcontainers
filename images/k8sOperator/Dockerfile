ARG FROM_REGISTRY=docker.pkg.github.com/nolte/vscode-devcontainers
ARG FROM_IMAGE_NAME=golang
ARG FROM_IMAGE_VERSION=latest
FROM ${FROM_REGISTRY}/${FROM_IMAGE_NAME}:${FROM_IMAGE_VERSION}

USER root

## copy common tools from devops container
COPY --from=docker.pkg.github.com/nolte/vscode-devcontainers/devops:latest /usr/local/bin/helm /usr/local/bin/helm
COPY --from=docker.pkg.github.com/nolte/vscode-devcontainers/devops:latest /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=docker.pkg.github.com/nolte/vscode-devcontainers/devops:latest /usr/local/bin/kind /usr/local/bin/kind

ENV RELEASE_VERSION=v0.16.0

RUN curl -LO https://github.com/operator-framework/operator-sdk/releases/download/${RELEASE_VERSION}/operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu \
  && chmod +x operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu \
  && mkdir -p /usr/local/bin/ \
  && cp operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu /usr/local/bin/operator-sdk \
  && rm operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu

USER ${USERNAME}

