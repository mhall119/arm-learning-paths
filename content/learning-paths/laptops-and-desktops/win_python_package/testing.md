---
title: Test and validate Windows on Arm packages
weight: 7

### FIXED, DO NOT MODIFY
layout: learningpathall
---

## Test your Windows on Arm Python packages

After building a `win_arm64` wheel, run your test suite on the `windows-11-arm` runner to confirm the package installs and executes correctly under a native Arm environment. Testing on the same runner architecture you build on avoids differences introduced by emulation.

A job that installs the built wheel from an artifact and runs pytest looks like this:

```yaml
jobs:
  test-wheel:
    runs-on: windows-11-arm
    needs: build-wheel

    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-python@v5
        with:
          python-version: "3.12"

      - uses: actions/download-artifact@v4
        with:
          name: wheel-arm64
          path: dist/

      - name: Install wheel
        run: pip install dist/*.whl

      - name: Run tests
        run: pytest tests/
```

YOUR CONTENT GOES HERE

## AppReady

AppReady validation confirms that a Windows on Arm application or package meets the compatibility requirements for Arm-native execution. This is relevant when you want to certify that your package runs without x86 emulation on Windows on Arm devices.

YOUR CONTENT GOES HERE
