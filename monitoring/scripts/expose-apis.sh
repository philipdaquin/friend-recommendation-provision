kubectl port-forward svc/prometheus-operated 9090 -n monitoring

kubectl port-forward svc/grafana  3000  -n monitoring   

echo "Visit Prometheus Instance: http://localhost:9090"
echo "Visit Grafana Dashboard: http://localhost:3000"
