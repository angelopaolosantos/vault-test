terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.53.1"
    }
    ansible = {
      source = "ansible/ansible"
      version = "1.3.0"
    }
    vault = {
      source = "hashicorp/vault"
      version = "4.2.0"
    }
  }
  # Optional, set backend type and values. Terraform state will be saved on backend instead
  backend "pg" {
    # conn_str=postgres://user:pass@db.example.com/terraform_backend?sslmode=disable
    # or set env variable:
    # export PG_CONN_STR=postgres://user:pass@db.example.com/terraform_backend?sslmode=disable
    # or create a backend file
    # terraform init --backend-config=config.pg.tfbackend 
  }
}

provider "ansible" {
  # Configuration options
}

variable login_username {
  type = string
}
variable login_password {
  type = string
}

provider "vault" {
  auth_login {
    path = "auth/userpass/login/${var.login_username}"

    parameters = {
      password = var.login_password
    }
  }
  address = "https://vault.deviantlab.duckdns.org/"
}

data "vault_generic_secret" "proxmox" {
  path = "kv/proxmox"
}

