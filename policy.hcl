# Grant 'create', 'read' , 'update', and ‘list’ permission
# to paths prefixed by 'secret/*'
path "homelab_kv/*" {
  capabilities = [ "create", "read", "update", "list" ]
}

# Even though we allowed secret/*, this line explicitly denies
# secret/super-secret. This takes precedence.
# path "secret/super-secret" {
#   capabilities = ["deny"]
# }

# Terraform Fix - Error: failed to create limited child token: Error making API request.
path "auth/token/create" {  
  capabilities = ["create", "update", "sudo"]  
}
