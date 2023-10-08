kubectl create namespace test
kubectl apply -f gce-ssd-storageclass.yaml
gcloud compute disks create --size 50GB --type pd-ssd pd-ssd-disk-1 --zone=us-central1-a
kubectl apply -f neo4j-pvc.yaml