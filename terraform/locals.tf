locals {
  workspace_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  # Resource Group
  rg_name = terraform.workspace == "default" ? "${var.rg_name}" : "${var.rg_name}-${local.workspace_suffix}"
  # Network
  nsg_name    = terraform.workspace == "default" ? "${var.nsg_name}" : "${var.nsg_name}-${local.workspace_suffix}"
  vnet_name   = terraform.workspace == "default" ? "${var.vnet_name}" : "${var.vnet_name}-${local.workspace_suffix}"
  subnet_name = terraform.workspace == "default" ? "${var.subnet_name}" : "${var.subnet_name}-${local.workspace_suffix}"
  # Virtual machine
  pip_name    = terraform.workspace == "default" ? "${var.pip_name}" : "${var.pip_name}-${local.workspace_suffix}"
  vm_nic_name = terraform.workspace == "default" ? "${var.vm_nic_name}" : "${var.vm_nic_name}-${local.workspace_suffix}"
  vm_name     = terraform.workspace == "default" ? "${var.vm_name}" : "${var.vm_name}-${local.workspace_suffix}"
}
