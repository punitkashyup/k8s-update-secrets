# Kubernetes Secret Updater GitHub Action

![GitHub release (latest by date)](https://img.shields.io/github/v/release/your-username/k8s-secret-update-action)
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/your-username/k8s-secret-update-action/Release)

This GitHub Action automates the process of updating a value in a Kubernetes secret. It is useful for scenarios where you need to dynamically update secrets in your Kubernetes cluster as part of your CI/CD workflows.

## Features

- Updates a specific value in a Kubernetes secret within a specified namespace.
- Provides easy integration with GitHub Actions for automated secret updates.
- Supports running on different operating systems (Windows, macOS, Linux).

## Inputs

### `namespace`

**Required** Namespace where the secret exists.

### `secret_name`

**Required** Name of the secret to be updated.

### `key`

**Required** Key of the value in the secret to be updated.

### `new_value`

**Required** New value to be set.

## Outputs

### `message`

Confirmation message after updating the secret value.

## Usage

```yaml
name: Update Secret

on:
  push:
    branches:
      - main

jobs:
  update-secret:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Update Kubernetes Secret
      uses: punitkashyup/k8s-secret-update-action@v1
      with:
        namespace: ${{ secrets.NAMESPACE }}
        secret_name: ${{ secrets.SECRET_NAME }}
        key: ${{ secrets.KEY }}
        new_value: ${{ secrets.NEW_VALUE }}
