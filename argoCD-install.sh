
# Bilgilerimizi tanımlıyoruz.
gcloud auth login

# Projelerimizi listeler
gcloud projects  list 


# Proje seçiyoruz.
gcloud config set  <PROJECT_ID>

# Zone seçimi
gcloud config set compute/zone us-central1-a


# GCP (Google Cloud Platform) cluster kurulumu
# Belirtilen özelliklerde  gcp  de gke hizmeti tarafından bir node lu bir  cluster oluşturulur.
gcloud container clusters create test-cluster \
--num-nodes=1 \
--machine-type=e2-medium \
--image-type=COS_CONTAINERD \
--zone=us-central1-a


# cluster a bağlanmak için kubeconfig dosyamızı düzenliyoruz.
gcloud container clusters get-credentials test-cluster --zone=us-central1-a


# Hata verirse  plugin eksik olabilir yükleyip tekrar deneyelim.
sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin


# cluster da ArgoCD namespace oluşturalım.
kubectl create namespace argocd

# argoCD kubernetes  config ayarları kurulumu
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.1.3/manifests/install.yml


# ArgoCD üzerinde bir Kubernetes uygulamasının Deployment'unu tanımlıyoruz.
kubectl apply -f application.yml

# Bu servis, ArgoCD uygulamasına erişimi sağlamak için kullanılır.
kubectl apply -f argoCD-service.yml

# ArgoCD default password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo

