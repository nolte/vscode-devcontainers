
FROM docker.pkg.github.com/nolte/vscode-devcontainers/commons:latest

COPY --chown=${USER_UID}:${USER_GID} files/python-env.txt /home/${USERNAME}/vens/python-env-iot.txt

RUN mkdir -p ${WORKON_HOME} \
  && virtualenv -p python3 ${WORKON_HOME}/usage-iot \
  && source ${WORKON_HOME}/usage-iot/bin/activate \
  && pip install -r /home/${USERNAME}/vens/python-env-iot.txt \
  && deactivate