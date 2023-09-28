ARG FROM_REGISTRY=docker.pkg.github.com/nolte/vscode-devcontainers
ARG FROM_IMAGE_NAME=commons
#ARG FROM_IMAGE_NAME=golang
ARG FROM_IMAGE_VERSION=latest

FROM ${FROM_REGISTRY}/${FROM_IMAGE_NAME}:${FROM_IMAGE_VERSION}

USER ${USERNAME}

ENV ASDF_VERSION=v0.13.1

COPY --chown=${USER_UID}:${USER_GID} files/.tool-versions /home/${USERNAME}/.tool-versions
COPY --chown=${USER_UID}:${USER_GID} files/.zshrc /home/${USERNAME}/.zshrc

RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch ${ASDF_VERSION} && \
    echo '. $HOME/.asdf/asdf.sh' >> $HOME/.bashrc && \
    echo '. $HOME/.asdf/asdf.sh' >> $HOME/.profile

ENV PATH="${PATH}:/home/${USERNAME}/.asdf/shims:/home/${USERNAME}/.asdf/bin"


RUN asdf plugin add chezmoi https://github.com/nolte/asdf-chezmoi.git \
    && asdf plugin update chezmoi fix/39-alpine-usage \
    && asdf install

ENV ASDF_DIR="/home/${USERNAME}/.asdf"

RUN  chezmoi init https://github.com/nolte/workstation.git --branch feature/toolset \
    && source ~/.bashrc \
    && chezmoi apply \
    && asdf install
