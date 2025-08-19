#!/bin/bash

# Script de build para produção do Rust Wallpaper
set -e

echo "🔧 Construindo Rust Wallpaper para produção..."

# Limpar builds anteriores
echo "🧹 Limpando builds anteriores..."
cargo clean

# Build otimizado para produção
echo "🚀 Compilando para produção..."
cargo build --release

# Verificar se o build foi bem-sucedido
if [ -f "target/release/rust-wallpaper" ]; then
    echo "✅ Build concluído com sucesso!"
    echo "📦 Executável criado: target/release/rust-wallpaper"
    
    # Mostrar informações do binário
    echo "📊 Informações do binário:"
    ls -lh target/release/rust-wallpaper
    
    echo ""
    echo "🎯 Para instalar no sistema, execute:"
    echo "   sudo ./install.sh"
    echo ""
    echo "🎮 Para testar localmente:"
    echo "   ./target/release/rust-wallpaper"
else
    echo "❌ Erro no build!"
    exit 1
fi
