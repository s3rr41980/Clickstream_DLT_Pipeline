-- =============================================================
-- GOVERNANCE: Unity Catalog RBAC Setup
-- =============================================================

-- 1. Catalog Level Security
-- Ensure only admins can modify the catalog structure
ALTER CATALOG databricks_clickstream_dev OWNER TO `databricks-project-admins`;

-- 2. Engineer Access Path
-- Engineers must have USE CATALOG to reach the schemas within
GRANT USE CATALOG ON CATALOG databricks_clickstream_dev TO `databricks-project-engineers`;

-- 3. Restricted Data Access
-- Engineers are restricted to the clickstream_dlt schema for BI and Debugging
GRANT USE SCHEMA ON SCHEMA databricks_clickstream_dev.clickstream_dlt TO `databricks-project-engineers`;
GRANT SELECT ON SCHEMA databricks_clickstream_dev.clickstream_dlt TO `databricks-project-engineers`;