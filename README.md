# Atividade Prática 1 | Linux | Compass UOL

[![My Skills](https://skillicons.dev/icons?i=linux,ubuntu,windows)](https://skillicons.dev)

</br>

## Requisitos:
- Windows 11
- WSL (Windows Subsystem for Linux)
- Ubuntu 20.04

</br>

## Objetivos:
- Subir um servidor Nginx;
- Criar um script que valide se o serviço está on-line ou off-line e envie o resultado da validação para um diretório;
- O script deve conter data e hora + nome do serviço + status + mensagem personalizada de on-line ou off-line;
- O script deve gerar 2 arquivos de saída: 1 para o serviço on-line e 1 para o serviço off-line;
- Preparar a execução automatizada do script para a cada 5 minutos.

</br>

## Índice:
1. [Ativação do WSL](#1-ativação-do-wsl)
2. [Instalação do Ubuntu](#2-instalação-do-ubuntu)
3. [Instalação do Nginx](#3-instalação-do-nginx)
5. [Criação e Configuração do Script](#4-criação-e-configuração-do-script)
6. [Automatização do Script](#5-automatização-do-script)

</br>

## 1. Ativação do WSL
**1.1** Na barra de pesquisar do Windows procure por "Painel de Controle"; </br>
**1.2** Clique na categoria "Programas" e depois em "Ativar ou desativar recursos do Windows"; </br>
**1.3** Marque as opções "Hyper-V" e "Subsistema do Windows para Linux"; </br>
**1.4** Reinicie seu computador. </br>

</br>

## 2. Instalação do Ubuntu
**2.1** Entre no aplicativo Microsoft Store e pesquise por "Ubuntu 20.04"; </br>
**2.2** Selecione a versão mais atualizada e clique em adquirir; </br>
**2.3** Após a instalação, abra o Ubuntu 20.04 e aguarde sua instalação interna; </br>
**2.4** Defina seu nome e senha de usuário. </br>

</br>

## 3. Instalação do Nginx
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

## 4. Criação e Configuração do Script

**4.1** Crie o script com o editor de texto Nano pelo comando "nano verificar_estado.sh"; </br>
**4.2** Edite o conteúdo do script:

![Captura de tela 2024-12-27 011121](https://github.com/user-attachments/assets/136bc005-5e4e-41d5-8188-4c4e6e43a7fd)

**4.3** Ao finalizar, salve o conteúdo com <mark>**CTRL + O**</mark> e aperte em <mark>**ENTER**</mark>; </br>
**4.4** Saia do editor de texto com <mark>**CTRL + X**</mark>. </br>
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

**5.2** Caso ele peça para selecionar um editor de texto, selecione o Nano (mais amigável); </br>
**5.3** Adicione uma nova linha contendo o seguinte conteúdo:

![image](https://github.com/user-attachments/assets/67ceb498-13e4-4ec2-b9cb-4257a23be7ca)

**Estrutura do Crontab:**

``` bash
* * * * * caminho/do/script/aqui
| | | | |  
| | | | +--- Dia da semana (0 - 7) (Domingo = 0 ou 7)
| | | +----- Mês (1 - 12)
| | +------- Dia do mês (1 - 31)
| +--------- Hora (0 - 23)
+----------- Minuto (0 - 59)
```

**5.4** Dessa forma, o Crontab irá executar a verificação do serviço Nginx de 5 em 5 minutos:

- On-line:

![image](https://github.com/user-attachments/assets/78f21416-c3ca-45c6-91d4-fc01d2dab512)

- Off-line:

![image](https://github.com/user-attachments/assets/6d0d1581-8edd-4f98-a045-5371654f99ff)






