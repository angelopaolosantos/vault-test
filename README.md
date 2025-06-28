# Vault Secrets - Terraform Test 

## In Vault Dashboard

1. Sign into your vault dashboard
2. Enable a new secrets engine
3. Select kv, assign a name to it (e.g. homelab_kv)
4. Create secrets, enter key value pairs (e.g. proxmox and postgres)
5. Create an admin policy, copy policy.hcl
6. Create new user 
7. Edit user and add admin to its policies. Don't add root policy, auth methods don't generate root policies.

## In Terminal

1. Set VAULT_ADDR environment variable 
`export VAULT_ADDR='https://vault.deviantlab.duckdns.org'`

2. Log into vault user account
`vault login -method=userpass username=my-username`

3. You may now use Vault and access your secrets, 
check the shell script and terraform files on how to get vault secrets
`chmod +x init_terraform.sh`
`source ./init_terraform.sh # to keep env variables in the current shell`