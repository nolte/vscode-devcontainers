
FROM nolte/vscode-commons

RUN mkdir -p ${WORKON_HOME} \
  && virtualenv -p python3 ${WORKON_HOME}/development \
  && source ${WORKON_HOME}/development/bin/activate \
  && pip install pytest autopep8 pylint jsbeautifier tox \
  && deactivate