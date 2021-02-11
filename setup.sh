#!/bin/sh

if [ "$RESET_FT_SERVICES" = true ]
then
    echo; echo ">> 🗑  Reset Docker & Minikube"; echo;
    docker system prune -a -f
fi

echo; echo ">> 🐋  Setting minikube"; echo;
minikube delete
minikube start --driver=hyperkit

echo; echo ">> 🔨  Build Docker image"; echo;
docker build -t ft_services_nginx srcs/nginx

echo; echo ">> 🎨  Apply yaml in minikube"; echo;
kubectl apply -f srcs/nginx/nginx.yaml

# https://velog.io/@humblego42/쿠버네티스-Minikube-MetalLB-셋팅-자동화하기
echo; echo ">> 🔧  Setting MetalLB"; echo;
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb/config.yaml

echo; echo ">> 🛠  Config minikube addons"; echo;
minikube addons enable metrics-server
minikube addons enable dashboard

echo; echo ">> 🏚  Open Dashboard"; echo;
minikube dashboard
