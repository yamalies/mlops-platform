# deploy.ps1

# Start Minikube if not running
$minikubeStatus = minikube status
if ($LASTEXITCODE -ne 0) {
    Write-Host "Starting Minikube..."
    minikube start
}

# Point Docker to Minikube's Docker daemon
Write-Host "Configuring Docker environment..."
minikube docker-env | Invoke-Expression

# Build Docker images
Write-Host "Building Docker images..."
docker build -t model-training:latest -f docker/training/Dockerfile .
docker build -t model-serving:latest -f docker/serving/Dockerfile .

# Apply Kubernetes manifests
Write-Host "Applying Kubernetes manifests..."
kubectl apply -f k8s/storage.yaml
kubectl apply -f k8s/model-training-job.yaml
kubectl apply -f k8s/model-serving-deployment.yaml
kubectl apply -f k8s/model-serving-service.yaml

# Wait for training job to complete
Write-Host "Waiting for training job to complete..."
kubectl wait --for=condition=complete job/model-training --timeout=300s

# Get service URL
Write-Host "Getting service URL..."
minikube service model-serving --url
