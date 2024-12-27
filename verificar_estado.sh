#!/bin/bash

# Variáveis iniciais
SERVICO="nginx"
STATUS=$(systemctl is-active $SERVICO)
DATA_HORA=$(date "+%d-%m-%Y %H:%M:%S")

# Início da criação e ligação das variáveis e diretórios -----

# Diretório de validação que aponta um caminho o qual armazenará os arquivos de log do nginx
DIR_VALIDACAO="/var/log/stat_nginx"

# Variáveis onde ficarão os logs de estado do nginx
ARQUIVO_ONLINE="$DIR_VALIDACAO/online.log"
ARQUIVO_OFFLINE="$DIR_VALIDACAO/offline.log"

# Cria o diretório de validação automaticamente
mkdir -p $DIR_VALIDACAO

# Fim da criação e ligação das variáveis e diretórios -----

# Valida o status do nginx
if [ "$STATUS" = "active" ]; then
    echo "$DATA_HORA | Serviço: $SERVICO | Status: ONLINE | Mensagem: O serviço está on-line." >> $ARQUIVO_ONLINE
else
    echo "$DATA_HORA | Serviço: $SERVICO | Status: OFFLINE | Mensagem: O serviço está off-line." >> $ARQUIVO_OFFLINE
