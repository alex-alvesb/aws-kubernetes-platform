# ☁️ AWS Kubernetes Platform

Projeto de plataforma Kubernetes na AWS utilizando Terraform, Ansible, GitOps com ArgoCD, CI/CD com GitHub Actions e stack de observabilidade com Prometheus e Grafana.

---

## 📌 Descrição

Este projeto tem como objetivo demonstrar a construção de uma plataforma completa de DevOps/SRE, cobrindo desde o provisionamento da infraestrutura até o deploy automatizado e monitoramento de aplicações em Kubernetes.

---

## 🧠 Arquitetura

```
GitHub
↓
GitHub Actions (CI/CD)
↓
AWS ECR (Container Registry)
↓
ArgoCD (GitOps)
↓
Kubernetes (K3s - EC2)
↓
Aplicação
↓
Prometheus + Grafana
```

---

## ⚙️ Tecnologias Utilizadas

- AWS (EC2, ECR, IAM)
- Terraform
- Ansible
- Kubernetes (K3s)
- ArgoCD
- GitHub Actions
- Docker
- Prometheus
- Grafana

---

## 📂 Estrutura do Projeto

```
aws-kubernetes-platform/
├── terraform/
│ ├── network/
│ ├── ec2/
│ ├── iam/
│ └── ecr/
├── ansible/
│ ├── group_vars/
│ └── roles/
│  ├── k3s/
│  └── k3s-worker/
├── app/
├── gitops/
│ ├── apps/
│ ├── argocd/
│ └── observability/
├── .github/workflows/
├── docs/
│ ├── screenshots/
│ └── passo-a-passo.txt
└── README.md
```

---

## 📸 Visualização do Projeto

📁 /docs/screenshots/

---

## 🧪 Execução

O passo a passo completo para execução do projeto está disponível no arquivo:

📁 /docs/passo-a-passo.txt
