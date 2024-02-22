# Kubernetes Secret Updater GitHub Action

This GitHub Action allows you to update a value in a Kubernetes secret easily. It can be used to automate the process of updating secrets in your Kubernetes cluster.

## Usage

To use this action, create a workflow file in your GitHub repository (e.g., `.github/workflows/update-secret.yml`) and define the following steps:

```yaml
name: Update Kubernetes Secret

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
      uses: ./  # Path to your action folder
      with:
        namespace: ${{ secrets.NAMESPACE }}
        secret_name: ${{ secrets.SECRET_NAME }}
        key: ${{ secrets.KEY }}
        new_value: ${{ secrets.NEW_VALUE }}
      env:
        NAMESPACE: ${{ secrets.NAMESPACE }}
        SECRET_NAME: ${{ secrets.SECRET_NAME }}
        KEY: ${{ secrets.KEY }}
        NEW_VALUE: ${{ secrets.NEW_VALUE }}
