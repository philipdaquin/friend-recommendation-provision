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
Add this data source 
```
http://prometheus-operated.monitoring.svc:9090

```


apply to serverside crds
apply deployment, namespace, rbac