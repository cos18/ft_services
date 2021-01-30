#!/bin/sh

echo; echo ">> 🐋  Setting minikube"; echo;
minikube delete
minikube start --driver=hyperkit

# https://velog.io/@humblego42/쿠버네티스-Minikube-MetalLB-셋팅-자동화하기
echo; echo ">> 🔧  Setting MetalLB"; echo;
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

MINIKUBE_IP=$(minikube ip)
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" srcs/metallb/config_base.yaml > srcs/metallb/config.yaml
kubectl apply -f srcs/metallb/config.yaml

echo; echo ">> 🛠  Config minikube addons"; echo;
minikube addons enable metrics-server
minikube addons enable dashboard

echo; echo ">> 🏚  Open Dashboard"; echo;
minikube dashboard
