#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

# CA_BUNDLE=$(oc config view --raw --minify --flatten -o jsonpath='{.clusters[].cluster.certificate-authority-data}')

# CA_BUNDLE=$(oc get secrets -o jsonpath="{.items[?(@.metadata.annotations['kubernetes\.io/service-account\.name']=='default')].data.ca\.crt}")
CA_BUNDLE=$(kubectl get configmap -n kube-system extension-apiserver-authentication -o=jsonpath='{.data.client-ca-file}' | base64 | tr -d '\n')

export CA_BUNDLE

if command -v envsubst >/dev/null 2>&1; then
    envsubst
else
    sed -e "s|\${CA_BUNDLE}|${CA_BUNDLE}|g"
fi
