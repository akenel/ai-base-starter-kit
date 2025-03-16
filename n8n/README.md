
#### **n8n README Example**
```markdown
# n8n: Workflow Automation Tool

## Overview
n8n is an open-source tool designed to automate workflows.

## Using the Unified Setup
n8n is included in the base AI system. Use the root `docker-compose.yml` to launch all services:
```bash
docker-compose up -d
```

## Sanity Checks
1. **Verify n8n is Running**:
   ```bash
   curl http://localhost:5678
   ```

2. **Check Logs for Issues**:
   ```bash
   docker logs n8n
   ```

3. **Verify Database Connection**:
   Access the database:
   ```bash
   psql -h postgres -U n8n_user -d n8n
   ```
```

---
