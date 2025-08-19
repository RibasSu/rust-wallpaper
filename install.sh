#!/bin/bash

# Script de instalação do Rust Wallpaper
set -e

BINARY_NAME="rust-wallpaper"
INSTALL_DIR="/usr/local/bin"
SERVICE_DIR="/etc/systemd/system"
SERVICE_NAME="rust-wallpaper.service"

echo "🚀 Instalando Rust Wallpaper..."

# Verificar se precisa ser executado como root
if [ "$EUID" -ne 0 ]; then
    echo "❌ Este script precisa ser executado como root (sudo)"
    exit 1
fi

# Verificar se o binário existe
if [ ! -f "target/release/$BINARY_NAME" ]; then
    echo "❌ Binário não encontrado! Execute './build.sh' primeiro."
    exit 1
fi

# Copiar binário para /usr/local/bin
echo "📦 Instalando binário em $INSTALL_DIR..."
cp "target/release/$BINARY_NAME" "$INSTALL_DIR/"
chmod +x "$INSTALL_DIR/$BINARY_NAME"

# Criar arquivo de serviço systemd
echo "⚙️  Criando serviço systemd..."
cat > "$SERVICE_DIR/$SERVICE_NAME" << EOF
[Unit]
Description=Rust Wallpaper - Animação de Partículas 3D
After=network.target

[Service]
Type=simple
User=nobody
ExecStart=$INSTALL_DIR/$BINARY_NAME
Restart=always
RestartSec=10
Environment=PORT=56901
Environment=RUST_LOG=info

[Install]
WantedBy=multi-user.target
EOF

# Recarregar systemd
systemctl daemon-reload

echo "✅ Instalação concluída!"
echo ""
echo "🎮 Comandos disponíveis:"
echo "  Executar manualmente:     $BINARY_NAME"
echo "  Iniciar serviço:          sudo systemctl start $SERVICE_NAME"
echo "  Parar serviço:            sudo systemctl stop $SERVICE_NAME"
echo "  Status do serviço:        sudo systemctl status $SERVICE_NAME"
echo "  Habilitar na inicialização: sudo systemctl enable $SERVICE_NAME"
echo "  Desabilitar na inicialização: sudo systemctl disable $SERVICE_NAME"
echo "  Ver logs:                 sudo journalctl -u $SERVICE_NAME -f"
echo ""
echo "🌐 Acesse http://localhost:56901 quando estiver rodando"
