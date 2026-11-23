#!/bin/sh
# Copia o JavaScript de dentro do index.html para graphify-src/app.js, mantendo os mesmos números de linha
# (linhas fora de <script> viram linhas vazias), e atualiza o mapa do graphify. Uso: sh graphify-extrair.sh
cd "$(dirname "$0")" && mkdir -p graphify-src && awk '
  /<\/script>/ { dentro=0 }
  { print (dentro ? $0 : "") }
  /<script[^>]*>/ && !/src=/ { dentro=1 }
' index.html > graphify-src/app.js && graphify update .
