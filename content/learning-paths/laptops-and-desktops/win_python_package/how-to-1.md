---
title: Introduction to windows-11-arm runners
weight: 2

### FIXED, DO NOT MODIFY
layout: learningpathall
---

## Introduction to windows-11-arm runners

GitHub introduced the `windows-11-arm` runner to give open-source projects and private repositories a native Windows on Arm (WoA) build environment hosted directly in GitHub Actions. Rather than cross-compiling for Arm on an x86 host or managing a self-hosted runner, you can target the architecture directly in your workflow file.

This section explains what the runner is, how it is provisioned, and why it matters for Python package maintainers who want to ship native WoA wheels.

YOUR CONTENT GOES HERE

## Differences with windows-latest and windows-2025

Not all Windows runners in GitHub Actions are equivalent. Understanding the differences helps you choose the right one for each job in your workflow.

| Runner label | Architecture | Notes |
|---|---|---|
| `windows-latest` | x86_64 | Resolves to the current default Windows image; not Arm |
| `windows-2025` | x86_64 | Pinned to the Windows Server 2025 x86_64 image |
| `windows-11-arm` | arm64 | Native Windows 11 on Arm; required for building WoA-native binaries |

Key considerations:

- Binaries compiled on `windows-11-arm` run natively on Arm hardware without emulation.
- Some tools and runtimes that work on `windows-latest` may not yet have Arm-native builds. Check compatibility before adding `windows-11-arm` to an existing matrix.
- Python versions earlier than 3.11 do not ship an official Windows on Arm build from python.org. See [Add windows-11-arm to your GitHub Actions matrix](../how-to-2) for how to exclude unsupported versions.

YOUR CONTENT GOES HERE
