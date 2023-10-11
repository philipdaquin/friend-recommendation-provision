# Centralised Monitoring, Logging and Traces 

## Prometheus Operator CRD
- Prometheus 
- Alert Manager
- ThanosRuler
- ServiceMonitor
- PodMonitor
- Probe
- PrometheusRule 
- AlertManagerConfig


### Grafana 
Add this data source to your Grafana Dashboard: 
```
http://prometheus-operated.monitoring.svc:9090

```

apply to serverside crds
apply deployment, namespace, rbac

### Getting Started 
**Note: it will be nice to have this entire process to be automated using Ansible but in the meantime, the scripts are suffice for now  
- build terraform services with ``` terraform apply ``` 
- make sure to be logged in your aws cli 
- apply `aws eks update-kubeconfig --name NAMEOFCLUSTER --region us-east-2`
- Run `monitoring-deploy.sh` to install all dependencies 
- Run `expose-apis.sh` to expose both prometheus and grafana locally 



