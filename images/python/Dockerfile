ARG FROM_REGISTRY=ghcr.io/nolte/vscode-devcontainers
ARG FROM_IMAGE_NAME=commons-golang
ARG FROM_IMAGE_VERSION=latest
FROM ${FROM_REGISTRY}/${FROM_IMAGE_NAME}:${FROM_IMAGE_VERSION}

RUN mkdir -p ${WORKON_HOME} \
  && virtualenv -p python3 ${WORKON_HOME}/development \
  && source ${WORKON_HOME}/development/bin/activate \
  && pip install pytest autopep8 pylint jsbeautifier tox \
  && deactivate