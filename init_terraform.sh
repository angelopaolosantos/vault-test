#!/bin/bash

export PGHOST=$(vault kv get -field=host kv/postgres)
export PGUSER=$(vault kv get -field=user kv/postgres)
export PGPASSWORD=$(vault kv get -field=password kv/postgres)
export PGDATABASE=$(vault kv get -field=database kv/postgres)
export PGPORT="5432"  # Default port
export PGSSLMODE="disable"

terraform init