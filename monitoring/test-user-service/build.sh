
# kubectl delete -f postgres  
# kubectl delete -f user_deployment  

cd postgres && kubectl apply -f . && cd -
cd user_deployment && kubectl apply -f . && cd -
cd redis && bash build.sh