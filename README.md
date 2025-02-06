chmod +x init_terraform.sh
source ./init_terraform.sh # to keep env variables in the current shell
export VAULT_ADDR='https://vault.deviantlab.duckdns.org'
vault login -method=userpass username=my-username