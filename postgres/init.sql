DO
\\$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'n8n') THEN
      CREATE DATABASE n8n;
      CREATE USER n8n_user WITH PASSWORD 'n8n_password';
      GRANT ALL PRIVILEGES ON DATABASE n8n TO n8n_user;
   END IF;
END
\\$;
