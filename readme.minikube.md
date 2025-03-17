# 🚀 n8n + Ollama + Postgres Setup Guide 🎵
### 🎼 Comprehensive README.md Draft:
Welcome to the ultimate garage band of automation and AI! This guide walks you through setting up **n8n**, **Ollama**, and **Postgres** in a Kubernetes environment using Minikube. With these services in harmony, you're ready to rock automated workflows, chat capabilities, and data magic.

## 🎸 Features
- **n8n**: A powerful, user-friendly automation tool to orchestrate your workflows.
- **Ollama**: AI at your fingertips, with support for chat and embeddings (once models are loaded).
- **Postgres**: The steadfast drummer keeping your data in sync.

---

## 🛠️ Prerequisites
Ensure the following are installed on your system:
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/)
- Docker
- A modern terminal with support for `kubectl` commands (like Windows PowerShell or WSL).

---

## 🎤 Setup Instructions

### 1. **Start Minikube**
Launch Minikube and configure the Docker driver:
```bash
minikube start --driver=docker
```

Enable `minikube tunnel` for `LoadBalancer` services:
```bash
minikube tunnel
```

---

### 2. **Deploy Services**
Apply the Kubernetes manifests to set up persistent storage and deploy the services.

#### Persistent Volumes and Claims:
```bash
kubectl apply -f n8n-pv-pvc.yaml
```

#### Deployments:
Ensure the services (`n8n`, `postgres`, and `ollama`) are running:
```bash
kubectl get pods
kubectl get services
```

---

### 3. **Load Models in Ollama**
To make Ollama functional, load a model using the following steps:
1. Enter the **Ollama** container:
   ```bash
   kubectl exec -it <ollama-pod-name> -- sh
   ```

2. Use the `ollama` CLI to load a model:
   ```bash
   ollama load -m chat-model --path /path/to/chat-model
   ollama load -m embedding-model --path /path/to/embedding-model
   ```

**Tip:** Update the `.env` file or deployment YAML to specify the default model path:
```plaintext
OLLAMA_MODELS=/root/.ollama/models
```

---

### 4. **Verify Connections**
Test all services to ensure they’re playing in sync:
- **Postgres**:
  ```bash
  psql postgres://n8n_user:n8n_password@<postgres-IP>:5432/n8n
  ```
- **Ollama**:
  ```bash
  curl http://127.0.0.1:11434
  ```
- **n8n**:
  Access the UI:
  ```plaintext
  http://127.0.0.1:31977
  ```

---

## 🎷 Troubleshooting
### `curl` Fails to Connect
Ensure `minikube tunnel` is running and the NodePorts are correctly forwarded.

### Ollama Has No Models
Load models manually into Ollama as described above. Update your deployment to persist models across pod restarts.

### Persistent Volumes Not Binding
Manually create and bind volumes:
```bash
kubectl apply -f pv-pvc-fix.yaml
```

---

## 🥁 Roadmap
- Automate Ollama model loading via `.env` or scripts.
- Add support for multiple AI models (chat, embeddings, etc.).
- Expand the band—add more services and integrate them into n8n workflows.

---

## 🎶 Join the Band
Contributions and feedback are welcome! Submit issues or pull requests to help improve this setup.

---

**Let’s rock automation and AI together!** 🎸🔥
```

---

### Ollama Needs Models 🎤:
For Ollama to shine, the `.env` variables must be leveraged to load models automatically. Since this is currently missing, here’s a quick suggestion:
- Add model paths to `.env`:
  ```plaintext
  OLLAMA_DEFAULT_MODEL=chat-model
  OLLAMA_EMBEDDING_MODEL=embedding-model
  ```
