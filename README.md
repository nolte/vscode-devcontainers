# Visual Studo Code DevContainers

A standardised development environment is necessary for working on a wide range of projects, even after a certain period of time has elapsed.

So we create a set of pre configured [Dev Containers](https://code.visualstudio.com/docs/remote/containers) based on [qdm12/basedevcontainer](https://github.com/qdm12/basedevcontainer).

## Usage

For new [Dev Containers](https://code.visualstudio.com/docs/remote/containers) projects you can use the Python [cookiecutter/cookiecutter](https://github.com/cookiecutter/cookiecutter) Templates.

```bash
pip install jinja2-ansible-filters

# TODO change local path to gh project
cookiecutter /go/src/github.com/nolte/vscode-devcontainers/cookiecutter-project project_slug="myNextTest" project_type="devops" extra_dockerfile="n"

cookiecutter gh:nolte/vscode-devcontainers --directory="cookiecutter-project" project_slug="helm-gitea" project_type="devops" extra_dockerfile="n"
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
| ```ghcr.io/nolte/vscode-devcontainers/commons``` _(default)_      |                                    |               |
| ```ghcr.io/nolte/vscode-devcontainers/devops``` _(devops)_        | ```vscode-devcontainers/commons``` |               |
| ```ghcr.io/nolte/vscode-devcontainers/python``` _(python)_        | ```vscode-devcontainers/commons``` |               |
| ```ghcr.io/nolte/vscode-devcontainers/golang``` _(golang)_        | ```vscode-devcontainers/commons``` |               |
| ```ghcr.io/nolte/vscode-devcontainers/k8s-operator``` _(default)_ | ```vscode-devcontainers/golang```  |               |
| ```ghcr.io/nolte/vscode-devcontainers/npm``` _(npm)_              | ```vscode-devcontainers/commons``` |               |
| ```ghcr.io/nolte/vscode-devcontainers/iot``` _(iot)_              | ```vscode-devcontainers/commons``` |               |


... sorry but at the moment the Pulic Github Docker Repoisitory is not realy public like [hub.docker.com]. see ([github.community](https://github.community/t5/GitHub-Actions/docker-pull-from-public-GitHub-Package-Registry-fail-with-quot/td-p/32782))

```bash
pass internet/github.com/nolte/package_management_token | docker login ghcr.io --username nolte --password-stdin
```

### Basement Env

### DevOps Env

This env will be configured by the [twpayne/chezmoi](https://github.com/twpayne/chezmoi) based Configuration scripts, [nolte/workstation](https://github.com/nolte/workstation).
