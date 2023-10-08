
echo "Welcome to Redis"

kubectl create configmap \
--from-file=slave.conf=./conf/slave.conf \
--from-file=master.conf=./conf/master.conf \
--from-file=sentinel.conf=./conf/sentinel.conf \
--from-file=init.sh=./etc/init.sh \
--from-file=sentinel.sh=./etc/sentinel.sh \
redis-config


kubectl apply -f .
