---
title: Add windows-11-arm to your GitHub Actions matrix
weight: 3

### FIXED, DO NOT MODIFY
layout: learningpathall
---

## Add windows-11-arm to your GitHub Actions matrix

The most straightforward way to add Windows on Arm builds to an existing workflow is to include `windows-11-arm` as an entry in a `strategy.matrix`. This lets you build, test, and publish wheels for multiple platforms in parallel without duplicating job definitions.

A minimal matrix that adds the WoA runner alongside existing Windows and Linux targets looks like this:

```yaml
strategy:
  matrix:
    os: [ubuntu-latest, windows-latest, windows-11-arm]
    python-version: ["3.11", "3.12", "3.13"]
```

YOUR CONTENT GOES HERE

## Exclude Python versions without Windows on Arm support

Official Windows on Arm CPython builds are available from Python 3.11 onwards. If your matrix includes older Python versions for other platforms, you need to exclude those combinations for `windows-11-arm` to avoid failing jobs.

Use the `exclude` key under `strategy.matrix` to drop unsupported combinations:

```yaml
strategy:
  matrix:
    os: [ubuntu-latest, windows-latest, windows-11-arm]
    python-version: ["3.9", "3.10", "3.11", "3.12", "3.13"]
  exclude:
    - os: windows-11-arm
      python-version: "3.9"
    - os: windows-11-arm
      python-version: "3.10"
```

This keeps your existing coverage for x86_64 while limiting the WoA jobs to supported versions.

YOUR CONTENT GOES HERE
