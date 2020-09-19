ARG FROM_REGISTRY=docker.pkg.github.com/nolte/vscode-devcontainers
#ARG FROM_IMAGE_NAME=commons-golang
ARG FROM_IMAGE_NAME=golang
ARG FROM_IMAGE_VERSION=latest
FROM ${FROM_REGISTRY}/${FROM_IMAGE_NAME}:${FROM_IMAGE_VERSION}

#ARG USERNAME=vscode
#ARG USER_UID=1000
#ARG USER_GID=1000

USER root

# https://github.com/helm/helm/releases
ENV HELM_VERSION=v3.3.3

# https://github.com/kubernetes-sigs/kind/releases
ENV KIND_VERSION=v0.9.0

# https://github.com/helm/chart-testing/releases
ENV HELM_CHART_TESTING_VERSION=3.0.0

# https://github.com/helm/chart-releaser
ENV HELM_CHART_RELEASER_VERSION=1.0.0

# https://github.com/docker/buildx/releases
ENV DOCKERX_VERSION=v0.4.2

# https://github.com/hashicorp/terraform/releases
ENV TERRAFORM_VERSION=0.13.3

# https://github.com/bats-core/bats-core/releases
ENV BATS_VERSION=1.2.1

# https://github.com/mikefarah/yq/releases
ENV YQ_VERSION=3.4.0

# https://github.com/hashicorp/vault/releases
ENV VAULT_VERSION=1.5.3

## https://github.com/gavinbunney/terraform-provider-kubectl/releases
#ENV TERRAFORM_KUBECTL_PROVIDER_VERSION=v1.5.1
#
## https://github.com/aminueza/terraform-provider-minio/releases
#ENV TERRAFORM_MINIO_PROVIDER_VERSION=1.1.0
#
## https://github.com/mrparkers/terraform-provider-keycloak/releases
#ENV TERRAFORM_KEYCLOAK_PROVIDER_VERSION=1.20.0
#
## https://github.com/nolte/terraform-provider-harbor/releases
#ENV TERRAFORM_HARBOR_PROVIDER_VERSION=0.1.5

# https://github.com/camptocamp/terraform-provider-pass/releases
#ENV TERRAFORM_PASS_PROVIDER_VERSION=v1.3.0

# https://github.com/go-swagger/go-swagger/releases
ENV SWAGGER_VERSION=v0.25.0

# https://github.com/terraform-docs/terraform-docs/releases
ENV TERRAFORM_DOC_VERSION=v0.9.1

# https://github.com/cli/cli/releases
ENV GITHUB_CLI_VERSION=1.0.0

# https://github.com/tektoncd/cli/releases
ENV TEKTONCD_CLI_VERSION=0.12.1

# https://github.com/kubernetes-sigs/kustomize/releases
ENV KUSTOMIZE_VERSION=3.8.3

# https://github.com/hashicorp/packer/releases
ARG PACKER_VERSION=1.6.2


RUN apk add --update-cache \
  ncurses \
  nodejs npm \
  && rm -rf /var/cache/apk/* 

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl \
  && chmod +x ./kubectl \
  && mv ./kubectl /usr/local/bin/kubectl

RUN curl -Lo ./helm.tar.gz https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz \
  && tar -zxvf ./helm.tar.gz \
  && mv ./linux-amd64/helm /usr/local/bin/helm \
  && chmod +x /usr/local/bin/helm \
  && rm ./helm.tar.gz \
  && rm -rf ./linux-amd64

RUN curl -Lo ./terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && unzip ./terraform.zip \
  && mv ./terraform /usr/local/bin/terraform \
  && chmod +x /usr/local/bin/terraform \
  && rm ./terraform.zip

RUN curl -Lo ./kind https://github.com/kubernetes-sigs/kind/releases/download/${KIND_VERSION}/kind-$(uname)-amd64 \
  && chmod +x ./kind \
  && mv ./kind /usr/local/bin/kind

RUN curl -Lo /usr/local/bin/kubetail https://raw.githubusercontent.com/johanhaleby/kubetail/master/kubetail \
  && chmod +x /usr/local/bin/kubetail 

RUN curl -sSL -k https://github.com/bats-core/bats-core/archive/v${BATS_VERSION}.tar.gz -o /tmp/bats.tgz \
  && tar -zxf /tmp/bats.tgz -C /tmp \
  && /bin/bash /tmp/bats-core-${BATS_VERSION}/install.sh /usr/local

RUN curl -Lo /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 \
  && chmod +x /usr/local/bin/yq 

RUN curl -Lo ./vault.zip https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip \
  && unzip ./vault.zip \
  && mv ./vault /usr/local/bin/vault \
  && chmod +x /usr/local/bin/vault \
  && rm ./vault.zip

# minio admin tools
RUN curl -Lo /usr/local/bin/mc https://dl.min.io/client/mc/release/linux-amd64/mc \
  && chmod +x /usr/local/bin/mc 

RUN curl -Lo /usr/local/bin/swagger https://github.com/go-swagger/go-swagger/releases/download/${SWAGGER_VERSION}/swagger_linux_amd64 \
  && chmod +x /usr/local/bin/swagger 

RUN curl -Lo /usr/local/bin/terraform-doc https://github.com/segmentio/terraform-docs/releases/download/${TERRAFORM_DOC_VERSION}/terraform-docs-${TERRAFORM_DOC_VERSION}-$(uname | tr '[:upper:]' '[:lower:]')-amd64 \
  && chmod +x /usr/local/bin/terraform-doc 


RUN curl -sSL -k https://github.com/koalaman/shellcheck/releases/download/stable/shellcheck-stable.linux.x86_64.tar.xz -o /tmp/shellcheck-stable.tar.xz \
  && tar -xvf /tmp/shellcheck-stable.tar.xz -C /tmp \
  && mv /tmp/shellcheck-stable/shellcheck /usr/local/bin/shellcheck \
  && chmod +x /usr/local/bin/shellcheck \
  && rm -rf /tmp/shellcheck-stable \
  && rm /tmp/shellcheck-stable.tar.xz

RUN curl -Lo /usr/local/bin/skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 \
  && chmod +x /usr/local/bin/skaffold

# install tekton binary
RUN curl -LO https://github.com/tektoncd/cli/releases/download/v${TEKTONCD_CLI_VERSION}/tkn_${TEKTONCD_CLI_VERSION}_Linux_x86_64.tar.gz \
  && tar xvzf tkn_${TEKTONCD_CLI_VERSION}_Linux_x86_64.tar.gz -C /usr/local/bin tkn \
  && rm tkn_${TEKTONCD_CLI_VERSION}_Linux_x86_64.tar.gz \
  && chmod +x /usr/local/bin/tkn

RUN curl -LO https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz \
  && tar xvzf kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz -C /usr/local/bin kustomize \
  && rm kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz \
  && chmod +x /usr/local/bin/kustomize


RUN mkdir -p /tmp/chart-testing \
  && curl -L https://github.com/helm/chart-testing/releases/download/v${HELM_CHART_TESTING_VERSION}/chart-testing_${HELM_CHART_TESTING_VERSION}_linux_amd64.tar.gz -o /tmp/chart-testing/chart-testing.tar.gz \
  && tar xvzf /tmp/chart-testing/chart-testing.tar.gz -C /tmp/chart-testing \
  && mkdir -p /etc/ct \
  && mv /tmp/chart-testing/ct /usr/local/bin/ct \
  && mv /tmp/chart-testing/etc/chart_schema.yaml /etc/ct/chart_schema.yaml \
  && mv /tmp/chart-testing/etc/lintconf.yaml /etc/ct/lintconf.yaml \
  && rm -rf /tmp/chart-testing \
  && chmod +x /usr/local/bin/ct


RUN mkdir -p /tmp/chart-releaser \
  && curl -L https://github.com/helm/chart-releaser/releases/download/v${HELM_CHART_RELEASER_VERSION}/chart-releaser_${HELM_CHART_RELEASER_VERSION}_linux_amd64.tar.gz -o /tmp/chart-releaser/chart-releaser.tar.gz \
  && tar xvzf /tmp/chart-releaser/chart-releaser.tar.gz -C /tmp/chart-releaser \
  && mv /tmp/chart-releaser/cr /usr/local/bin/cr \
  && rm -rf /tmp/chart-releaser \
  && chmod +x /usr/local/bin/cr


# https://github.com/GoogleContainerTools/container-structure-test
RUN curl -LO https://storage.googleapis.com/container-structure-test/latest/container-structure-test-linux-amd64 && chmod +x container-structure-test-linux-amd64 && mv container-structure-test-linux-amd64 /usr/local/bin/container-structure-test


RUN curl -Lo ./terraform-docs https://github.com/terraform-docs/terraform-docs/releases/download/${TERRAFORM_DOCS_VERSION}/terraform-docs-${TERRAFORM_DOCS_VERSION}-$(uname | tr '[:upper:]' '[:lower:]')-amd64 && \
  chmod +x ./terraform-docs && \
  mv ./terraform-docs /usr/local/bin/terraform-docs

RUN mkdir -p /tmp/ghcli \
  && curl -L https://github.com/cli/cli/releases/download/v${GITHUB_CLI_VERSION}/gh_${GITHUB_CLI_VERSION}_linux_arm64.tar.gz -o /tmp/ghcli/gh.tar.gz \
  && tar xvzf /tmp/ghcli/gh.tar.gz -C /tmp/ghcli \
  && mv /tmp/ghcli/gh_${GITHUB_CLI_VERSION}_linux_arm64/bin/gh /usr/local/bin/gh \
  && rm -rf /tmp/ghcli \
  && chmod +x /usr/local/bin/gh



RUN mkdir -p /tmp/packer/ \
  && curl -Lo /tmp/packer/packer.zip https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip \
  && unzip "/tmp/packer/packer.zip" -d /usr/local/bin \
  && rm -rf /tmp/packer \
  && chmod +x /usr/local/bin/packer


USER ${USERNAME}

COPY --chown=${USER_UID}:${USER_GID} files/python-env-usage-ansible.txt /home/${USERNAME}/vens/python-env-usage-ansible.txt
#ARG WORKON_HOME=/home/${USERNAME}/.virtualenvs

RUN mkdir -p ${WORKON_HOME} \
  && virtualenv -p python3 ${WORKON_HOME}/usage-ansible \
  && source ${WORKON_HOME}/usage-ansible/bin/activate \
  && pip install -r /home/${USERNAME}/vens/python-env-usage-ansible.txt \
  && deactivate

COPY --chown=${USER_UID}:${USER_GID} files/devops-zshrc-specific /home/${USERNAME}/.zshrc-specific
COPY --chown=${USER_UID}:${USER_GID} files/devops-welcome.sh /home/${USERNAME}/.welcome.sh


#RUN mkdir -p /home/${USERNAME}/.terraform.d/plugins/linux_amd64 \
#  && curl -Lo /home/${USERNAME}/.terraform.d/plugins/linux_amd64/terraform-provider-kubectl https://github.com/gavinbunney/terraform-provider-kubectl/releases/download/${TERRAFORM_KUBECTL_PROVIDER_VERSION}/terraform-provider-kubectl-linux-amd64 \
#  && chmod +x /home/${USERNAME}/.terraform.d/plugins/linux_amd64/terraform-provider-kubectl 
#
#
#RUN mkdir -p /home/${USERNAME}/.terraform.d/plugins/linux_amd64 \
#  && curl -Lo /home/${USERNAME}/.terraform.d/plugins/linux_amd64/terraform-provider-minio https://github.com/aminueza/terraform-provider-minio/releases/download/${TERRAFORM_MINIO_PROVIDER_VERSION}/terraform-provider-minio_v${TERRAFORM_MINIO_PROVIDER_VERSION}_linux_amd64 \
#  && chmod +x /home/${USERNAME}/.terraform.d/plugins/linux_amd64/terraform-provider-minio 
#
#
#RUN mkdir -p /tmp/terraform-provider-keycloak/ \
#  && curl -Lo /tmp/terraform-provider-keycloak/terraform-provider-keycloak.zip https://github.com/mrparkers/terraform-provider-keycloak/releases/download/${TERRAFORM_KEYCLOAK_PROVIDER_VERSION}/terraform-provider-keycloak_v${TERRAFORM_KEYCLOAK_PROVIDER_VERSION}_linux_amd64.zip \
#  && unzip -j "/tmp/terraform-provider-keycloak/terraform-provider-keycloak.zip" "terraform-provider-keycloak_v${TERRAFORM_KEYCLOAK_PROVIDER_VERSION}" -d /home/${USERNAME}/.terraform.d/plugins/linux_amd64 \
#  && rm -rf /tmp/terraform-provider-keycloak \
#  && chmod +x /home/${USERNAME}/.terraform.d/plugins/linux_amd64/terraform-provider-keycloak*
#
#
#RUN mkdir -p /tmp/terraform-provider-harbor/ \
#  && curl -Lo /tmp/terraform-provider-harbor/terraform-provider-harbor.zip https://github.com/BESTSELLER/terraform-harbor-provider/releases/download/v${TERRAFORM_HARBOR_PROVIDER_VERSION}/terraform-harbor-provider-linux-amd64.zip \
#  && unzip -j "/tmp/terraform-provider-harbor/terraform-provider-harbor.zip" "terraform-harbor-provider" -d /home/${USERNAME}/.terraform.d/plugins/linux_amd64 \
#  && rm -rf /tmp/terraform-provider-harbor \
#  && chmod +x /home/${USERNAME}/.terraform.d/plugins/linux_amd64/terraform-harbor-provider \
#  && mv /home/${USERNAME}/.terraform.d/plugins/linux_amd64/terraform-harbor-provider /home/${USERNAME}/.terraform.d/plugins/linux_amd64/terraform-provider-harbor


#RUN mkdir -p /home/${USERNAME}/.terraform.d/plugins/linux_amd64 \
#  && wget -qO- https://github.com/nolte/terraform-provider-harbor/releases/download/release/v${TERRAFORM_HARBOR_PROVIDER_VERSION}/terraform-provider-harbor_v${TERRAFORM_HARBOR_PROVIDER_VERSION}_linux_amd64.tar.gz | tar -xvz -C ~/.terraform.d/plugins/linux_amd64/ \
#  && chmod +x /home/${USERNAME}/.terraform.d/plugins/linux_amd64/terraform-provider-harbor 
#
#RUN mkdir -p /tmp/terraform-provider-pass/ \
#  && curl -Lo /tmp/terraform-provider-pass/terraform-provider-pass.zip https://github.com/camptocamp/terraform-provider-pass/releases/download/${TERRAFORM_PASS_PROVIDER_VERSION}/terraform-provider-pass_${TERRAFORM_PASS_PROVIDER_VERSION}_linux_amd64.zip \
#  && unzip -j "/tmp/terraform-provider-pass/terraform-provider-pass.zip" "bin/terraform-provider-pass_${TERRAFORM_PASS_PROVIDER_VERSION}_linux_amd64" -d /home/${USERNAME}/.terraform.d/plugins/linux_amd64 \
#  && rm -rf /tmp/terraform-provider-pass \
#  && chmod +x /home/${USERNAME}/.terraform.d/plugins/linux_amd64/terraform-provider-pass_${TERRAFORM_PASS_PROVIDER_VERSION}_linux_amd64 \
#  && mv /home/${USERNAME}/.terraform.d/plugins/linux_amd64/terraform-provider-pass_${TERRAFORM_PASS_PROVIDER_VERSION}_linux_amd64 /home/${USERNAME}/.terraform.d/plugins/linux_amd64/terraform-provider-pass
#
# TODO Find better way for local compiled providers
# COPY --chown=${USER_UID}:${USER_GID} ./providers/terraform-provider-gitea_v1.0_linux_amd64 /home/${USERNAME}/.terraform.d/plugins/linux_amd64/terraform-provider-gitea

RUN mkdir -p /home/${USERNAME}/.oh-my-zsh/custom/plugins/ \
  && git clone https://github.com/johanhaleby/kubetail.git /home/${USERNAME}/.oh-my-zsh/custom/plugins/kubetail

RUN mkdir -p /home/${USERNAME}/.docker/cli-plugins/ \
  && curl -Lo /home/${USERNAME}/.docker/cli-plugins/docker-buildx https://github.com/docker/buildx/releases/download/${DOCKERX_VERSION}/buildx-${DOCKERX_VERSION}.linux-amd64 \
  && chmod +x /home/${USERNAME}/.docker/cli-plugins/docker-buildx


RUN mkdir "/home/${USERNAME}/.npm-packages"
RUN npm config set prefix "/home/${USERNAME}/.npm-packages"

RUN curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash

RUN npm i madr adr-log -g

RUN helm plugin install https://github.com/databus23/helm-diff \
  && helm plugin install https://github.com/fabmation-gmbh/helm-whatup