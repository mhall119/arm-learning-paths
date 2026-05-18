---
title: Build Python wheels with setuptools
weight: 5

### FIXED, DO NOT MODIFY
layout: learningpathall
---

## Use setuptools with actions/setup-python

If your project uses setuptools directly rather than cibuildwheel, you can build Windows on Arm wheels by combining the `actions/setup-python` action with a native `windows-11-arm` runner. The key is to ensure `actions/setup-python` installs an Arm-native Python interpreter rather than an x86_64 one.

YOUR CONTENT GOES HERE

### actions/setup-python

The `actions/setup-python` action supports Windows on Arm from Python 3.11 onwards. When a job runs on `windows-11-arm`, the action automatically selects the `arm64` build of the requested Python version from the official python.org releases.

A workflow that builds a wheel using setuptools on the `windows-11-arm` runner looks like this:

```yaml
jobs:
  build-wheel:
    runs-on: windows-11-arm

    steps:
      - uses: actions/checkout@v4

      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.12"

      - name: Install build dependencies
        run: pip install setuptools wheel build

      - name: Build wheel
        run: python -m build --wheel

      - uses: actions/upload-artifact@v4
        with:
          name: wheel-arm64
          path: dist/*.whl
```

After the job completes, verify the uploaded artifact filename contains `win_arm64` to confirm the wheel targets the correct platform. A correctly built wheel has a name similar to `mypackage-1.0.0-cp312-cp312-win_arm64.whl`.

YOUR CONTENT GOES HERE
