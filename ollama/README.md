### **Ollama: Local AI Inference Service**

# 🧠 Ollama: Local AI Inference Service 🚀

![Ollama at Work](../assets/chuck-norris.gif)

## Overview
Ollama provides a local inference service for AI models, perfect for tasks such as natural language processing, embeddings, or chat-based workflows. Integrated seamlessly into the AI Base Starter Kit, it’s an essential building block for AI developers.

---

## 🚀 Getting Started
### Using the Unified Setup
Ollama is already part of the `docker-compose.yml` in the root folder. You can spin it up alongside other services with:
```bash
docker-compose up -d --build
```

### Specific Steps for Ollama
1. **Check Ollama’s Status**:
   Test if Ollama is running:
   ```bash
   curl http://localhost:11434
   ```
   Expected Response:
   ```
   Ollama is running
   ```

2. **Load a Model**:
   Use the LLaMA model as an example:
   ```bash
   docker exec -it ollama-cpu ollama pull llama3.2
   ```
   The model will download and be cached for faster use later.

3. **Test Chat Functionality**:
   Interact with the model:
   ```bash
   curl -X POST http://localhost:11434/api/chat -d '{"input": "Tell me a joke!"}'
   ```

4. **Test Embeddings**:
   Generate embeddings for a piece of text:
   ```bash
   curl -X POST http://localhost:11434/api/embeddings -d '{"text": "This is a test for embeddings."}'
   ```

---

## 🔄 Cleanup and Fresh Start
Ollama stores model files and configurations persistently. If you want to reset or clean up resources, use these commands:
```bash
docker-compose down --remove-orphans
docker system prune --volumes -f
```

---

## ⚙️ Configuration
All configurations for Ollama are stored in the `.env` file in the root directory:
```env
OLLAMA_PORT=11434
OLLAMA_STORAGE=./data
OLLAMA_MODEL=llama
```

Make sure these values are correct and match your setup.

---

## 🔍 Troubleshooting
### Common Issues
#### Container Exited
If Ollama’s container exits prematurely, check the logs:
```bash
docker logs ollama-cpu
```

#### Models Not Persisting
Ensure the volume mapping is correct in the `docker-compose.yml`:
```yaml
volumes:
  - ./ollama/data:/root/.ollama
```

#### Incorrect Endpoints
Ensure API requests are hitting valid routes like:
- `/api/chat` for chat functionality
- `/api/embeddings` for embeddings

---

## 📜 License
This service is bundled into the AI Base Starter Kit. Licensing for Ollama is subject to its respective terms.

---

## ✨ What’s Next?
- Integrate Ollama with other services like **n8n** for automated workflows.
- Add more AI models to enhance its utility.
- Share your success stories with the AI community!

---

### **Because Even Chuck Norris Can’t Outperform a LLaMA…**
![Chuck Norris](../assets/chuck-norris.gif)
