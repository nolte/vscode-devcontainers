FROM nolte/vscode-dev-golang

USER root

## copy common tools from devops container
COPY --from=nolte/vscode-devops /usr/local/bin/helm /usr/local/bin/helm
COPY --from=nolte/vscode-devops /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=nolte/vscode-devops /usr/local/bin/kind /usr/local/bin/kind

ENV RELEASE_VERSION=v0.16.0

RUN curl -LO https://github.com/operator-framework/operator-sdk/releases/download/${RELEASE_VERSION}/operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu \
  && chmod +x operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu \
  && mkdir -p /usr/local/bin/ \
  && cp operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu /usr/local/bin/operator-sdk \
  && rm operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu

USER ${USERNAME}

