#!/bin/sh

echo; echo ">> 🐋  Setting minikube"; echo;
minikube delete
minikube start --driver=virtualbox
eval $(minikube docker-env)

echo; echo ">> 🔨  Build Docker image"; echo;
docker build -t ft-services-influxdb srcs/influxdb
docker build -t ft-services-nginx srcs/nginx
docker build -t ft-services-grafana srcs/grafana

echo; echo ">> 🔧  Setting MetalLB"; echo;
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb/config.yaml

echo; echo ">> 🎨  Apply yaml in minikube"; echo;
kubectl apply -f srcs/influxdb/influxdb.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/grafana/grafana.yaml

echo; echo ">> 🛠  Config minikube addons"; echo;
minikube addons enable metrics-server
minikube addons enable dashboard

echo; echo ">> 🏚  Open Dashboard"; echo;
minikube dashboard
