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

| *image* (*project_type*)                        | *base on*                     | *description* |
|-------------------------------------------------|-------------------------------|---------------|
| ```nolte/vscode-commons``` _(default)_          |                               |               |
| ```nolte/vscode-devops``` _(devops)_            | ```nolte/vscode-commons```    |               |
| ```nolte/vscode-dev-python``` _(python)_        | ```nolte/vscode-commons```    |               |
| ```nolte/vscode-dev-golang``` _(golang)_        | ```nolte/vscode-commons```    |               |
| ```nolte/vscode-dev-k8s-operator``` _(default)_ | ```nolte/vscode-dev-golang``` |               |
| ```nolte/vscode-dev-npm``` _(npm)_              | ```nolte/vscode-commons```    |               |
| ```nolte/vscode-dev-iot``` _(iot)_              | ```nolte/vscode-commons```    |               |


### Basement Env

### DevOps Env

Installed tools like [terraform](),[helm](),[kubectl](),[ansible]() and many more.

#### Extra Terraform Providers

* [terraform-provider-keycloak](https://github.com/mrparkers/terraform-provider-keycloak)
* [terraform-provider-minio](https://github.com/aminueza/terraform-provider-minio)
* [terraform-provider-kubectl](https://github.com/gavinbunney/terraform-provider-kubectl)
* [terraform-harbor-provider](https://github.com/BESTSELLER/terraform-harbor-provider)
