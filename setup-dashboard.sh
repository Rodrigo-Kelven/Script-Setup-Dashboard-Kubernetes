#!/bin/bash

set -e

echo "🔧 Instalando Kubernetes Dashboard..."
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

echo "⏳ Aguardando Dashboard subir..."
kubectl wait --namespace kubernetes-dashboard \
  --for=condition=ready pod \
  --selector=k8s-app=kubernetes-dashboard \
  --timeout=90s

echo "👤 Criando ServiceAccount admin-user e permissões cluster-admin..."

cat <<EOF | kubectl apply -f -
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
EOF

echo "🔐 Gerando token de acesso..."
TOKEN=$(kubectl -n kubernetes-dashboard create token admin-user)

echo ""
echo "✅ Tudo pronto!"
echo ""
echo "🌐 Acesse o Kubernetes Dashboard em:"
echo "http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/"
echo ""
echo "🔑 Token de acesso (copie e cole no campo 'Token' da tela de login):"
echo ""
echo "$TOKEN"
echo ""

echo "🚀 Iniciando kubectl proxy..."
kubectl proxy
