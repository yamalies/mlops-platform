# MLOps Platform

A production-grade MLOps platform for training, serving, and monitoring machine learning models using Kubernetes.

## 🚀 Quick Start

### Prerequisites

- Docker (20.10.x or later)
- Kubernetes cluster (1.20.x or later)
- kubectl (configured with your cluster)
- Python 3.9+
- Make

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/mlops-platform.git
cd mlops-platform
```
2. Install dependencies:
```bash
pip install -r requirements.txt
```
3. Build Docker images:
```bash
make build-training
make build-serving
```
### Running the Platform
1. Train the model:
```bash
make train
```
2. Serve the model:
```bash
make serve
```
3. Deploy to Kubernetes
```bash
make deploy
```
### 🏗️ Project Structure
```bash
mlops-project/
├── src/                    # Source code
│   ├── training/          # Model training code
│   └── serving/           # Model serving API
├── docker/                # Dockerfiles
├── k8s/                   # Kubernetes manifests
├── models/                # Saved models
├── requirements.txt       # Python dependencies
└── Makefile              # Automation commands
```
### 🔧 Usage
#### Local Development
Test the prediction API locally:
```bash
# Make a test prediction
curl -X POST http://localhost:8080/predict \
  -H "Content-Type: application/json" \
  -d '{
    "features": [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 
                0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
  }'
```
#### Kubernetes Deployment
Check deployment status:
```bash
kubectl get pods -l app=model-serving
kubectl get svc model-serving
```
### 📋 Available Commands
```bash
# Build Docker images
make build-training     # Build training image
make build-serving      # Build serving image

# Training
make train             # Train new model

# Serving
make serve             # Run API locally

# Deployment
make deploy            # Deploy to Kubernetes
```
### 🔍 API Endpoints
#### Prediction API
- **URL**: `/predict`
- **Method**: `POST`
- **Request Body**:
```json
{
    "features": [float]  // Array of 20 float values
}
```
- **Response**:
```json
{
  "prediction": [int],
  "status": "success"
}
```
#### Health Check
- **URL**: `/health`
- **Method**: `GET`
- **Response**:
```json
{
    "status": "healthy"
}
```
### 🛠️ Configuration
#### Environment Variables
| Variable |    Description    |        Default        |
|----------|-------------------|-----------------------|
|MODEL_PATH|Path to saved model|`/app/models/model.pkl`|
|PORT      |API server port    |`8080`                 |
#### Kubernetes Resources
Default resource limits:
- CPU: 500m
- Memory: 512Mi
### 📊 Monitoring
Health metrics are available at the `/health` endpoint. Future versions will include:
- Prometheus metrics
- Grafana dashboards
- Model performance monitoring
- System metrics
### 🔒 Security
Current security measures:
- Basic container security
- Resource limits
- API input validation

Planned security features:
- Authentication
- HTTPS/TLS
- Network policies
- RBAC

### 🚀 Roadmap
- Add monitoring with Prometheus/Grafana
- Implement proper logging system
- Add model versioning with MLflow
- Implement A/B testing
- Add feature store
- Implement CI/CD pipelines
- Add authentication and authorization
- Implement model performance monitoring
### 🤝 Contributing
1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request
### 📝 License
This project is licensed under the MIT License - see the LICENSE file for details.

### 👥 Authors
yamalies - Initial work - https://github.com/yamalies
### 🙏 Acknowledgments
- scikit-learn team for the ML framework
- Kubernetes community
- Flask framework developers
### 📧 Contact
yamalies - yamalchrischan@gmail.com

Project Link: https://github.com/yamalies/MLOps-Platform