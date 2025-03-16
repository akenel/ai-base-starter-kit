# 🗃️ Postgres: Database for n8n and Beyond 🚀

![Chuck Norris Approves Postgres](../assets/chuck-norris.gif)

## Overview
Postgres is the backbone of our starter kit, providing database support for **n8n** workflows, logs, and execution data. But Postgres doesn’t stop there—it's an incredible powerhouse for hosting relational databases like **NorthwindSQL** or even migrating data from **Google Sheets**. With this setup, you can explore, learn, and scale confidently.

---

## 🚀 Getting Started
### Using the Unified Setup
Postgres is included in the root `docker-compose.yml`. To launch it along with other services, simply run:
```bash
docker-compose up -d --build
```

### Standalone Launch
To run Postgres on its own:
1. Move to the `postgres` directory:
   ```bash
   cd postgres
   ```

2. Start the service:
   ```bash
   docker-compose up -d
   ```

---

## 🌍 Configuration and Environment Variables
Postgres settings are configurable via the `.env` file at the root of the project.

| Variable Name            | Default Value | Description                            |
|--------------------------|---------------|----------------------------------------|
| `DB_POSTGRESDB_HOST`     | postgres      | The hostname of the Postgres container.|
| `DB_POSTGRESDB_PORT`     | 5432          | The port where Postgres runs.          |
| `DB_POSTGRESDB_DATABASE` | n8n           | Default database name for n8n.         |
| `DB_POSTGRESDB_USER`     | n8n_user      | Username for database authentication.  |
| `DB_POSTGRESDB_PASSWORD` | n8n_password  | Password for database authentication.  |

---

## 🔍 Sanity Checks and Debugging
### Verify Postgres is Running
1. List active containers:
   ```bash
   docker ps
   ```
   Look for a container named `postgres`.

2. Access the Postgres container:
   ```bash
   docker exec -it postgres psql -U n8n_user -d n8n
   ```
   Success Message:
   ```
   n8n=#
   ```

### Database Commands You’ll Need
- **List all databases**:
  ```sql
  \l
  ```
- **List all tables in the current database**:
  ```sql
  \dt
  ```
- **Exit the Postgres shell**: Hit `q`.

### Common Issues
#### Problem: `Could not connect to Postgres`
Check the logs for errors:
```bash
docker logs postgres
```

#### Problem: Database Not Persisting
Ensure the volume is mapped correctly in `docker-compose.yml`:
```yaml
volumes:
  - ./postgres/data:/var/lib/postgresql/data
```

#### Pro Tip: Use Postgres for More
- Host a **NorthwindSQL** database for testing queries.
- Migrate data from **Google Sheets** for real-world use cases.
- Integrate with **n8n** for powerful automation workflows.

---

## 🧠 Advanced Usage
Serious users should consider:
- Adding **Redis** for caching and message queuing.
- Integrating **Qdrant** for vector search capabilities.
- Scaling with multiple databases for microservices.

These can be added as extensions of this setup.

---

## 🔄 Cleanup and Reset
Postgres stores persistent data by default, so if you need a clean slate:
1. Stop the service:
   ```bash
   docker-compose down --remove-orphans
   ```
2. Remove all data:
   ```bash
   rm -rf ./postgres/data
   ```

3. Rebuild and restart:
   ```bash
   docker-compose up -d --build
   ```

---

## 📜 License
This service is bundled into the AI Base Starter Kit. Licensing for Postgres is subject to its respective terms.

---

## ✨ What’s Next?
- Integrate Postgres with **n8n**, **Redis**, or **Qdrant** for advanced workflows.
- Use it to power dashboards, analytics, or AI models.
- Rock the AI world with your new database superpowers!

---

### **Because Postgres and Chuck Norris Can Handle Anything**
![Chuck Norris](../assets/chuck-norris.gif)