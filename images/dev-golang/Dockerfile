ARG FROM_REGISTRY=ghcr.io/nolte/vscode-devcontainers
ARG FROM_IMAGE_NAME=commons-golang
ARG FROM_IMAGE_VERSION=latest
FROM ${FROM_REGISTRY}/${FROM_IMAGE_NAME}:${FROM_IMAGE_VERSION}

USER root

# Install Go packages
ARG GOLANGCI_LINT_VERSION=v1.29.0
RUN wget -O- -nv https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /bin -d ${GOLANGCI_LINT_VERSION}
RUN go get -v \
  # Base Go tools needed for VS code Go extension
  golang.org/x/tools/gopls \
  github.com/ramya-rao-a/go-outline \
  #golang.org/x/tools/cmd/guru \
  #golang.org/x/tools/cmd/gorename \
  # Extra tools integrating with VS code
  github.com/fatih/gomodifytags \
  github.com/haya14busa/goplay/cmd/goplay \
  github.com/cweill/gotests/... \
  github.com/davidrjenni/reftools/cmd/fillstruct \
  # Terminal tools
  github.com/golang/mock/gomock \
  github.com/golang/mock/mockgen \
  github.com/vektra/mockery/...  \
  github.com/go-delve/delve/cmd/dlv \
  github.com/godoctor/godoctor  \
  github.com/stamblerre/gocode \
  github.com/uudashr/gopkgs/v2/cmd/gopkgs \
  github.com/rogpeppe/godef \
  golang.org/x/tools/cmd/goimports \
  github.com/ahmetb/gen-crd-api-reference-docs \
  golang.org/x/tools/cmd/godoc \
  golang.org/x/lint/golint \
  2>&1 && \
  rm -rf $GOPATH/pkg/* $GOPATH/src/* /root/.cache/go-build && \
  chown -R ${USER_UID}:${USER_GID} $GOPATH && \
  chmod -R 700 $GOPATH

RUN mkdir -p /go/src && chown -R ${USER_UID}:${USER_GID} /go/src \
  && mkdir -p /go/pkg && chown -R ${USER_UID}:${USER_GID} /go/pkg \
  && mkdir -p /go/bin && chown -R ${USER_UID}:${USER_GID} /go/bin 


USER ${USERNAME}
