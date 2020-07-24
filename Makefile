.PHONY: build
REGISTRY=docker.pkg.github.com/nolte/vscode-devcontainers

default: build

base:
	docker build -f ./images/commons/Dockerfile -t ${REGISTRY}/commons ./images/commons/.

devops:
	docker build -f ./images/devops/Dockerfile -t ${REGISTRY}/devops ./images/devops/.

basegolang:
	docker build -f ./images/commons-golang/Dockerfile -t ${REGISTRY}/commons-golang ./images/commons-golang/.

golang:
	docker build -f ./images/dev-golang/Dockerfile -t ${REGISTRY}/golang ./images/dev-golang/.

k8soperator:
	docker build -f ./images/k8sOperator/Dockerfile -t ${REGISTRY}/k8s-operator ./images/k8sOperator/.

iot:
	docker build -f ./images/iot/Dockerfile -t ${REGISTRY}/iot ./images/iot/.

npm:
	docker build -f ./images/npm/Dockerfile -t ${REGISTRY}/npm ./images/npm/.

python:
	docker build -f ./images/python/Dockerfile -t ${REGISTRY}/python ./images/python/.

build: base basegolang devops golang k8soperator iot npm python
	# only build the container. Note, docker does this also if you apply other targets.
