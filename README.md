In Vault Dashboard

Create new user
Create an admin policy, copy policy.hcl
Edit user and add policy to Generated token's policies

Create new secrets engine kv, name it as homelab_kv
Create secrets proxmox and postgres

In CLI

export VAULT_ADDR='https://vault.deviantlab.duckdns.org'
vault login -method=userpass username=my-username

chmod +x init_terraform.sh
source ./init_terraform.sh # to keep env variables in the current shell

