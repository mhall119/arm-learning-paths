---
title: Build Python wheels with cibuildwheel
weight: 4

### FIXED, DO NOT MODIFY
layout: learningpathall
---

## Use cibuildwheel to build Windows on Arm wheels

[cibuildwheel](https://cibuildwheel.pypa.io/) is the recommended tool for building Python wheel packages across multiple platforms and Python versions from a single configuration. It handles the complexity of setting up the correct Python interpreter, compiler toolchain, and packaging environment for each target.

For Windows on Arm, cibuildwheel supports the `win_arm64` platform identifier, which maps directly to the `windows-11-arm` GitHub Actions runner.

YOUR CONTENT GOES HERE

### pypa/cibuildwheel

The `pypa/cibuildwheel` GitHub Action wraps the cibuildwheel tool for use in a workflow step. Add it to a job that runs on `windows-11-arm` to build `win_arm64` wheels natively without cross-compilation.

A basic workflow job using `pypa/cibuildwheel` on the `windows-11-arm` runner looks like this:

```yaml
jobs:
  build-wheels:
    name: Build wheels on ${{ matrix.os }}
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: [ubuntu-latest, windows-latest, windows-11-arm]

    steps:
      - uses: actions/checkout@v4

      - name: Build wheels
        uses: pypa/cibuildwheel@v2.23.0

      - uses: actions/upload-artifact@v4
        with:
          name: cibuildwheel-${{ matrix.os }}
          path: ./wheelhouse/*.whl
```

Configure the build using a `[tool.cibuildwheel]` section in `pyproject.toml` or a `cibuildwheel` key in `setup.cfg`. To restrict the build to the `win_arm64` platform on the WoA runner, set:

```toml
[tool.cibuildwheel]
build = "cp311-win_arm64 cp312-win_arm64 cp313-win_arm64"
```

{{% notice Note %}}
The `win_arm64` platform identifier requires cibuildwheel 2.16.0 or later. Check the [cibuildwheel changelog](https://cibuildwheel.pypa.io/en/stable/changelog/) for the version that added support for your target Python range.
{{% /notice %}}

YOUR CONTENT GOES HERE
