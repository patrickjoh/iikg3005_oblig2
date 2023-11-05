# IIKG3005 - Assignment 2 Infrastructure Deployment

## Introduction

This repository hosts the Terraform scripts for deploying a scalable and secure infrastructure on Azure, suitable for hosting multiple virtual machines. It is designed for the IIKG3005 - Assignment 2 and is structured to be simple yet effective for educational and testing purposes.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites and Dependencies](#prerequisites-and-dependencies)
  - [MacOS](#macos)
    - [Install Homebrew](#install-homebrew)
    - [Install Visual Studio Code with Brew](#install-visual-studio-code-with-brew)
    - [Update Visual Studio Code with Brew](#update-visual-studio-code-with-brew)
    - [Install PowerShell with Brew](#install-powershell-with-brew)
    - [Upgrade PowerShell with Brew](#upgrade-powershell-with-brew)
    - [Install Azure CLI with Brew](#install-azure-cli-with-brew)
    - [Upgrade Azure CLI with Brew](#upgrade-azure-cli-with-brew)
    - [Terraform](#terraform)
      - [Extensions for MacOS](#extensions-for-macos)
  - [Windows](#windows)
    - [Install Chocolatey](#install-chocolatey)
    - [Install PowerShell Core with Chocolatey](#install-powershell-core-with-chocolatey)
    - [Upgrade PowerShell Core with Chocolatey](#upgrade-powershell-core-with-chocolatey)
    - [Install Terraform with Chocolatey](#install-terraform-with-chocolatey)
    - [Upgrade Terraform with Chocolatey](#upgrade-terraform-with-chocolatey)
    - [Install Azure CLI with Chocolatey](#install-azure-cli-with-chocolatey)
      - [Extensions for Windows](#extensions-for-windows)
    - [Creating an Azure Service Principal](#creating-an-azure-service-principal)
- [Configuration](#configuration)
- [Deploying the Infrastructure](#deploying-the-infrastructure)
- [Variables Explanation](#variables-explanation)
  - [Global Variables](#global-variables)
- [Final Infrastructure](#final-infrastructure)
    - [Resource Group](#resource-group)
    - [Key Vault](#key-vault)
    - [Storage Account](#storage-account)
    - [Virtual Network](#virtual-network)
    - [Virtual machine](#virtual-machine)
- [For Contributors](#for-contributors)
    - [Github Actions](#github-actions)
    


## Prerequisites and dependencies

### MacOS

#### Install Homebrew

[Homebrew - The Missing Package Manager for macOS (or Linux)](https://brew.sh/)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
```

#### Install Visual Studio Code with Brew

```bash
brew install --cask visual-studio-code
```

#### Update Visual Studio Code with Brew

```bash
brew upgrade visual-studio-code
```

#### Install PowerShell with Brew

```bash
brew install --cask powershell
```

#### Upgrade PowerShell with Brew

```bash
brew upgrade powershell --cask
```

#### Install Azure CLI with Brew

```bash
brew update && brew install azure-cli
```

#### Upgrade Azure CLI with Brew

```bash
brew update && brew upgrade azure-cli
```

#### Terraform

- [HashiCorp Homebrew Tap](https://github.com/hashicorp/homebrew-tap)
- [Brew Taps Documentation](https://docs.brew.sh/Taps)

Install HashiCorp Tap with Brew:

```bash
brew tap HashiCorp/Tap
```

Install Terraform with Brew:

```bash
brew install hashicorp/tap/terraform
```

Update and Upgrade Terraform with Brew:

```bash
brew update && brew upgrade terraform
```

##### Extensions for MacOS:

- HashiCorp Terraform
- PowerShell
- Azure CLI
- Rainbow CSV

### Windows

#### Install Chocolatey

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force;
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

#### Install PowerShell Core with Chocolatey

```powershell
choco install powershell-core
```

#### Upgrade PowerShell Core with Chocolatey

```powershell
choco upgrade powershell-core
```

#### Install Terraform with Chocolatey

```powershell
choco install terraform
```

#### Upgrade Terraform with Chocolatey

```powershell
choco upgrade terraform
```

#### Install Azure CLI with Chocolatey

```powershell
choco install azure-cli
```

##### Extensions for Windows:

- HashiCorp Terraform
- PowerShell
- Azure CLI
- Rainbow CSV

### Creating an Azure Service Principal

Follow the instructions in the following link to create an Azure service principal:
[Create a Azure service principal](https://web.archive.org/web/20230827065136/learn.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli)

## Configuration

In Terraform, the `.tfvars` file is used to provide values for variables. 
It allows for a concise configuration of resources without having to modify the main configuration files. 
Here's a breakdown of the variables you are most likely to change in the `.tfvars` file:

- `base_name:` Prefix for resource names to ensure uniqueness.
- `location:` Azure region for resource deployment.
- `kv_name:` Name for the Azure Key Vault.
- `sa_name:` Name for the Azure Storage Account.
- `vnet_name:` Name for the Azure Virtual Network.
- `vm_name:` Name for the Azure Virtual Machine.

For a detailed explanation of each variable, see the Variables Explanation section below.

## Deploying the Infrastructure

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/patrickjoh/iikg3005_oblig2
   cd iikg3005_oblig2
   ```
2. **Initialize Terraform**:
    ```bash
    terraform init
    ```
3. **Switch or create a new Terraform workspace:**

* List all workspaces: `terraform workspace list`
* Switch to a workspace: `terraform workspace select <workspace-name>`
* Create and switch to a new workspace: `terraform workspace new <workspace-name>`

This makes it possible to deploy multiple instances of the same infrastructure with different configurations.

4. **Plan the Deployment:**
    ```bash
    terraform plan -var-file=<path-to-tfvars-file>
    ```

5. **Deploy the Infrastructure:**
    ```bash
    terraform apply -var-file=<path-to-tfvars-file>
    ```
6. **Destroy the Infrastructure:**
    ```bash
    terraform destroy -var-file=<path-to-tfvars-file>
    ```
    or just
    ```bash
    terraform destroy
    ```

## Variables Explanation

### Global Variables

The terraform.tfvars file contains the following variables:

- `base_name:` A unique identifier for all resources.
- `rg_name:` The name of the Azure resource group.
- `location:` The Azure region where resources will be deployed.
- `kv_name:` The name of the Azure Key Vault.
- `sa_accesskey_name:` The name of the secret for the storage account access key.
- `sa_name:` The name of the Azure Storage Account.
- `sc_name:` The name of the storage container.
- `vnet_name:` The name of the Azure Virtual Network.
- `nsg_name:` The name of the Network Security Group.
- `subnet_name:` The name of the subnet within the Virtual Network.
- `vm_nic_name:` The name of the network interface for the VM.
- `vm_name:` The name of the Azure Virtual Machine.
- `pip_name:` The name of the public IP address.
- `vm_username:` The username for the VM.

## Final Infrastructure

The naming of the resources is based on the terraform workspace name you are in when the infrastrucutre is deployed. An example of the naming convention of the main resources is shown below
where the workspace name is `dev` and the variables are set to their default values:

#### Resource Group
- `rg_name:` tf-rg-dev

#### Key Vault
- `kv_name:` tfkv`<random characters>`dev

#### Storage Account
- `sa_name:` tfsa`<random characters>`dev
- `sc_name:` tfscdev

#### Virtual Network
- `nsg_name:` tf-nsg-dev
- `vnet_name:` tf-vnet-dev
- `subnet_name:` tf-subnet-dev

#### Virtual machine
- `pip_name:` tf-pip-dev
- `vm_nic_name:` tf-vm-nic-dev
- `vm_name:` tf-vm-dev

## For Contributors

### Github Actions

The repository contains a Github Actions workflow that runs `terraform fmt`, `terraform validate`and [tflint](https://github.com/terraform-linters/setup-tflint) on every push to the every branch other than `main`.

The `main` branch is currently not protected, but it is advised and appreciated to either use `dev`branch or to create a specific branch based on you as a person or on the feature implementation. Then later 
create a pull request to the `main` branch.
When accepted and merged with the `main`branch, another Github Action (Terraform CI/CD) will trigger and deploy the infrastructure to the `dev`and `stage` environments in Azure, and will be waiting for review and approval before then deploying to the `prod` environment.