# ArgoCD namespace
kubectl create namespace argocd

# argoCD kubernetes kurulumu
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.1.3/manifests/install.yml


kubectl apply -f application.yml


# argoCD service
kubectl apply -f argoCD-service.yml

# ArgoCD default password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo

