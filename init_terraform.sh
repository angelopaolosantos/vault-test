#!/bin/bash

export PGHOST=$(vault kv get -field=host homelab_kv/postgres)
export PGUSER=$(vault kv get -field=user homelab_kv/postgres)
export PGPASSWORD=$(vault kv get -field=password homelab_kv/postgres)
export PGDATABASE=$(vault kv get -field=database homelab_kv/postgres)
export PGPORT=$(vault kv get -field=port homelab_kv/postgres)  # Default port
export PGSSLMODE="disable"

terraform init