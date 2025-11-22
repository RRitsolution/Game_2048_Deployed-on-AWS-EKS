#!/bin/bash

##Helm installation:-




curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 777 get_helm.sh
./get_helm.sh
helm -version
which helm
helm version

##eks chart add
helm repo add eks https://aws.github.io/eks-charts

