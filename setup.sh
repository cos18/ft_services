#!/bin/sh

echo; echo ">> 🐋  Setting minikube"; echo;
minikube delete
minikube start --driver=virtualbox
eval $(minikube docker-env)

echo; echo ">> 🔧  Setting MetalLB"; echo;
minikube addons enable metallb
kubectl apply -f srcs/metallb/config.yaml

echo; echo ">> 🔨  Build Docker image"; echo;
docker build -t ft-services-influxdb srcs/influxdb
docker build -t ft-services-telegraf srcs/telegraf
docker build -t ft-services-nginx srcs/nginx
docker build -t ft-services-grafana srcs/grafana

echo; echo ">> 🎨  Apply yaml in minikube"; echo;
kubectl apply -f srcs/influxdb/influxdb.yaml
kubectl apply -f srcs/telegraf/telegraf.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/grafana/grafana.yaml

echo; echo ">> 🛠  Config minikube addons"; echo;
minikube addons enable metrics-server
minikube addons enable dashboard

echo; echo ">> 🏚  Open Dashboard"; echo;
minikube dashboard
