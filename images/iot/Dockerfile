ARG FROM_REGISTRY=docker.pkg.github.com/nolte/vscode-devcontainers
ARG FROM_IMAGE_NAME=commons-golang
ARG FROM_IMAGE_VERSION=latest
FROM ${FROM_REGISTRY}/${FROM_IMAGE_NAME}:${FROM_IMAGE_VERSION}

COPY --chown=${USER_UID}:${USER_GID} files/python-env.txt /home/${USERNAME}/vens/python-env-iot.txt

RUN mkdir -p ${WORKON_HOME} \
  && virtualenv -p python3 ${WORKON_HOME}/usage-iot \
  && source ${WORKON_HOME}/usage-iot/bin/activate \
  && pip install -r /home/${USERNAME}/vens/python-env-iot.txt \
  && deactivate