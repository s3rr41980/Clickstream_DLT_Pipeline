🚀 Lakeflow Clickstream Pipeline: Declarative Data Engineering

📖 Executive Summary
This repository contains a production-ready Lakeflow Spark Declarative Pipeline (SDP) designed to process real-time clickstream data. Moving beyond traditional procedural ETL, this project leverages Declarative Engineering to define the "desired state" of data, allowing the Spark 4.1 engine to autonomously handle orchestration, state management, and performance optimization.

🏗️ Technical Architecture
The project follows a Medallion (Multi-Hop) Architecture, ensuring data quality and governance at every stage:
Bronze (Ingestion): Raw JSON events are ingested from Azure Data Lake Storage (ADLS) using Auto Loader. Malformed data is caught via a _rescued_data column.
Silver (Refinement): Data is standardized, timestamps are normalized, and PII (Emails/User IDs) are hashed using SHA-256 for GDPR/CCPA compliance.
Gold (Analytics): High-performance tables optimized with Liquid Clustering and SCD Type 2 tracking for historical user behavior analysis.

🌟 Key Features & 2025 Standards
1. Declarative Engineering (@dp API)
By using the Spark 4.1 pyspark.pipelines library, the code focuses on what the data should look like rather than how to move it.
Automatic Dependency Tracking: The engine builds a DAG to ensure tables update in the correct order.
Managed State: Checkpoints and triggers are handled by the platform, eliminating manual "Toil."
2. Autonomous Optimization
Auto Liquid Clustering: Implemented cluster_by_auto=True on the Gold Layer, allowing the Databricks Intelligence Engine to physically reorganize data based on real-time query patterns.
Serverless Compute: The pipeline runs on serverless infrastructure, scaling to zero when idle to minimize cloud costs.
3. Infrastructure as Code (DABs)
The entire environment is managed via Databricks Asset Bundles (DABs), allowing for environment-agnostic deployments (Dev vs. Prod) using YAML configuration.

📂 Repository Structure
File / Folder	Description
databricks.yml	Project Blueprint: Defines variables, workspace targets, and cloud storage paths.
resources/	Resource Definitions: Configures the Lakeflow Pipeline, compute settings, and library links.
src/	Source Code: The core PySpark logic utilizing @dp decorators and data quality expectations.
.github/workflows/	CI/CD: Automated deployment pipelines via GitHub Actions.

🛠️ Skills Demonstrated
Languages: Python (PySpark), SQL, YAML.
Data Architecture: Medallion Architecture, SCD Type 2, Fact/Dimension Modeling.
DevOps: Infrastructure as Code (DABs), CI/CD (GitHub Actions).
Specialized: Liquid Clustering, Auto Loader, Data Quality Expectations, Unity Catalog