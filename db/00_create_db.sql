-- 00_create_db.sql

CREATE DATABASE den_blog_db
WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'pl_PL.UTF-8'
    LC_CTYPE = 'pl_PL.UTF-8'
    TEMPLATE = template0
;

GRANT ALL PRIVILEGES ON DATABASE den_blog_db TO postgres;

CREATE EXTENSION IF NOT EXISTS pg_trgm;
