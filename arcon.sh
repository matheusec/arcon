#!/bin/bash

clear

echo ""
echo ""
echo "        █                                      "
echo "       ███    ▄▄▄ ▄▄    ▄▄▄▄    ▄▄▄   ▄▄ ▄▄▄   "
echo "      █  ██    ██▀ ▀▀ ▄█   ▀▀ ▄█  ▀█▄  ██  ██  "
echo "     ▄▀▀▀▀█▄   ██     ██      ██   ██  ██  ██  "
echo "    ▄█▄  ▄██▄ ▄██▄     ▀█▄▄▄▀  ▀█▄▄█▀ ▄██▄ ██▄ "
echo "                                           "                                           
echo ""
echo ""


echo "               Bem-vindo ao Arcon"
echo "           Script criado por Matheus M."
echo ""
echo ""
echo ">> Digite o domínio da máquina: "
read DOMINIO
echo ""

echo "  [+] Criando diretório para o domínio $DOMINIO"
mkdir "Arcon-$DOMINIO"
cd "Arcon-$DOMINIO"


echo "  [+] Enviando pacotes ICMP para a máquina..."
ping -c 4 $DOMINIO > resultado-icmp.txt


echo "  [+] Buscando por portas abertas e identificando versão do serviço de cada uma..."
nmap -sV $DOMINIO > resultado-portas.txt


echo "  [+] Reconhecendo firewall da aplicação web (caso tenha)..."
wafw00f $DOMINIO > resultado-waf.txt


echo "  [+] Identificando tecnologias utilizadas na aplicação..."
whatweb $DOMINIO > resultado-tecnologias.txt


echo "  [+] Coletando dados públicos do domínio..."
whois $DOMINIO > resultado-dominio.txt

echo ""
echo "Acesse o diretório do domínio criado pelo Arcon para ver os resultados."
echo "Arcon - Since 2022"
