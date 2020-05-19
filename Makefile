.PHONY: build
REGISTRY=nolte

base:
	docker build -f ./images/commons/Dockerfile -t ${REGISTRY}/vscode-commons ./images/commons/.

devops:
	docker build -f ./images/devops/Dockerfile -t ${REGISTRY}/vscode-devops ./images/devops/.

golang:
	docker build -f ./images/golang/Dockerfile -t ${REGISTRY}/vscode-dev-golang ./images/golang/.

k8soperator:
	docker build -f ./images/k8sOperator/Dockerfile -t ${REGISTRY}/vscode-dev-k8soperator ./images/k8sOperator/.

iot:
	docker build -f ./images/iot/Dockerfile -t ${REGISTRY}/vscode-dev-iot ./images/iot/.

npm:
	docker build -f ./images/npm/Dockerfile -t ${REGISTRY}/vscode-dev-npm ./images/npm/.

python:
	docker build -f ./images/python/Dockerfile -t ${REGISTRY}/vscode-dev-python ./images/python/.

build: base devops golang k8soperator iot npm python
	# only build the container. Note, docker does this also if you apply other targets.
