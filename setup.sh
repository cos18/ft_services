#!/bin/sh

# Setting minikube
minikube delete
minikube start --driver=hyperkit

# Install MetalLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# Config minikube addons
minikube addons enable metrics-server
minikube addons enable dashboard

# Open Dashboard
minikube dashboard
