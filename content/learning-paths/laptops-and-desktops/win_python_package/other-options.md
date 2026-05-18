---
title: Other options for building Python wheels
weight: 6

### FIXED, DO NOT MODIFY
layout: learningpathall
---

## Build with the shell

If your project does not use cibuildwheel or setuptools as the primary build frontend, you can invoke the build toolchain directly from a shell step in your GitHub Actions workflow. The `windows-11-arm` runner provides a native Arm64 shell environment, so any tool that runs on Windows on Arm can be called from a `run` step.

YOUR CONTENT GOES HERE

### python -m build --wheel

The `build` package provides a standards-compliant frontend for building source distributions and wheels defined by a `pyproject.toml`. Use it as a drop-in alternative to calling `setup.py bdist_wheel` directly:

```yaml
- name: Install build frontend
  run: pip install build

- name: Build wheel
  run: python -m build --wheel --outdir dist/
```

This invokes the build backend declared in your `pyproject.toml` (for example `setuptools`, `flit-core`, or `hatchling`) and places the finished wheel in `dist/`.

YOUR CONTENT GOES HERE

### bdist_wheel

For projects that have not yet migrated to `pyproject.toml`, you can call the legacy `bdist_wheel` command directly through `setup.py`:

```yaml
- name: Build wheel (legacy)
  run: python setup.py bdist_wheel
```

{{% notice Note %}}
`setup.py bdist_wheel` is deprecated. Prefer `python -m build --wheel` for new projects or when updating existing ones.
{{% /notice %}}

YOUR CONTENT GOES HERE

## Build with Bazel

Projects that use Bazel as their primary build system can produce Python wheels for Windows on Arm by configuring a `py_wheel` rule targeting the `arm64` constraint.

YOUR CONTENT GOES HERE

## Build with CMake

C-extension packages that use CMake to compile native code can cross-target `arm64` by passing the architecture to the CMake generator:

```bash
cmake -A ARM64 -B build
cmake --build build --config Release
```

When running on the `windows-11-arm` runner, CMake detects the host architecture automatically, so explicit `-A ARM64` flags are optional but recommended for clarity.

YOUR CONTENT GOES HERE

## Build with conda

If your project is distributed through conda-forge or a private conda channel, use `conda-build` or `rattler-build` on the `windows-11-arm` runner to produce `win-arm64` packages.

YOUR CONTENT GOES HERE
