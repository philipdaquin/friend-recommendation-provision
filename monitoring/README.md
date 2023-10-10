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
**Note: it will be nice to have this entire process to be automated 
- build terraform services with ``` terraform apply ``` 
- install the monitoring stack  with useful scripts inside monitoring module 



