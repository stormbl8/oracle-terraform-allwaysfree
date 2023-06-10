terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">=4.37.0"
    }
  }
  required_version = ">= 1.0.0"
}

locals {
  apps = {
    vm = {
      enabled = true
    }
  }
}

module "network" {
  source = "./modules/network"
  compartment_id           = var.compartment_id
  tenancy_id               = var.tenancy_id
  
}

module "ubuntu-vm" {
  count  = local.apps.vm.enabled == true ? 1 : 0
  source = "./modules/app-base"

  compartment_id           = var.compartment_id
  tenancy_id               = var.tenancy_id
  hostname                 = var.hostname
  instance_shape           = var.instance_shape
  ocpus                    = var.ocpus
  memory_in_gbs            = var.memory_in_gbs
  operating_system         = var.operating_system
  operating_system_version = var.operating_system_version
  #ssh_authorized_keys      = var.ssh_authorized_keys
  assign_public_ip         = var.assign_public_ip
  subnet_id                = module.network.subnet_id
}


