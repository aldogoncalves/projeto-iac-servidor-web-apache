# Projeto IaC - Provisionamento de Servidor Web Apache

![Linux](https://img.shields.io/badge/Linux-Ubuntu-orange)
![Bash](https://img.shields.io/badge/Script-Bash-green)
![Apache](https://img.shields.io/badge/Web%20Server-Apache-red)
![GitHub](https://img.shields.io/badge/Versionamento-GitHub-black)

## 📌 Sobre o projeto

Este projeto implementa um script Bash para automatizar o provisionamento de um servidor Web Apache utilizando o conceito de **Infraestrutura como Código (IaC)**.

O projeto foi desenvolvido como prática do desafio da DIO **"Infraestrutura como Código - Script de Provisionamento de um Servidor Web (Apache)"**.

A automação evita a necessidade de executar manualmente cada etapa de instalação e configuração do servidor.

## 🎯 Objetivos

O script automatiza:

- Atualização do sistema Linux;
- Instalação do Apache2;
- Instalação do `unzip`;
- Instalação do `wget`;
- Download da aplicação disponibilizada pela DIO;
- Descompactação da aplicação;
- Publicação dos arquivos em `/var/www/html`;
- Inicialização do Apache;
- Habilitação do Apache para iniciar automaticamente quando o ambiente suportar `systemd`;
- Verificação do funcionamento do serviço.

## 🛠️ Tecnologias utilizadas

- Ubuntu Linux
- WSL 2
- Bash
- Apache2
- Git
- GitHub
- Wget
- Unzip

## 📂 Estrutura do projeto

```text
projeto-iac-servidor-web-apache/
├── provisionar_web.sh
├── README.md
├── LICENSE
└── .gitignore
```

## 💻 Pré-requisitos

- Ubuntu Linux ou Ubuntu no WSL;
- Usuário com permissão `sudo`;
- Acesso à Internet;
- Git instalado, caso o projeto seja enviado pelo terminal.

> Observação: no WSL, o comportamento do `systemd` depende da configuração da distribuição. Por isso, o script possui uma verificação para iniciar o Apache também por meio do comando `service`.

## 🚀 Como executar

Clone o repositório:

```bash
git clone https://github.com/SEU-USUARIO/projeto-iac-servidor-web-apache.git
```

Entre no diretório:

```bash
cd projeto-iac-servidor-web-apache
```

Dê permissão de execução:

```bash
chmod +x provisionar_web.sh
```

Execute:

```bash
sudo ./provisionar_web.sh
```

## 🔎 Testando o servidor

Depois da execução, verifique o Apache:

```bash
pgrep -a apache2
```

Teste a página localmente:

```bash
curl http://localhost
```

Para descobrir o endereço IP:

```bash
hostname -I
```

Em uma instalação Ubuntu tradicional em uma VM, o endereço IP pode ser acessado de outro computador da rede.

No WSL, o acesso pelo navegador do próprio Windows normalmente pode ser testado com:

```text
http://localhost
```

## 📋 Etapas realizadas pelo script

```text
Atualizar pacotes
       ↓
Instalar Apache2
       ↓
Instalar unzip e wget
       ↓
Baixar aplicação
       ↓
Descompactar
       ↓
Copiar para /var/www/html
       ↓
Iniciar Apache
       ↓
Validar serviço
       ↓
Servidor Web disponível
```

## 📚 Conceito de IaC

Infraestrutura como Código (IaC) é a prática de gerenciar e provisionar infraestrutura por meio de código em vez de processos manuais.

Neste projeto, o arquivo `provisionar_web.sh` representa a automação das etapas necessárias para preparar o servidor Web.

## 👨‍💻 Autor

**Aldo Goncalves**

Projeto desenvolvido para fins de estudo e portfólio, como prática de Linux, Bash, Apache, automação e Infraestrutura como Código.

## 📄 Licença

Este projeto utiliza a licença MIT. Consulte o arquivo `LICENSE`.
