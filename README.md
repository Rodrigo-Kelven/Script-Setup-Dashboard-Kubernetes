## Kubernetes Dashboard Setup

![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)
![Bash Script](https://img.shields.io/badge/bash_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)


### 🚀 Objetivo

#### Este projeto tem como objetivo instalar e configurar o Kubernetes Dashboard em um cluster local ou remoto, com um ServiceAccount com permissões de administrador, permitindo acesso completo à interface web de gerenciamento do cluster.

## 📋 O que este script faz

#### O script setup-dashboard.sh realiza os seguintes passos de forma automatizada:

- #### 1. Instala o Kubernetes Dashboard usando o manifest oficial.
- #### 2. Aguarda o Pod do dashboard ficar pronto.
- #### 3. Cria um ServiceAccount (admin-user) com permissões administrativas (cluster-admin).
- #### 4. Gera e exibe um token de acesso.
- #### 5. Inicia o kubectl proxy.
- #### 6. Exibe a URL correta para acessar o dashboard via navegador.

---
## 🧩 Pré-requisitos

- Um cluster Kubernetes em funcionamento (ex: Minikube, Kind, Kubeadm, etc).
- kubectl configurado e com acesso ao cluster.
- Acesso à internet para baixar os manifests do dashboard.


## 🛠️ Como usar
- #### 1. Clone ou salve o script

#### Salve o arquivo setup-dashboard.sh no seu ambiente local.

- #### 2. Torne o script executável
        chmod +x setup-dashboard.sh

- #### 3. Execute o script
        ./setup-dashboard.sh

- #### 4. Acesse o dashboard

    - #### O script exibirá a URL correta (via kubectl proxy) para acesso local:
         http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
    
    - #### **Use o token gerado no terminal para autenticação via navegador.**
---

## 🔐 Segurança

#### Este script cria um usuário com acesso administrativo total ao cluster via Dashboard.

#### Use com cautela em ambientes de produção.

- #### O acesso é feito via token JWT gerado para o admin-user.


## 🧹 Como remover tudo (limpeza)

#### Se quiser desfazer a instalação e remover todos os recursos criados:
        kubectl delete namespace kubernetes-dashboard

        kubectl delete clusterrolebinding admin-user

---

📎 Referências

- [Kubernetes Dashboard - GitHub](https://github.com/kubernetes/dashboard)
- [Documentação Oficial do Dashboard](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)
