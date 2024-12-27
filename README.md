# Atividade Prática 1 | Linux | DevSecOps | Compass UOL

Primeira atividade prática da trilha de DevSecOps do programa de bolsas da Compass UOL

</br>

## Requisitos:
<li> Windows 11 </li>
<li> WSL (Windows Subsystem for Linux)
<li> Ubuntu 20.04

</br>

## Objetivos:
<li> Subir um servidor Nginx;
<li> Criar um script que valide se o serviço está on-line ou off-line e que envie o resultado da validação para um diretório; </li>
<li> O script deve conter data e hora + nome do serviço + status + mensagem personalizada de on-line ou off-line; </li>
<li> O script deve gerar 2 arquivos de saída: 1 para o serviço on-line e 1 para o serviço off-line; </li>
<li> Preparar a execução automatizada do script para a cada 5 minutos. </li>

</br>

## Índice:
1. Ativação do WSL
2. Instalação do Ubuntu 20.04
3. Instalação do Nginx
4. Criação e Configuração do Script
5. Automatização do Script

</br>

### 1. Ativação do WSL
**1.1** Na barra de pesquisar do Windows procure por "Painel de Controle"; </br>
**1.2** Clique na categoria "Programas" e depois em "Ativar ou desativar recursos do Windows"; </br>
**1.3** Marque as opções "Hyper-V" e "Subsistema do Windows para Linux"; </br>
**1.4** Reinicie seu computador. </br>

</br>

### 2. Instalação do Ubuntu 20.04
**2.1** Entre no aplicativo Microsoft Store e pesquise por "Ubuntu 20.04"; </br>
**2.2** Selecione a versão mais atualizada e clique em adquirir; </br>
**2.3** Após a instalação, abra o Ubuntu 20.04 e aguarde sua instalação interna; </br>
**2.4** Defina seu nome e senha de usuário.</br>

</br>

### 3. Instalação e Configuração do Nginx
**3.1** Antes de iniciar a instalação do Nginx, atualize os pacotes pelo comando:

``` bash
sudo apt update && sudo apt upgrade

```

**3.2** Para instalar o Nginx digite:

``` bash
sudo apt install nginx

```

**3.3** Para checar se o Nginx já está ativo, digite "sudo systemctl status nginx"; </br>

![Captura de tela 2024-12-27 002539](https://github.com/user-attachments/assets/9e421a45-1469-4bb5-8469-3e3d33bc841c)

**3.4** Caso não esteja ativo, ative-o pelo comando:

``` bash
sudo systemctl start nginx

```

**3.5** Verifique também se o servidor web do Nginx está ativo digitando "localhost" em seu navegador:

![Captura de tela 2024-12-27 013012](https://github.com/user-attachments/assets/2bd9b99e-c1e6-4a03-8a45-3fbb49b763ae)

</br>

### 4. Criação e Configuração do Script

**4.1** Crie o script com o editor de texto Nano pelo comando "nano verificar_estado.sh"; </br>
**4.2** Edite o conteúdo do script:

![Captura de tela 2024-12-27 011121](https://github.com/user-attachments/assets/136bc005-5e4e-41d5-8188-4c4e6e43a7fd)

**4.3** Ao finalizar, salve o conteúdo com <mark>**CTRL + O**</mark> e aperte em <mark>**ENTER**</mark>; </br>
**4.4** Saia do editor de texto com <mark>**CTRL + X**</mark>.</br>
**4.5** Dê permissão de execução para o seu script digitando:

``` bash
sudo chmod +x verificar_estado.sh

```

**4.6** Rode seu script pelo seguinte comando:

``` bash
sudo ./verificar_estado.sh

```

**4.7** Para verificar se o script foi executado corretamente navegue até o diretório **/var/log/stat_nginx** e digite:

``` bash
cat online.log
```

**4.8** Confirme se a saída do log on-line está correta:

![Captura de tela 2024-12-27 011012](https://github.com/user-attachments/assets/01be52c9-dd18-48eb-85d6-2f169756d736)

**4.9** Para gerar o arquivo do log off-line, pare o nginx com o comando "sudo systemctl stop nginx" e digite:

``` bash
cat offline.log
```

</br>

## 5. Automatização do Script

**5.1** Crie uma nova tarefa de automatização no Crontab utilizando o comando:

``` bash
sudo crontab -e
```

**5.2** 
**5.3** Crie o script com o editor de texto Nano pelo comando "nano verificar_estado.sh"; </br>
**5.4** Edite o conteúdo do script:






