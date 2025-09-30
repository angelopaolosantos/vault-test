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

provider "vault" {
  auth_login {
    path = "auth/userpass/login/${var.login_username}"

    parameters = {
      password = var.login_password
    }
  }
  address = var.vault_address
}

data "vault_generic_secret" "proxmox" {
  path = var.vault_path
}

provider "proxmox" {
  endpoint = data.vault_generic_secret.proxmox.data["endpoint"]
  # or remove the line, and use PROXMOX_VE_USERNAME environment variable
  username = data.vault_generic_secret.proxmox.data["user"]
  # or remove the line, and use PROXMOX_VE_PASSWORD environment variable
  password = data.vault_generic_secret.proxmox.data["password"]
  # because self-signed TLS certificate is in use
  insecure = false
  # uncomment (unless on Windows...)
  # tmp_dir  = "/var/tmp"

  ssh {
    agent = true
    # TODO: uncomment and configure if using api_token instead of password
    # username = "root"
  }
}
