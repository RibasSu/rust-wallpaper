.PHONY: build install uninstall clean run dev test help

# Configurações
BINARY_NAME = rust-wallpaper
INSTALL_DIR = /usr/local/bin

# Comando padrão
help:
	@echo "🚀 Rust Wallpaper - Comandos disponíveis:"
	@echo ""
	@echo "  build      - Compilar para produção"
	@echo "  run        - Executar aplicação (desenvolvimento)"
	@echo "  dev        - Executar com reload automático"
	@echo "  test       - Executar testes"
	@echo "  install    - Instalar no sistema (requer sudo)"
	@echo "  uninstall  - Remover do sistema (requer sudo)"
	@echo "  clean      - Limpar arquivos de build"
	@echo "  help       - Mostrar esta ajuda"
	@echo ""

# Build para produção
build:
	@echo "🔧 Construindo para produção..."
	@chmod +x build.sh
	@./build.sh

# Executar localmente
run:
	@echo "🎮 Executando aplicação..."
	cargo run

# Desenvolvimento com reload automático (requer cargo-watch)
dev:
	@echo "🔄 Executando em modo desenvolvimento..."
	@if command -v cargo-watch >/dev/null 2>&1; then \
		cargo watch -x run; \
	else \
		echo "❌ cargo-watch não encontrado. Instale com: cargo install cargo-watch"; \
		echo "🎮 Executando normalmente..."; \
		cargo run; \
	fi

# Executar testes
test:
	@echo "🧪 Executando testes..."
	cargo test

# Instalar no sistema
install: build
	@echo "📦 Instalando no sistema..."
	@chmod +x install.sh
	@sudo ./install.sh

# Desinstalar do sistema
uninstall:
	@echo "🗑️  Removendo do sistema..."
	@chmod +x uninstall.sh
	@sudo ./uninstall.sh

# Limpar builds
clean:
	@echo "🧹 Limpando arquivos de build..."
	cargo clean

# Verificar se está instalado
status:
	@echo "📊 Status da instalação:"
	@if [ -f "$(INSTALL_DIR)/$(BINARY_NAME)" ]; then \
		echo "✅ Instalado em: $(INSTALL_DIR)/$(BINARY_NAME)"; \
		ls -lh $(INSTALL_DIR)/$(BINARY_NAME); \
	else \
		echo "❌ Não instalado"; \
	fi
	@echo ""
	@echo "📊 Status do serviço:"
	@if systemctl is-active --quiet rust-wallpaper.service 2>/dev/null; then \
		echo "✅ Serviço ativo"; \
	else \
		echo "❌ Serviço inativo"; \
	fi
