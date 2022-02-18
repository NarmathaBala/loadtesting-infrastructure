#!/usr/bin/env bash
##
## This script deletes all resources in specified environment
## Usage: ./cleanup.sh <pipeline number>
## Example: ./cleanup.sh 13
##
(
    # Configure environment variables
    if [ -f .env ]
    then
        set -o allexport; source .env; set +o allexport
    fi

    cd "$(dirname "$0")/.." || exit
    set -euo pipefail

    # Set service principal information
    subscription_id="${ARM_SUBSCRIPTION_ID}"
    tenant_id="${ARM_TENANT_ID}"
    service_principal_id="${ARM_CLIENT_ID}"
    service_principal_secret="${ARM_CLIENT_SECRET}"

    # Set resource variables
    jmeter_resource_group="$1"

    # Login to Azure via Service Principal
    echo "#### Attempting az login via service principal ####"
    az login \
        --service-principal \
        --username="$service_principal_id" \
        --password="$service_principal_secret" \
        --tenant="$tenant_id" >/dev/null

    az account set -s "$subscription_id"
    echo "#### az login done ####"

    echo "#### Deleting resource group: ${jmeter_resource_group} ####"
    az group delete \
        --name "$jmeter_resource_group" \
        --yes -y
)