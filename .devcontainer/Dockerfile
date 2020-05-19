FROM docker.pkg.github.com/nolte/vscode-devcontainers/python:latest

RUN mkdir -p ${WORKON_HOME} \
  && virtualenv -p python3 ${WORKON_HOME}/cookiecutter \
  && source ${WORKON_HOME}/cookiecutter/bin/activate \
  && pip install cookiecutter jinja2-ansible-filters pytest-cookies json-diff autopep8 pylint jsbeautifier \
  && deactivate
