#!/bin/sh
export RDS_ENDPOINT=$(aws rds describe-db-instances --filters Name=db-instance-id,Values=hcdb-rds | jq -r '.DBInstances.[0].Endpoint.Address')
export PGPASSWORD=$(aws rds generate-db-auth-token --hostname $RDS_ENDPOINT --port 5432 --username cqwrite)
export PG_CONNECTION_STRING=postgresql://cqwrite@$RDS_ENDPOINT:5432/cq

pg_dump  $PG_CONNECTION_STRING -f cq.sql 