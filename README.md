# Rust Wallpaper - Animação de Partículas 3D

Esta é uma aplicação web em Rust que serve uma animação de partículas 3D criada com HTML5 Canvas e JavaScript. É uma reimplementação em Rust da aplicação Node.js original com **arquivos estáticos embarcados no executável**.

## ✨ Funcionalidades

- 🚀 Servidor web standalone (sem dependências externas)
- 🎨 Animação de partículas 3D projetadas em canvas 2D
- 🌈 Efeitos visuais com mudança de cores em ciclo
- 📱 Interface responsiva que se adapta ao tamanho da janela
- 📦 Executável único com todos os arquivos inclusos
- ⚙️ Instalação como serviço do sistema

## 🔧 Pré-requisitos

- Rust 1.70 ou superior
- Cargo (gerenciador de pacotes do Rust)

## 🚀 Instalação Rápida

### Opção 1: Usando Make (recomendado)
```bash
# Ver comandos disponíveis
make help

# Compilar e instalar no sistema
make install

# Verificar status
make status
```

### Opção 2: Scripts manuais
```bash
# Build para produção
./build.sh

# Instalar no sistema (requer sudo)
sudo ./install.sh
```

## 🎮 Uso

### Desenvolvimento
```bash
# Executar localmente
make run
# ou
cargo run

# Desenvolvimento com reload automático
make dev
```

### Produção (após instalação)
```bash
# Executar diretamente
rust-wallpaper

# Ou como serviço do sistema
sudo systemctl start rust-wallpaper.service
sudo systemctl enable rust-wallpaper.service  # Iniciar automaticamente
```

## 📊 Gerenciamento do Serviço

```bash
# Comandos do systemd
sudo systemctl start rust-wallpaper      # Iniciar
sudo systemctl stop rust-wallpaper       # Parar
sudo systemctl status rust-wallpaper     # Status
sudo systemctl enable rust-wallpaper     # Habilitar na inicialização
sudo systemctl disable rust-wallpaper    # Desabilitar na inicialização

# Ver logs em tempo real
sudo journalctl -u rust-wallpaper -f

# Verificar se está rodando
make status
```

## 🗂️ Estrutura do Projeto

```
rust-wallpaper/
├── Cargo.toml          # Configuração do projeto Rust
├── Makefile            # Comandos de automação
├── build.sh            # Script de build para produção
├── install.sh          # Script de instalação
├── uninstall.sh        # Script de desinstalação
├── src/
│   └── main.rs         # Código principal (com arquivos embarcados)
├── static/             # Arquivos estáticos (inclusos no binário)
│   ├── index.html      # Página principal
│   ├── script.js       # Lógica da animação de partículas
│   └── style.css       # Estilos CSS
└── README.md           # Este arquivo
```

## 🔧 Configuração

A aplicação aceita as seguintes variáveis de ambiente:

- `PORT`: Porta do servidor (padrão: 3050)
- `RUST_LOG`: Nível de log (padrão: info)

```bash
# Exemplo
PORT=8080 RUST_LOG=debug rust-wallpaper
```

## 📦 Build Otimizado

O build de produção inclui otimizações avançadas:
- Link-time optimization (LTO)
- Strip de símbolos de debug
- Otimização de tamanho
- Arquivos estáticos embarcados

## 🗑️ Desinstalação

```bash
# Usando Make
make uninstall

# Ou script manual
sudo ./uninstall.sh
```

## 🌐 Acesso

Depois de instalado e rodando, acesse:
- **Local**: http://localhost:3050
- **Rede**: http://[seu-ip]:3050

## 💡 Dicas

- Use como wallpaper abrindo no navegador em tela cheia (F11)
- Configure como serviço para iniciar automaticamente
- Monitore com `htop` - consome poucos recursos
- Logs ficam disponíveis via `journalctl`

## 🆚 Diferenças da Versão Node.js

- ✅ Executável único e standalone
- ✅ Melhor performance e menor uso de memória
- ✅ Compilação para binário nativo otimizado
- ✅ Instalação como software do sistema
- ✅ Gerenciamento via systemd
- ✅ Sem dependências runtime (Node.js, npm, etc.)

## 📜 Licença

Este projeto é de código aberto e está disponível sob a licença MIT.
