# Data Science Student Environment

This repository provides a pre-configured GitHub Codespaces environment for courses and projects involving data structures, storage systems, and distributed computing. It includes all necessary dependencies and tools for working with Python, PySpark, Kafka, databases (MongoDB, Redis, Neo4j, Cassandra), Azure services, and data processing libraries.

## Quick Start with GitHub Codespaces

1. **Create a Codespace:**
   - Click the green "Code" button at the top of this repository
   - Select the "Codespaces" tab
   - Click "Create codespace on main" (or your desired branch)
   - Wait for the environment to build (first time may take 5-10 minutes)

2. **Verify Installation:**
   Once your Codespace is ready, open a terminal and verify the installations:
   ```bash
   # Check Python version
   python --version
   
   # Check Java (required for PySpark)
   java -version
   
   # Verify Kafka installation
   ls /opt/kafka/bin/
   
   # Check installed Python packages
   pip list
   
   # Check database tools
   mongosh --version
   redis-cli --version
   cypher-shell --version
   
   # Check cloud CLIs
   az --version
   aws --version
   
   # Check DuckDB
   duckdb --version
   ```

## Bootstrap Script for Lab Deployment

A `bootstrap.sh` script is provided for automated deployment of lab bundles from Azure Storage:

```bash
# Download and extract a lab bundle
./bootstrap.sh "https://yourstorageaccount.blob.core.windows.net/container/bundle.tar.gz?SAS_TOKEN"
```

The script will:
- Download the tar.gz bundle from the provided URL (including SAS token)
- Extract the contents to the current directory
- Provide instructions for next steps

**Prerequisites:** The script requires `curl` and `tar` (both pre-installed in this environment).

## Pre-installed Dependencies

### Python Packages
- **Data Processing & Analytics:**
  - pyspark - Apache Spark Python API
  - pandas - Data manipulation and analysis
  - numpy - Numerical computing
  - scipy - Scientific computing
  - polars - Fast DataFrame library
  - pyarrow - Apache Arrow Python bindings
  
- **Visualization:**
  - matplotlib - Plotting library
  - plotly - Interactive visualizations
  
- **Machine Learning:**
  - scikit-learn - Machine learning library
  - scikit-image - Image processing

- **Azure Services:**
  - azure-storage-blob - Azure Blob Storage
  - azure-storage-queue - Azure Queue Storage
  - azure-storage-file-share - Azure File Share
  - azure-storage-file - Azure File Storage
  - azure-data-tables - Azure Table Storage
  - azure-eventhub - Azure Event Hubs

- **Message Queues & Streaming:**
  - confluent-kafka - Confluent's Kafka Python client
  - kafka-python - Apache Kafka Python client
  - pyzmq - Python bindings for ZeroMQ

- **Databases:**
  - pymongo - MongoDB driver
  - redis - Redis client
  - neo4j - Neo4j driver
  - pymilvus - Milvus vector database client
  - dnspython - DNS toolkit

- **Data Formats & Utilities:**
  - fastavro - Fast Avro library
  - Faker - Fake data generation
  - pydicom - DICOM file handling
  - Pillow - Image processing
  - schwifty - IBAN/BIC validation
  - networkx - Network/graph analysis
  - pygraphviz - Graphviz interface
  - nxviz - Network visualization

### Tools & Services
- **Apache Kafka** - Installed at `/opt/kafka/bin/`
- **Java 17 (OpenJDK)** - Required for PySpark and Kafka
- **Python 3.11** - Latest stable Python version
- **Docker** - Docker CLI and Docker Compose for containerization
- **Ansible** - Infrastructure automation and configuration management
- **Database CLIs:**
  - mongosh - MongoDB shell
  - redis-cli - Redis command-line interface
  - cypher-shell - Neo4j Cypher shell
  - cqlsh - Cassandra shell (via Python)
  
- **Cloud CLIs:**
  - Azure CLI (az)
  - AWS CLI (aws)
  
- **Data Tools:**
  - DuckDB CLI - In-process SQL OLAP database
  - kafkacat - Generic command-line Kafka producer/consumer
  
- **Networking Tools:**
  - netcat, ping, traceroute, nmap, curl, etc.

### VSCode Extensions
- **Python & Jupyter:**
  - Python - Full Python language support
  - Pylance - Enhanced Python language server
  - Black Formatter - Code formatting
  - isort - Import sorting
  - Jupyter - Interactive notebook support
  - Jupyter Cell Tags, Slideshow, PowerToys - Enhanced notebook features
  - Jupyter Renderers - Additional renderers (Plotly, Vega, etc.)
  - Data Wrangler - Interactive pandas DataFrame cleaning
  
- **Databases:**
  - MongoDB for VS Code - MongoDB query and aggregation support
  - SQLTools - Universal SQL tool
  - SQLTools PostgreSQL Driver
  - SQLTools DuckDB Driver
  - Redis Client - Redis GUI client
  - Neo4j - Graph database support
  - SQLite - SQLite explorer and query runner
  - SQLite Viewer - SQLite database viewer
  
- **Data Formats:**
  - Rainbow CSV - CSV visualization with color columns
  - Edit CSV - Advanced CSV editor
  - Data Preview - Preview for CSV, JSON, Excel, Parquet
  - GraphViz Interactive Preview - Graph visualization
  
- **Azure Cloud:**
  - Azure Storage - Azure Storage explorer
  - Azure Functions - Azure Functions support
  
- **Productivity:**
  - GitHub Copilot - AI-powered code completion
  - GitHub Copilot Chat - AI-powered coding assistant
  - Python Environment Manager - Manage Python environments
  - Python Indent - Better indentation
  - AutoDocstring - Auto-generate docstrings
  - Python Test Adapter - Test explorer
  - YAML - YAML language support
  - Even Better TOML - TOML support
  - Draw.io - Create diagrams
  - Git Graph - Git visualization
  
- **Remote Development:**
  - Remote - Containers - Remote development in containers
  - Remote Extension Pack - Full remote development suite

## Using Kafka

Kafka scripts are available at `/opt/kafka/bin/`. Common commands:

```bash
# Start Zookeeper (in background or separate terminal)
/opt/kafka/bin/zookeeper-server-start.sh /opt/kafka/config/zookeeper.properties

# Start Kafka broker (in background or separate terminal)
/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties

# Create a topic
/opt/kafka/bin/kafka-topics.sh --create --topic test-topic --bootstrap-server localhost:9092

# List topics
/opt/kafka/bin/kafka-topics.sh --list --bootstrap-server localhost:9092

# Produce messages
/opt/kafka/bin/kafka-console-producer.sh --topic test-topic --bootstrap-server localhost:9092

# Consume messages
/opt/kafka/bin/kafka-console-consumer.sh --topic test-topic --from-beginning --bootstrap-server localhost:9092
```

## Working with PySpark

Example PySpark session:

```python
from pyspark.sql import SparkSession

# Create Spark session
spark = SparkSession.builder \
    .appName("Example") \
    .getOrCreate()

# Your PySpark code here
df = spark.createDataFrame([(1, "example")], ["id", "value"])
df.show()

# Stop Spark session when done
spark.stop()
```

## Using Docker

Docker is available for containerization and orchestration tasks:

```bash
# Check Docker version
docker --version
docker-compose --version

# Run a container
docker run hello-world

# Build an image
docker build -t myimage .

# Docker Compose
docker-compose up -d

# List running containers
docker ps

# View logs
docker logs <container_id>
```

## Using Ansible

Ansible is installed for infrastructure automation:

```bash
# Check Ansible version
ansible --version

# Run ad-hoc command
ansible localhost -m ping

# Run playbook
ansible-playbook playbook.yml

# Check syntax
ansible-playbook playbook.yml --syntax-check

# Dry run
ansible-playbook playbook.yml --check
```

Example Ansible playbook:
```yaml
---
- name: Simple playbook example
  hosts: localhost
  connection: local
  tasks:
    - name: Ensure directory exists
      file:
        path: /tmp/test
        state: directory
```

## Using Databases

### MongoDB
```bash
# Connect to MongoDB (if running locally or remotely)
mongosh "mongodb://localhost:27017"

# Import data
mongoimport --db mydb --collection mycollection --file data.json

# Restore from backup
mongorestore --db mydb /path/to/backup
```

### Redis
```bash
# Connect to Redis
redis-cli

# Basic commands
SET key value
GET key
```

### Neo4j
```bash
# Connect to Neo4j with Cypher Shell
cypher-shell -u neo4j -p password -a bolt://localhost:7687
```

### DuckDB
```bash
# Start DuckDB CLI
duckdb mydata.db

# Query Parquet files directly
SELECT * FROM 'data.parquet';
```

## Using Azure Services

The environment includes Azure SDK libraries for:
- **Blob Storage** - Store and retrieve large objects
- **Queue Storage** - Asynchronous message queueing
- **Event Hubs** - Big data streaming platform
- **Table Storage** - NoSQL key-value store
- **File Storage** - Managed file shares

Make sure to configure your Azure credentials as environment variables or in your code.

Example:
```python
from azure.storage.blob import BlobServiceClient

# Create connection
connection_string = "your_connection_string"
blob_service_client = BlobServiceClient.from_connection_string(connection_string)
```

## Jupyter Notebooks

The Jupyter extension is pre-installed. To use notebooks:
1. Create a new file with `.ipynb` extension
2. VSCode will automatically recognize it as a Jupyter notebook
3. Select the Python kernel when prompted
4. Start coding!

## Technical Notes

### Environment Configuration
- **Base OS:** Debian 12 (Bookworm) / Debian Trixie compatible
- **Python Package Manager:** UV (fast Python package installer)
- **Container Runtime:** Docker-in-Docker with `moby=false` for Debian Trixie compatibility

## Support

For issues with the course content, contact your instructor.
For issues with this environment, please open an issue in this repository.
