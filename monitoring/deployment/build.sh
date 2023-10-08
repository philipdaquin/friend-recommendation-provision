
# kubectl delete -f postgres  
# kubectl delete -f user_deployment  

cd user_deployment  && kubectl apply -f . && cd -
cd api_gateway      && kubectl apply -f . && cd -
cd discovery_service && kubectl apply -f . && cd -
cd friend_deployment && kubectl apply -f . && cd -
cd recommendation_deployment && kubectl apply -f . && cd -

cd redis            && bash build.sh && cd -
cd postgres         && kubectl apply -f . && cd -
cd mongodb_deployment && kubectl apply -f . && cd -
cd neo4j && bash build-neo4j.sh && cd -
cd kafka && kubectl apply -f . && cd - 
