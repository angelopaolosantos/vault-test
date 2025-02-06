output "my_secret_value" {
  value = nonsensitive(data.vault_generic_secret.proxmox.data["user"])
}