ARG FROM_REGISTRY=docker.pkg.github.com/nolte/vscode-devcontainers
ARG FROM_IMAGE_NAME=commons
ARG FROM_IMAGE_VERSION=latest
ARG ALPINE_VERSION=3.17
ARG GO_VERSION=1.20

# See https://github.com/golang/go/issues/14481
FROM golang:${GO_VERSION}-alpine${ALPINE_VERSION} AS race
#WORKDIR /tmp/race
#RUN apk --update -q --progress --no-cache add git g++
#RUN git clone --single-branch https://github.com/llvm-mirror/compiler-rt . && \
#  git reset --hard 69445f095c22aac2388f939bedebf224a6efcdaf
#RUN wget -q https://github.com/golang/go/files/4114545/0001-upstream-master-69445f095-hack-to-make-Go-s-race-flag-work-on-Alpine.patch.gz -O patch.gz && \
#  gunzip patch.gz && \
#  patch -p1 -i patch
#WORKDIR /tmp/race/lib/tsan/go
#RUN sed -e 's,-Wno-unknown-warning-option,-Wno-error=deprecated,' -i buildgo.sh
#RUN ./buildgo.sh

FROM ${FROM_REGISTRY}/${FROM_IMAGE_NAME}:${FROM_IMAGE_VERSION}

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION=local
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=1000
LABEL \
  org.opencontainers.image.authors="quentin.mcgaw@gmail.com" \
  org.opencontainers.image.created=$BUILD_DATE \
  org.opencontainers.image.version=$VERSION \
  org.opencontainers.image.revision=$VCS_REF \
  org.opencontainers.image.url="https://github.com/qdm12/godevcontainer" \
  org.opencontainers.image.documentation="https://github.com/qdm12/godevcontainer" \
  org.opencontainers.image.source="https://github.com/qdm12/godevcontainer" \
  org.opencontainers.image.title="Go Dev container Alpine" \
  org.opencontainers.image.description="Go development container for Visual Studio Code Remote Containers development"
USER root
# TODO use build args
COPY --from=race /usr/local/go /usr/local/go
# COPY --from=race /tmp/race/lib/tsan/go/race_linux_amd64.syso /usr/local/go/src/runtime/race/race_linux_amd64.syso
ENV GOPATH=/go
ENV PATH=$GOPATH/bin:/usr/local/go/bin:$PATH \
  CGO_ENABLED=0 \
  GO111MODULE=on
WORKDIR $GOPATH
# Install Alpine packages (g++ for race testing)
RUN apk add -q --update --progress --no-cache g++
RUN mkdir -p /var/cache/apk
# Shell setup
COPY --chown=${USER_UID}:${USER_GID} files/.zshrc-specific files/.welcome.sh /home/${USERNAME}/
COPY files/.zshrc-specific files/.welcome.sh /root/

# install common go tool sets
#RUN go install -v \
#  github.com/magefile/mage@latest \
#  2>&1 && \
#  rm -rf $GOPATH/pkg/* $GOPATH/src/* /root/.cache/go-build && \
#  chown -R ${USER_UID}:${USER_GID} $GOPATH && \
#  chmod -R 700 $GOPATH


RUN mkdir -p /go/src && chown -R ${USER_UID}:${USER_GID} /go/src \
  && mkdir -p /go/pkg && chown -R ${USER_UID}:${USER_GID} /go/pkg \
  && mkdir -p /go/bin && chown -R ${USER_UID}:${USER_GID} /go/bin 

USER ${USERNAME}
