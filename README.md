# Friend Recommendation Infrastructure Provisioning [POC]
This project provisions a Kubernetes Cluster (EKS) to manage each microservices.  It uses a GitOps workflow to simplfy the process of Continous Deployments to AWS.

This repo is for:
- Platform infrastructure
- End to End CI and Automated CD Pipeline
- Centralised Monitoring, Alerting and Logging 


### Prerequisites:
- Terraform 
- Kubernetes 
- Argo CD
- Kustomise
- Helm 

### AWS Stack 
- EKS
- VPC
- IAM 
- EC2
- Autoscaling 
- Gateway 
- Route53 

## AWS Architecture **[POC]**
![aws_architecture](https://github.com/philipdaquin/friend-recommendation-provision/assets/85416532/e1ec189e-6631-4d93-b099-41378943201e)

## CI / CD Pipeline Architecture 


## Continuous Integration Pipeline
Stack 
- Ansible 
- Dockerhub
- Jenkins
- Terraform 
- EC2 & other AWS
- Maven
- OpenJdk 17

### Steps to reproduce 
The following steps will automate the provisioning of all services required to run a Jenkins Continuous Integration (CI) Server.
1. Create a new key pair in AWS. Insert it inside `/ci-services`. Go the `modules/0-locals.tf` to configure the file path of `***.pem`.
2. You may need to perform `chmod 600 *****.pem` to unlock the secret. 
2. Run Terraform 
3. Rock and Roll!


## Continous Deployment Pipeline
Stack 
- Argo Cd 
- Image Updater 
- Kubernetes
- Helm 
- Github

#### To do:
- nice to haves: use ansible to automate argocd-to-eks deployment to initialise the app 
- modularise each terraform AWS services
- test each infrastructure code in Localstack
- generate Terraform diagram

### Argo CD 
**Manual Installation**: https://argo-cd.readthedocs.io/en/stable/getting_started/
or initialise Argo CD using Helm with Terraform. /argocd

[description]

### Steps to reproduce Main Architecture 
1. Provision infrastructure on Terraform 
2. Test connection with EchoServer. Expose application to NLB 
3. Install Argo CD and select the manifest files 
4. Initialise an API gateway
5. Create a hosted zone in Route53. 
6. Create custom DNS name with ACM certificate. 

### Steps to reproduce ArgoCD Updater
1. Create a secret key for ArgoCD
2. Initialise ArgoCd using Terraform, using `terraform init...plan..apply`
3. Configure the target url to your Kubernetes Manifest files

### Create a secret key for ArgoCD
```
    kubectl --namespace argocd create secret generic argogitsecrets \
    --from-literal=username=[GITHUB_USERNAME] \             
    --from-literal=password=[GITHUB_TOKEN]       
```
## Centralised Monitoring, Alerting, Logging, and Traces 
Stack 
- Prometheus Operator
- Grafana
- Promtail & Loki
- Tempo 
- cAdvisor
- Ansible 
- Open Telemetry
- Alert Manager 
- Thanos 
- Kube State Metrics
Terraform 
AWS Services

### Steps to reproduce
Login to your Kubernetes Cluster then apply each steps.
1. Create namespace and CRDs with ``` kubectl apply --server-side -f manifest/setup ```
2. Wait for CRD creation to complete ```until kubectl get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done```
3. Create prometheus operator components with ```kubectl create -f manifests/```
4. Deploy all system components inside deployments ```bash build.sh```
 
