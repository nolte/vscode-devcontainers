# -*- coding: utf-8 -*-

import json
import pytest
import os
import filecmp
import ast

import jsbeautifier


@pytest.mark.parametrize("extra_dockerfile", [("y"), ("n")])
@pytest.mark.parametrize("project_type", [("default"), ("devops"), ("golang"), ("python"), ("iot")])
def test_bake_project(cookies, extra_dockerfile, project_type):
    result = cookies.bake(
        extra_context={"project_slug": "commonstest", "extra_dockerfile": extra_dockerfile, "project_type": project_type}, template="cookiecutter-project")

    assert result.exit_code == 0
    assert result.exception is None
    assert result.project.basename == "commonstest"
    assert result.project.isdir()
    dev_container_folder = result.project.join('.devcontainer')
    assert dev_container_folder.isdir()
    dev_container_compose = result.project.join(
        '.devcontainer/docker-compose.yml')
    assert dev_container_compose.isfile()
    dev_container_conf = result.project.join(
        '.devcontainer/devcontainer.json')
    assert dev_container_conf.isfile()

    # dont allways generate the additional dockerfile
    expect_dockerfile = 0
    if extra_dockerfile == "y":
        expect_dockerfile = 1

    result.project.join(
        '.devcontainer/Dockerfile').check(exists=expect_dockerfile)


def test_compare_generated_files_from_project(cookies):
    result = cookies.bake(
        extra_context={"project_slug": "commonstest", "extra_dockerfile": "y", "project_type": "default"}, template="cookiecutter-project")
    assert result.exit_code == 0
    assert result.exception is None
    assert filecmp.cmp(result.project.join(
        '.devcontainer/Dockerfile'), 'cookiecutter-project/tests/golden_files/minimal/commons/Dockerfile', shallow=True)
    assert filecmp.cmp(result.project.join(
        '.devcontainer/docker-compose.yml'), 'cookiecutter-project/tests/golden_files/minimal/commons/docker-compose.yml', shallow=True)

   # assert filecmp.cmp(result.project.join(
   #     '.devcontainer/devcontainer.json'), 'cookiecutter-project/tests/golden_files/minimal/commons/devcontainer.json', shallow=True)
    json_data = jsbeautifier.beautify_file(result.project.join(
        '.devcontainer/devcontainer.json'))
    jsonGoldenFile = jsbeautifier.beautify_file(
        'cookiecutter-project/tests/golden_files/minimal/commons/devcontainer.json')
    assert jsonGoldenFile == json_data
