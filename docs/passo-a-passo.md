# AWS Kubernetes Platform - Passo a Passo

---

## Terraform - Provisionamento

```bash
cd terraform/ec2
terraform apply --auto-approve

cd ../ecr
terraform apply --auto-approve
```

## Ansible - Configuração do Cluster

Preencher arquivo:

```
ansible/inventory.ini
```

Executar:

```bash
cd ansible/
ansible-playbook -i inventory.ini playbook.yaml
```

## Configuração do Kubectl

Acessar master:

```bash
sudo cat /etc/rancher/k3s/k3s.yaml
```

No host local:

```bash
rm -r ~/.kube && mkdir -p ~/.kube && nano ~/.kube/config
```

Alterar:

```bash
server: https://127.0.0.1:6443
```

Para:

```bash
server: https://IP_DO_MASTER:6443
```

Validar:

```bash
kubectl get nodes
```

## ArgoCD - Instalação

```bash
kubectl create namespace argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl get pods -n argocd
```

### Exposição do ArgoCD

```bash
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'

kubectl get svc -n argocd
```

Acessar no navegador:

```
http://IP_DO_MASTER:NODEPORT
```

Login:

```
usuario: admin
senha: 
```

```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo
```

## Git - Primeiro Push

Na raiz do projeto:

```bash
git add .
git commit -m "new run"
git push
```

## Deploy da Aplicação

Aguardar finalização do pipeline e executar:

```bash
kubectl apply -f gitops/argocd/applications/nginx-app.yaml
```

Validar:

```bash
kubectl get pods
```

## Observabilidade - Prometheus / Grafana

```bash
kubectl create namespace monitoring

kubectl apply -f gitops/argocd/applications/prometheus-stack.yaml

kubectl get applications -n argocd

# Comandos úteis:

# kubectl get pods -n monitoring

# kubectl get svc -n monitoring

# kubectl get svc -n monitoring | grep grafana
```

Acessar no navegador:

```
http://IP_DO_MASTER:30030
```

Login:

```
usuario: admin
senha: prom-operator
```

## Finalização - Destruir Infra

Deletar imagens manualmente na AWS e então:

```bash
cd ../ec2
terraform destroy --auto-approve
cd ../ecr
terraform destroy --auto-approve
```
