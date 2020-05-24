.PHONY: build
REGISTRY=docker.pkg.github.com/nolte/vscode-devcontainers

default: build

base:
	docker build -f ./images/commons/Dockerfile -t ${REGISTRY}/commons ./images/commons/.

devops:
	docker build -f ./images/devops/Dockerfile -t ${REGISTRY}/devops ./images/devops/.

golang:
	docker build -f ./images/golang/Dockerfile -t ${REGISTRY}/golang ./images/golang/.

k8soperator:
	docker build -f ./images/k8sOperator/Dockerfile -t ${REGISTRY}/k8s-operator ./images/k8sOperator/.

iot:
	docker build -f ./images/iot/Dockerfile -t ${REGISTRY}/iot ./images/iot/.

npm:
	docker build -f ./images/npm/Dockerfile -t ${REGISTRY}/npm ./images/npm/.

python:
	docker build -f ./images/python/Dockerfile -t ${REGISTRY}/python ./images/python/.

build: base devops golang k8soperator iot npm python
	# only build the container. Note, docker does this also if you apply other targets.
