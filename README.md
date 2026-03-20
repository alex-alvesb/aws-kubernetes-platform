🇺🇸 [Read in English](README.md)

# ☁️ AWS Kubernetes Platform

Kubernetes platform project on AWS using Terraform, Ansible, GitOps with ArgoCD, CI/CD with GitHub Actions, and an observability stack with Prometheus and Grafana.

---

## 📌 Description

This project demonstrates the design and implementation of a production-like DevOps/SRE platform on AWS, covering infrastructure provisioning, automated deployments, and observability in a Kubernetes environment.

---

## 🧠 Architecture

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
Application
↓
Prometheus + Grafana
```

---

## ⚙️ Technologies Used

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

## 📂 Project Structure

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

## 📸 Project Visualization

📁 /docs/screenshots/

---

## 🧪 Execution

A detailed step-by-step guide to reproduce the full environment (infrastructure, cluster setup, GitOps, and observability) is available at:

📁 /docs/step-by-step.md

---

## 🎯 Key Features

- End-to-end CI/CD pipeline with automated image build and deployment
- GitOps workflow using ArgoCD (no manual kubectl apply)
- Kubernetes cluster provisioned on AWS without managed services (EKS)
- Integration with AWS ECR as private container registry
- Observability stack with Prometheus and Grafana
- Infrastructure fully managed as code (Terraform + Ansible)
