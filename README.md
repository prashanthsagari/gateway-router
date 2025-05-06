# Favorite Service

This project involves deploying the `favorites-service` with a MySQL database on Minikube.

## Prerequisites

Before you begin, ensure you have the following installed:

- **Minikube**: For local Kubernetes clusters.
- **Docker**: To build and manage container images.
- **Maven**: To build the Java project.
- **kubectl**: To interact with the Kubernetes cluster.
- **MySQL Docker Image**: Used to create the MySQL database.

## Setup Instructions

### 1. Start Minikube

Run the following command to start Minikube with Docker as the driver:  <br />
minikube start --driver=docker  <br />

Run below commands using Powershell if  you are using Windows OS
# start minikube in docker
Otherwise the image will be in your local PC, not inside Minikube’s Docker engine.
 
### 2. Connect to Minikube's Docker Engine
In PowerShell, run the following to switch to Minikube's Docker environment:

& minikube docker-env | Invoke-Expression


docker pull mysql:8.0

# (Name: minikube)
docker info  

# run below command 
mvn clean install  

# Build image 
docker build -t gateway-router:latest .  <br />
docker tag gateway-router:latest sagariprashanth/gateway-router:latest <br />
docker push sagariprashanth/gateway-router:latest <br />


# verify image is creation
docker images <br />


-- kubectl scale deployment mysql --replicas=0

kubectl apply -f k8s/gateway-router-deployment.yaml <br />
kubectl apply -f k8s/gateway-router-service.yaml <br />


kubectl port-forward svc/gateway-router 8889:8889 <br />



# Delete old deployments 
kubectl delete -f k8s/gateway-router-deployment.yaml <br />
kubectl delete -f k8s/gateway-router-service.yaml <br />

# Stop minikube
minikube stop
"# gateway-router" 
