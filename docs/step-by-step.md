# AWS Kubernetes Platform - Step by Step

---

## Terraform - Provisioning

```bash
cd terraform/ec2
terraform apply --auto-approve

cd ../ecr
terraform apply --auto-approve
```

## Ansible - Cluster Configuration

Fill the file:

```
ansible/inventory.ini
```

Run:

```bash
cd ansible/
ansible-playbook -i inventory.ini playbook.yaml
```

## Kubectl Configuration

Access master:

```bash
sudo cat /etc/rancher/k3s/k3s.yaml
```

On local host:

```bash
rm -r ~/.kube && mkdir -p ~/.kube && nano ~/.kube/config
```

Replace:

```bash
server: https://127.0.0.1:6443
```

With:

```bash
server: https://IP_OF_MASTER:6443
```

Validate:

```bash
kubectl get nodes
```

## ArgoCD - Installation

```bash
kubectl create namespace argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl get pods -n argocd
```

### ArgoCD Exposure

```bash
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'

kubectl get svc -n argocd
```

Access in browser:

```
http://IP_OF_MASTER:NODEPORT
```

Login:

```
user: admin
password:
```

```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo
```

## Git - First Push

At project root:

```bash
git add .
git commit -m "new run"
git push
```

## Application Deployment

Wait for pipeline completion and run:

```bash
kubectl apply -f gitops/argocd/applications/nginx-app.yaml
```

Validate:

```bash
kubectl get pods
```

## Observability - Prometheus / Grafana

```bash
kubectl create namespace monitoring

kubectl apply -f gitops/argocd/applications/prometheus-stack.yaml

kubectl get applications -n argocd

# Useful commands:

# kubectl get pods -n monitoring

# kubectl get svc -n monitoring

# kubectl get svc -n monitoring | grep grafana
```

Access in browser:

```
http://IP_OF_MASTER:30030
```

Login:

```
user: admin
password: prom-operator
```

## Cleanup - Destroy Infrastructure

Delete images manually in AWS, then run:

```bash
cd ../ec2
terraform destroy --auto-approve
cd ../ecr
terraform destroy --auto-approve
```
