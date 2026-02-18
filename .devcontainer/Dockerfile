FROM mcr.microsoft.com/devcontainers/python:3.11-bookworm

# Install base OS packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    gnupg2 zip unzip \
    openssl \
    cron \
    apt-transport-https ca-certificates \
    g++ unixodbc unixodbc-dev \
    vim nano procps default-jre default-jdk scala jq libxss1 xvfb \
    python3-pip python3-dev pkg-config \
    libsasl2-dev python-dev-is-python3 libldap2-dev libssl-dev ldap-utils \
    graphviz libgraphviz-dev \
    netcat-traditional iputils-ping iputils-tracepath net-tools traceroute nmap \
    nodejs npm \
    wget curl \
    sshpass \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Ansible
RUN apt-get update \
    && apt-get install -y ansible \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set JAVA_HOME using the default-java symlink
ENV JAVA_HOME=/usr/lib/jvm/default-java
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Install MongoDB tools and shell
RUN curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | gpg --dearmor -o /usr/share/keyrings/mongodb-server-7.0.gpg \
    && echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/debian bookworm/mongodb-org/7.0 main" | tee /etc/apt/sources.list.d/mongodb-org-7.0.list \
    && apt-get update \
    && apt-get install -y mongodb-database-tools mongodb-mongosh \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Redis tools
RUN apt-get update \
    && apt-get install -y redis-tools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install kafkacat (now called kcat)
RUN apt-get update \
    && apt-get install -y kafkacat \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Neo4j Cypher Shell
RUN wget -O cypher-shell.deb https://dist.neo4j.org/cypher-shell/cypher-shell_5.14.0_all.deb \
    && dpkg -i cypher-shell.deb || apt-get install -f -y \
    && rm cypher-shell.deb

# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install AWS CLI
RUN apt-get update \
    && apt-get install -y awscli \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install DuckDB CLI
RUN wget https://github.com/duckdb/duckdb/releases/download/v0.10.0/duckdb_cli-linux-amd64.zip \
    && unzip duckdb_cli-linux-amd64.zip -d /usr/local/bin/ \
    && rm duckdb_cli-linux-amd64.zip \
    && chmod +x /usr/local/bin/duckdb

# Install MSSQL ODBC Driver
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg \
    && curl https://packages.microsoft.com/config/debian/12/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update \
    && ACCEPT_EULA=Y apt-get install -y msodbcsql18 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Kafka
ARG KAFKA_VERSION=3.6.1
ARG SCALA_VERSION=2.13
RUN wget -q https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
    && tar -xzf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
    && mv kafka_${SCALA_VERSION}-${KAFKA_VERSION} /opt/kafka \
    && rm kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

# Set Kafka environment variables
ENV PATH="/opt/kafka/bin:${PATH}"

# Install uv for Python package management
RUN curl -LsSf https://astral.sh/uv/install.sh | sh && \
    mv /root/.local/bin/uv /usr/local/bin/uv

# Copy pyproject.toml and install Python packages using uv
COPY pyproject.toml /tmp/uv-tmp/
WORKDIR /tmp/uv-tmp
RUN uv pip install --system --no-cache \
    pyspark \
    fastavro \
    Faker \
    pydicom \
    pyzmq \
    azure-storage-queue \
    confluent-kafka \
    azure-eventhub \
    azure-storage-blob \
    azure-data-tables \
    azure-storage-file-share \
    azure-storage-file \
    pandas \
    numpy \
    scipy \
    pyarrow \
    kafka-python \
    polars \
    matplotlib \
    plotly \
    Pillow \
    scikit-learn \
    scikit-image \
    schwifty \
    pymilvus \
    'milvus[client]' \
    redis \
    pymongo \
    networkx \
    pygraphviz \
    nxviz \
    neo4j \
    dnspython \
    cqlsh \
    && rm -rf /tmp/uv-tmp

WORKDIR /workspaces
