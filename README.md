# Visual Studo Code DevContainers

The Containers are tested with Docker ``19.03.8`` and based on [qdm12/basedevcontainer](https://github.com/qdm12/basedevcontainer).

## Usage

For new [Dev Containers](https://code.visualstudio.com/docs/remote/containers) projects you can use the Python [cookiecutter/cookiecutter](https://github.com/cookiecutter/cookiecutter) Templates.

```bash
# TODO change local path to gh project
cookiecutter /workspace/cookiecutter-project project_slug="myNextTest" project_type="devops" extra_dockerfile="n"
```

```bash
.
└── .devcontainer
    ├── devcontainer.json
    └── docker-compose.yml

1 directory, 2 files
```

### Preconfigured Envs

For build the images localy use the ``Makefile`` with ``make build`` and trink a pod of tea.

| *image* (*project_type*)                                                        | *base on*                          | *description* |
|---------------------------------------------------------------------------------|------------------------------------|---------------|
| ```docker.pkg.github.com/nolte/vscode-devcontainers/commons``` _(default)_      |                                    |               |
| ```docker.pkg.github.com/nolte/vscode-devcontainers/devops``` _(devops)_        | ```vscode-devcontainers/commons``` |               |
| ```docker.pkg.github.com/nolte/vscode-devcontainers/python``` _(python)_        | ```vscode-devcontainers/commons``` |               |
| ```docker.pkg.github.com/nolte/vscode-devcontainers/golang``` _(golang)_        | ```vscode-devcontainers/commons``` |               |
| ```docker.pkg.github.com/nolte/vscode-devcontainers/k8s-operator``` _(default)_ | ```vscode-devcontainers/golang```  |               |
| ```docker.pkg.github.com/nolte/vscode-devcontainers/npm``` _(npm)_              | ```vscode-devcontainers/commons``` |               |
| ```docker.pkg.github.com/nolte/vscode-devcontainers/iot``` _(iot)_              | ```vscode-devcontainers/commons``` |               |


... sorry but at the moment the Pulic Github Docker Repoisitory is not realy public like [hub.docker.com]. see ([github.community](https://github.community/t5/GitHub-Actions/docker-pull-from-public-GitHub-Package-Registry-fail-with-quot/td-p/32782))

```bash
pass internet/github.com/nolte/package_management_token | docker login docker.pkg.github.com --username nolte --password-stdin
```

### Basement Env

### DevOps Env

Installed tools like [terraform](),[helm](),[kubectl](),[ansible]() and many more.

#### Extra Terraform Providers

* [terraform-provider-keycloak](https://github.com/mrparkers/terraform-provider-keycloak)
* [terraform-provider-minio](https://github.com/aminueza/terraform-provider-minio)
* [terraform-provider-kubectl](https://github.com/gavinbunney/terraform-provider-kubectl)
* [terraform-harbor-provider](https://github.com/BESTSELLER/terraform-harbor-provider)
