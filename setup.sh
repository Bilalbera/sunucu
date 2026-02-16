#!/bin/bash

# Renk tanımlamaları
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # Renk sıfırlama

echo -e "${BLUE}==============================================${NC}"
echo -e "${GREEN}   MINECRAFT SUNUCUSU BAŞLATILIYOR...       ${NC}"
echo -e "${BLUE}==============================================${NC}"

# Sunucu dosyası kontrolü
if [ ! -f "server.jar" ]; then
    echo -e "${YELLOW}Sunucu dosyaları eksik, indiriliyor...${NC}"
    wget https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/493/downloads/paper-1.20.4-493.jar -O server.jar
    echo "eula=true" > eula.txt
fi

# IP Adresini alma ve yazdırma (GitHub Codespaces için)
# Bu kısım port yönlendirmesi aktif olduktan sonra çalışır
codespace_name=$CODESPACE_NAME
echo -e "${YELLOW}----------------------------------------------${NC}"
echo -e "${GREEN}SUNUCU IP ADRESİNİZ (KOPYALAYIN):${NC}"
echo -e "${BLUE}${codespace_name}-25565.preview.app.github.dev${NC}"
echo -e "${YELLOW}----------------------------------------------${NC}"
echo -e "Not: Eğer yukarıdaki IP çalışmazsa 'Ports' kısmındaki linki kullanın."
echo -e "${YELLOW}----------------------------------------------${NC}"

# Sunucuyu 16GB RAM ile başlat
java -Xmx16G -Xms16G -jar server.jar --nogui
