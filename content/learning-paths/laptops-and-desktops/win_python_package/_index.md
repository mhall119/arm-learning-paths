---
title: Build Python packages for Windows on Arm

description: Learn how to use GitHub Actions windows-11-arm runners to build and distribute Python wheel packages for Windows on Arm using cibuildwheel, setuptools, and other build tools.

minutes_to_complete: 45

who_is_this_for: This is an introductory topic for Python package maintainers who want to build and publish Windows on Arm compatible wheel packages using GitHub Actions.

learning_objectives:
    - Describe the windows-11-arm GitHub Actions runner and how it differs from windows-latest and windows-2025
    - Configure a GitHub Actions workflow matrix to target windows-11-arm runners
    - Build Python wheel packages for Windows on Arm using cibuildwheel
    - Build Python wheel packages using setuptools and actions/setup-python
    - Apply alternative build tools such as Bazel, CMake, and conda for Windows on Arm Python packages
    - Test and validate Windows on Arm Python packages

prerequisites:
    - A GitHub account with repository access and GitHub Actions enabled
    - Familiarity with Python packaging concepts (wheels, setup.py, pyproject.toml)
    - Basic knowledge of GitHub Actions workflow syntax

author: PLACEHOLDER NAME

### Tags
skilllevels: Introductory
subjects: CI-CD
armips:
    - Cortex-A
tools_software_languages:
    - Python
    - GitHub
    - cibuildwheel
    - setuptools
operatingsystems:
    - Windows



further_reading:
    - resource:
        title: GitHub Actions now supports Windows on Arm runners for all public repos
        link: https://blogs.windows.com/windowsdeveloper/2025/04/14/github-actions-now-supports-windows-on-arm-runners-for-all-public-repos/
        type: blog
    - resource:
        title: cibuildwheel documentation
        link: https://cibuildwheel.pypa.io/
        type: documentation
    - resource:
        title: Python packaging user guide
        link: https://packaging.python.org/
        type: documentation
    - resource:
        title: GitHub Actions Partner Images Repository
        link: https://github.com/actions/partner-runner-images/
        type: documentation



### FIXED, DO NOT MODIFY
# ================================================================================
weight: 1                       # _index.md always has weight of 1 to order correctly
layout: "learningpathall"       # All files under learning paths have this same wrapper
learning_path_main_page: "yes"  # This should be surfaced when looking for related content. Only set for _index.md of learning path content.
---
