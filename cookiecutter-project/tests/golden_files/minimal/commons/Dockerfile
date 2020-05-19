FROM nolte/vscode-commons:latest

# ENV USERNAME=vscode
# ENV USER_UID=1000
# ENV USER_GID=1000
# ENV WORKON_HOME=/home/${USERNAME}/.virtualenvs

RUN mkdir -p ${WORKON_HOME} \
  && virtualenv -p python3 ${WORKON_HOME}/cookiecutter \
  && source ${WORKON_HOME}/cookiecutter/bin/activate \
  && pip install cookiecutter \
  && deactivate