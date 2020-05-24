
FROM qmcgaw/basedevcontainer:alpine

ENV USERNAME=vscode
ENV USER_UID=1000
ENV USER_GID=1000
ENV WORKON_HOME=/home/${USERNAME}/.virtualenvs

# https://github.com/cli/cli/releases/
ENV GH_CLI_VERSION=0.8.0

USER root

# Adding fonts

# clone
RUN git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts
WORKDIR /tmp/fonts
RUN ./install.sh

WORKDIR /
RUN rm -rf /tmp/fonts


# This hack is widely applied to avoid python printing issues in docker containers.
# See: https://github.com/Docker-Hub-frolvlad/docker-alpine-python3/pull/13
ENV PYTHONUNBUFFERED=1

RUN echo "**** install Python ****" && \
  apk add --update-cache \
  curl wget \
  boost-regex \
  sed \
  jq tar rsync unzip tree vim \
  bash \
  zip \
  libc6-compat python3 build-base python3-dev libffi libffi-dev openssl-dev \
  linux-headers gnupg openssl gcc build-base libc-dev musl-dev ca-certificates \
  && rm -rf /var/cache/apk/* && \
  if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
  \
  echo "**** install pip ****" && \
  python3 -m ensurepip && \
  rm -r /usr/lib/python*/ensurepip && \
  pip3 install --no-cache --upgrade pip setuptools wheel virtualenvwrapper virtualenv && \
  if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi


RUN mkdir -p /opt/pass && \
  wget https://git.zx2c4.com/password-store/snapshot/password-store-1.7.3.tar.xz -O /tmp/password-store.tar.xz && \
  tar -xf /tmp/password-store.tar.xz -C /opt/pass && \
  ln -s /opt/pass/password-store-1.7.3 /opt/pass/current && \
  cd /opt/pass/current/ && \
  make install

RUN mkdir -p /home/$USERNAME/.vscode-server/extensions \
  /home/$USERNAME/.vscode-server-insiders/extensions \
  && chown -R $USERNAME \
  /home/$USERNAME/.vscode-server \
  /home/$USERNAME/.vscode-server-insiders

RUN curl -Lo ./gh.tar.gz https://github.com/cli/cli/releases/download/v${GH_CLI_VERSION}/gh_${GH_CLI_VERSION}_linux_amd64.tar.gz \
  && tar -zxf ./gh.tar.gz \
  && mv ./gh_${GH_CLI_VERSION}_linux_amd64/bin/gh /usr/local/bin/gh \
  && chmod +x /usr/local/bin/gh \
  && rm ./gh.tar.gz \
  && rm -rf ./gh_${GH_CLI_VERSION}_linux_amd64

USER ${USERNAME}

COPY --chown=${USER_UID}:${USER_GID} files/python-env-basement.txt /home/${USERNAME}/vens/python-env-basement.txt


RUN mkdir -p ${WORKON_HOME} \
  && virtualenv -p python3 ${WORKON_HOME}/development \
  && source ${WORKON_HOME}/development/bin/activate \
  && pip install -r /home/${USERNAME}/vens/python-env-basement.txt \
  && deactivate

COPY --chown=${USER_UID}:${USER_GID} files/.zshrc-specific  files/.welcome.sh /home/${USERNAME}/
RUN touch /home/${USERNAME}/.zshrc-specific.sh