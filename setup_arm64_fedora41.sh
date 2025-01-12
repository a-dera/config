#!/bin/bash

# Mise à jour des dépôts et des paquets existants
sudo dnf update -y
sudo dnf upgrade -y

# Installer les outils système de base
sudo dnf install -y git curl wget vim nano python3 python3-pip unzip htop gparted sqlite3 openssl

# Configuration de Docker
echo "Installation de Docker..."
sudo dnf config-manager --add-repo=https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker
sudo systemctl start docker

# Installer Node.js (dernière version LTS) et Yarn
echo "Installation de Node.js et Yarn..."
curl -fsSL https://rpm.nodesource.com/setup_lts.x | sudo bash -
sudo dnf install -y nodejs
npm install -g yarn

# Installer Anaconda (via Miniforge pour ARM64)
echo "Installation de Miniforge (équivalent Anaconda)..."
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh -O Miniforge3.sh
bash Miniforge3.sh -b -p $HOME/miniforge3
export PATH="$HOME/miniforge3/bin:$PATH"
conda init bash

# Installer PostgreSQL
echo "Installation de PostgreSQL..."
sudo dnf install -y postgresql postgresql-server postgresql-contrib
sudo postgresql-setup --initdb --unit postgresql
sudo systemctl enable postgresql
sudo systemctl start postgresql

# Installer MongoDB
echo "Installation de MongoDB..."
sudo tee /etc/yum.repos.d/mongodb-org-6.0.repo <<EOF
[mongodb-org-6.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/\$releasever/mongodb-org/6.0/aarch64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-6.0.asc
EOF
sudo dnf install -y mongodb-org
sudo systemctl enable mongod
sudo systemctl start mongod

# Installer Prometheus
echo "Installation de Prometheus..."
sudo useradd -M -s /sbin/nologin prometheus
sudo mkdir /etc/prometheus /var/lib/prometheus
wget https://github.com/prometheus/prometheus/releases/latest/download/prometheus-linux-arm64.tar.gz
tar -xvf prometheus-linux-arm64.tar.gz
sudo mv prometheus-*/prometheus /usr/local/bin/
sudo mv prometheus-*/promtool /usr/local/bin/
sudo mv prometheus-*/consoles /etc/prometheus/
sudo mv prometheus-*/console_libraries /etc/prometheus/
sudo mv prometheus-*/prometheus.yml /etc/prometheus/

# Installer Grafana
echo "Installation de Grafana..."
sudo tee /etc/yum.repos.d/grafana.repo <<EOF
[grafana]
name=Grafana OSS
baseurl=https://rpm.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://rpm.grafana.com/gpg.key
EOF
sudo dnf install -y grafana
sudo systemctl enable grafana-server
sudo systemctl start grafana-server

# Installer Python et les bibliothèques nécessaires
echo "Installation des bibliothèques Python..."
pip3 install --upgrade pip
pip3 install numpy pandas matplotlib seaborn scikit-learn tensorflow keras jupyter notebook

# Installer Flutter
echo "Installation de Flutter..."
git clone https://github.com/flutter/flutter.git -b stable $HOME/flutter
export PATH="$PATH:$HOME/flutter/bin"
flutter doctor

# Installer RStudio (via Posit Workbench)
echo "Installation de RStudio..."
wget https://download1.rstudio.org/desktop/arm64/rstudio-2023.06.0-arm64.rpm -O rstudio.rpm
sudo dnf install -y rstudio.rpm

# Installer KNIME (alternative à RapidMiner)
echo "Installation de KNIME Analytics Platform..."
wget https://download.knime.org/analytics-platform/linux/knime-latest-linux.gtk.x86_64.tar.gz
tar -xvzf knime-latest-linux.gtk.x86_64.tar.gz -C $HOME

# Installer Discord
echo "Installation de Discord..."
wget https://discord.com/api/download/canary?platform=linux&format=tar.gz -O discord.tar.gz
tar -xvzf discord.tar.gz -C $HOME
sudo ln -s $HOME/Discord/Discord /usr/local/bin/discord

# Installer Obsidian
echo "Installation d'Obsidian..."
wget https://github.com/obsidianmd/obsidian-releases/releases/download/latest/Obsidian-arm64.AppImage -O obsidian.AppImage
chmod +x obsidian.AppImage
sudo mv obsidian.AppImage /usr/local/bin/obsidian

# Installer Zotero (version ARM64 via Flatpak)
echo "Installation de Zotero..."
flatpak install -y flathub org.zotero.Zotero

# Installer Telegram
echo "Installation de Telegram..."
flatpak install -y flathub org.telegram.desktop

#  Super Productivity
flatpak install -y flathub com.superproductivity.superproductivity

# Installer Go
echo "Installation de Go..."
wget https://go.dev/dl/go1.21.1.linux-arm64.tar.gz
sudo tar -C /usr/local -xzf go1.21.1.linux-arm64.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
source ~/.bashrc

# Installer Apache Spark
echo "Installation de Apache Spark..."
wget https://downloads.apache.org/spark/spark-3.5.0/spark-3.5.0-bin-hadoop3.tgz
sudo tar -xvzf spark-3.5.0-bin-hadoop3.tgz -C /opt/
sudo ln -s /opt/spark-3.5.0-bin-hadoop3 /opt/spark
echo "export PATH=\$PATH:/opt/spark/bin" >> ~/.bashrc
source ~/.bashrc

# Installer Hadoop
echo "Installation de Hadoop..."
wget https://downloads.apache.org/hadoop/common/hadoop-3.3.6/hadoop-3.3.6.tar.gz
sudo tar -xvzf hadoop-3.3.6.tar.gz -C /opt/
sudo ln -s /opt/hadoop-3.3.6 /opt/hadoop
echo "export PATH=\$PATH:/opt/hadoop/bin" >> ~/.bashrc
source ~/.bashrc

# Installer Kafka
echo "Installation de Kafka..."
wget https://downloads.apache.org/kafka/3.5.1/kafka_2.13-3.5.1.tgz
sudo tar -xvzf kafka_2.13-3.5.1.tgz -C /opt/
sudo ln -s /opt/kafka_2.13-3.5.1 /opt/kafka
echo "export PATH=\$PATH:/opt/kafka/bin" >> ~/.bashrc
source ~/.bashrc

# Installer Hive
echo "Installation de Hive..."
wget https://downloads.apache.org/hive/hive-3.1.3/apache-hive-3.1.3-bin.tar.gz
sudo tar -xvzf apache-hive-3.1.3-bin.tar.gz -C /opt/
sudo ln -s /opt/apache-hive-3.1.3-bin /opt/hive
echo "export PATH=\$PATH:/opt/hive/bin" >> ~/.bashrc
source ~/.bashrc

# Installer Presto
echo "Installation de Presto..."
wget https://repo1.maven.org/maven2/io/prestosql/presto-server/359/presto-server-359.tar.gz
sudo tar -xvzf presto-server-359.tar.gz -C /opt/
sudo ln -s /opt/presto-server-359 /opt/presto
echo "export PATH=\$PATH:/opt/presto/bin" >> ~/.bashrc
source ~/.bashrc

# Installer Elasticsearch
echo "Installation de Elasticsearch..."
sudo dnf install -y java-11-openjdk
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.10.1-linux-aarch64.tar.gz
sudo tar -xvzf elasticsearch-8.10.1-linux-aarch64.tar.gz -C /opt/
sudo ln -s /opt/elasticsearch-8.10.1 /opt/elasticsearch
echo "export PATH=\$PATH:/opt/elasticsearch/bin" >> ~/.bashrc
source ~/.bashrc

# Installer Apache JMeter
echo "Installation de Apache JMeter..."
wget https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.6.2.tgz
sudo tar -xvzf apache-jmeter-5.6.2.tgz -C /opt/
sudo ln -s /opt/apache-jmeter-5.6.2 /opt/jmeter
echo "export PATH=\$PATH:/opt/jmeter/bin" >> ~/.bashrc
source ~/.bashrc

# Installer Sentry CLI
echo "Installation de Sentry CLI..."
curl -sL https://sentry.io/get-cli/ | bash

# Installer New Relic CLI
echo "Installation de New Relic CLI..."
curl -Ls https://download.newrelic.com/install/newrelic-cli/scripts/install.sh | bash

# Installer Logstash
echo "Installation de Logstash..."
wget https://artifacts.elastic.co/downloads/logstash/logstash-8.10.1-linux-aarch64.tar.gz
sudo tar -xvzf logstash-8.10.1-linux-aarch64.tar.gz -C /opt/
sudo ln -s /opt/logstash-8.10.1 /opt/logstash
echo "export PATH=\$PATH:/opt/logstash/bin" >> ~/.bashrc
source ~/.bashrc

# Installer Zen Browser (via Flatpak si disponible)
echo "Installation de Zen Browser..."
flatpak install -y flathub org.zen.browser

# Outils CLI et Divers
echo "Installation de l'AWS CLI..."
pip3 install awscli
pip install --user glances[all]
sudo dnf install clamav
sudo dnf install nmap

# Nettoyage des fichiers temporaires
echo "Nettoyage des fichiers temporaires..."
rm -rf *.tar.gz *.tgz *.tar installer.sh

# Mise à jour du PATH et rechargement
echo "Rechargement des variables d'environnement..."
source ~/.bashrc

echo "Installation terminée ! Redémarrez votre terminal pour que toutes les modifications prennent effet."
