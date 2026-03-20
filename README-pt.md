🇧🇷 [Leia em Português](README-pt.md)

# 🖥️ AWS Kubernetes Platform

Plataforma cloud-native na AWS baseada em Kubernetes, implementando práticas modernas de DevOps/SRE como Infrastructure as Code, CI/CD, GitOps e Observabilidade.

---

## 📌 Descrição

Este projeto demonstra o design e a implementação de uma plataforma DevOps/SRE, desde o provisionamento de infraestrutura na AWS até o deploy automatizado e monitoramento de aplicações em Kubernetes, utilizando boas práticas amplamente adotadas no mercado.

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
│ ├── k3s/
│ └── k3s-worker/
├── app/
├── gitops/
│ ├── apps/
│ ├── argocd/
│ └── observability/
├── .github/workflows/
├── docs/
│ ├── screenshots/
│ ├── step-by-step.md
│ └── passo-a-passo.md
└── README.md
```

---

## 📸 Visualização do Projeto

📁 /docs/screenshots/

---

## 🧪 Execução

O passo a passo completo para execução do projeto está disponível no arquivo:

📁 /docs/passo-a-passo.txt

---

## 🎯 Principais Features

- Pipeline CI/CD completo com build e deploy automatizados de imagens
- Fluxo GitOps utilizando ArgoCD (sem necessidade de kubectl apply manual)
- Cluster Kubernetes provisionado na AWS sem uso de serviços gerenciados (EKS)
- Integração com AWS ECR como registry privado de containers
- Stack de observabilidade com Prometheus e Grafana
- Infraestrutura totalmente gerenciada como código (Terraform + Ansible)
