# ft_services

This project consist to clusturing an docker-compose application and deploy it with Kubernetes.

### 🎯 Object

Set up a multi-service cluster!

- There are **Kubernetes web dashboard** to manage cluster.
- _Only_ entry point of cluster will be at **Load Balancer**.
- **Wordpress**, **phpMyAdmin**, **MySQL**, **nginx**, **FTPS**, **Grafana**, **InfluxDB** are running with seperate containers.
- In case of a crash or stop of one of the two database containers, it will have to make sure the **data persist** and must **restart** properly.

### 💻 How to Run

> 🚨 Before running, `docker`, `minikube`, `kubectl` and `VirtualBox` are installed in local enviroment.

```bash
$ ./setup.sh
```
