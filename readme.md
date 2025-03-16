# 🎸 AI Base Starter Kit 🛠️

![Chuck Norris AI Starter Kit](./assets/chuck-norris.gif)

## Overview
This project lets you create a powerful, Dockerized AI workflow environment in just a few steps. 
With integrated tools like **n8n** for workflow orchestration, **Postgres** for persistence, and **Ollama** for local AI inference, 
this starter kit is designed for developers who want a solid foundation to build on.

---

## 🚀 Quick Start
### Clone and Launch
1. **Clone the Repository**:
   ```bash
   git clone <repo_url>
   cd ai-base
   ```

2. **Start All Services**:
   ```bash
   docker-compose up -d --build
   ```
   > _The first launch will take 10–20 minutes as models are downloaded. Subsequent starts will be much faster._

3. **Access Services**:
   - **n8n**: [http://localhost:5678](http://localhost:5678)
   - **Ollama**: [http://localhost:11434](http://localhost:11434)

---

## 🌍 Environment Variables
The kit uses `.env` files to customize configurations. All variables are stored in the root `.env` file for simplicity.

| Variable Name            | Default Value    | Description                                      |
|--------------------------|------------------|--------------------------------------------------|
| `DB_TYPE`                | postgresdb       | Type of database used by n8n.                   |
| `DB_POSTGRESDB_HOST`     | postgres         | Hostname of the Postgres database container.    |
| `DB_POSTGRESDB_PORT`     | 5432             | Port on which Postgres is running.              |
| `DB_POSTGRESDB_DATABASE` | n8n              | Name of the database used by n8n.               |
| `DB_POSTGRESDB_USER`     | n8n_user         | Username for database authentication.           |
| `DB_POSTGRESDB_PASSWORD` | n8n_password     | Password for database authentication.           |
| `OLLAMA_PORT`            | 11434            | Port for the Ollama inference service.          |
| `OLLAMA_STORAGE`         | ./data           | Location for storing model files.               |
| `OLLAMA_MODEL`           | llama            | Default AI model to load in Ollama.             |

---

## 🔄 Cleanup and Fresh Start
If you encounter issues or need a fresh start, clean up Docker resources with these commands:
```bash
docker-compose down --remove-orphans
docker system prune --volumes -f
docker-compose up -d --build
```

---

## 🔍 Troubleshooting
### Common Issues
#### Docker Path Problems
If `docker-compose` fails with errors like "Access is denied" or issues related to `${PWD}`, ensure you’re using the correct environment variables:
```bash
# Example docker-compose.yml usage
context: ${PWD}
```

#### Windows Temp Directory
If you encounter errors such as:
```
rename ... Access is denied.
```
Follow these steps to fix:
1. **Grant Full Permissions via Command Line**:
   ```powershell
   icacls "C:\Users\<your-username>\AppData\Local\Temp" /grant <your-username>:F /T
   ```
2. **Alternative**: Adjust permissions manually:
   - Navigate to `C:\Users\<your-username>\AppData\Local\Temp`.
   - Right-click → **Properties** → **Security** → Grant **Full Control**.

3. **Verify Permissions**:
   ```powershell
   icacls "C:\Users\<your-username>\AppData\Local\Temp"
   ```

---

## 📜 License
This project is licensed under the **MIT License**. See the LICENSE file for details.

---

## ✨ What’s Next?
- Explore detailed READMEs for individual services in their respective folders:
  - [Ollama](./ollama/README.md)
  - [Postgres](./postgres/README.md)
  - [n8n](./n8n/README.md)
- Add new services like **OpenWebUI** to expand your capabilities.
- Push it to GitHub and inspire the next wave of AI enthusiasts.

---

### **Because Chuck Norris Wouldn’t Approve of Debugging...**
![Chuck Norris FTW](./assets/OneManArmy.gif)
```

---
