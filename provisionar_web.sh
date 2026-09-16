#!/bin/bash

# ============================================================
# Projeto IaC - Provisionamento de Servidor Web Apache
# Autor: Aldo Goncalves
# ============================================================

set -e

# Verifica se o script está sendo executado como root
if [ "$EUID" -ne 0 ]; then
    echo "ERRO: execute este script como root ou usando sudo."
    echo "Exemplo: sudo ./provisionar_web.sh"
    exit 1
fi

echo "============================================================"
echo " PROVISIONAMENTO AUTOMÁTICO DE SERVIDOR WEB"
echo " Apache2 - Infraestrutura como Código (IaC)"
echo "============================================================"

echo ""
echo ">>> [1/8] Atualizando lista de pacotes..."
apt-get update -y

echo ""
echo ">>> [2/8] Atualizando pacotes instalados..."
DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

echo ""
echo ">>> [3/8] Instalando Apache2..."
apt-get install -y apache2

echo ""
echo ">>> [4/8] Instalando unzip e wget..."
apt-get install -y unzip wget

echo ""
echo ">>> [5/8] Baixando aplicação da DIO..."
cd /tmp

rm -f main.zip
rm -rf linux-site-dio-main

wget -O main.zip \
    "https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip"

echo ""
echo ">>> [6/8] Descompactando aplicação..."
unzip -q -o main.zip

echo ""
echo ">>> [7/8] Publicando aplicação no Apache..."
rm -rf /var/www/html/*
cp -R linux-site-dio-main/* /var/www/html/

echo ""
echo ">>> [8/8] Iniciando e habilitando Apache..."

# Funciona em Ubuntu com systemd e também em ambientes WSL
if command -v systemctl >/dev/null 2>&1 && systemctl is-system-running >/dev/null 2>&1; then
    systemctl enable apache2
    systemctl restart apache2
else
    service apache2 restart
fi

echo ""
echo ">>> Verificando serviço Apache..."

if pgrep -x apache2 >/dev/null 2>&1; then
    echo "Apache2 está em execução."
else
    echo "ERRO: o Apache2 não está em execução."
    exit 1
fi

echo ""
echo "============================================================"
echo " PROVISIONAMENTO CONCLUÍDO COM SUCESSO!"
echo "============================================================"

echo ""
echo "Diretório da aplicação:"
echo "/var/www/html"

echo ""
echo "IP(s) detectado(s):"
hostname -I 2>/dev/null || true

echo ""
echo "Teste local:"
echo "curl http://localhost"

echo ""
echo "============================================================"
