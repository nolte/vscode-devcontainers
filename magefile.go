//+build mage

package main

import (
	"context"
	"path"

	"github.com/magefile/mage/mg"
	"github.com/magefile/mage/sh"
)

func buildDockerImage(dockerfile_base_path string, image_name string) error {
	var registry_base string = "docker.pkg.github.com/nolte/vscode-devcontainers"
	return sh.Run(
		"docker",
		"build",
		"-f", path.Join(dockerfile_base_path, "Dockerfile"),
		"-t", path.Join(registry_base, image_name),
		path.Join(dockerfile_base_path, "."),
	)
}

type VSCodeContainer mg.Namespace

//var Default = Build

var Aliases = map[string]interface{}{
	"all": VSCodeContainer.Build,
}

// Build the base image
func (VSCodeContainer) BuildCommons() error {
	return buildDockerImage("./images/commons", "commons")
}

// Add Golang to the BaseContainer
func (VSCodeContainer) BuildCommonsGolang() error {
	return buildDockerImage("./images/commons-golang", "commons-golang")
}

func (VSCodeContainer) BuildDevops() error {
	return buildDockerImage("./images/devops", "devops")
}

func (VSCodeContainer) BuildDevGolang() error {
	return buildDockerImage("./images/dev-golang", "golang")
}

func (VSCodeContainer) BuildDevK8SOperator() error {
	return buildDockerImage("./images/k8sOperator", "k8s-operator")
}

func (VSCodeContainer) BuildDevIOT() error {
	return buildDockerImage("./images/iot", "iot")
}

func (VSCodeContainer) BuildDevNPM() error {
	return buildDockerImage("./images/npm", "npm")
}

func (VSCodeContainer) BuildDevPython() error {
	return buildDockerImage("./images/python", "python")
}

// Build all existing devcontainers in the expected order.
func (VSCodeContainer) Build(ctx context.Context) {
	mg.CtxDeps(ctx, VSCodeContainer.BuildCommons)
	mg.CtxDeps(ctx, VSCodeContainer.BuildCommonsGolang)
	mg.CtxDeps(ctx, VSCodeContainer.BuildDevGolang)
	mg.CtxDeps(ctx, VSCodeContainer.BuildDevops)
	mg.CtxDeps(ctx, VSCodeContainer.BuildDevK8SOperator)
	mg.CtxDeps(ctx, VSCodeContainer.BuildDevIOT)
	mg.CtxDeps(ctx, VSCodeContainer.BuildDevNPM)
	mg.CtxDeps(ctx, VSCodeContainer.BuildDevPython)

}
