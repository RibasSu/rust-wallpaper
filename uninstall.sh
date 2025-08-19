#!/bin/bash

# Script de desinstalação do Rust Wallpaper
set -e

BINARY_NAME="rust-wallpaper"
INSTALL_DIR="/usr/local/bin"
SERVICE_DIR="/etc/systemd/system"
SERVICE_NAME="rust-wallpaper.service"

echo "🗑️  Desinstalando Rust Wallpaper..."

# Verificar se precisa ser executado como root
if [ "$EUID" -ne 0 ]; then
    echo "❌ Este script precisa ser executado como root (sudo)"
    exit 1
fi

# Parar e desabilitar o serviço se estiver rodando
if systemctl is-active --quiet "$SERVICE_NAME" 2>/dev/null; then
    echo "⏹️  Parando serviço..."
    systemctl stop "$SERVICE_NAME"
fi

if systemctl is-enabled --quiet "$SERVICE_NAME" 2>/dev/null; then
    echo "🚫 Desabilitando serviço..."
    systemctl disable "$SERVICE_NAME"
fi

# Remover arquivo de serviço
if [ -f "$SERVICE_DIR/$SERVICE_NAME" ]; then
    echo "🗂️  Removendo arquivo de serviço..."
    rm "$SERVICE_DIR/$SERVICE_NAME"
    systemctl daemon-reload
fi

# Remover binário
if [ -f "$INSTALL_DIR/$BINARY_NAME" ]; then
    echo "📦 Removendo binário..."
    rm "$INSTALL_DIR/$BINARY_NAME"
fi

echo "✅ Desinstalação concluída!"
echo "🧹 Rust Wallpaper foi completamente removido do sistema."
