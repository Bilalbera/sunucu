#!/bin/bash
if [ ! -f "server.jar" ]; then
    echo "Sunucu dosyaları indiriliyor..."
    wget https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/493/downloads/paper-1.20.4-493.jar -O server.jar
    echo "eula=true" > eula.txt
fi
echo "Sunucu 16GB RAM ile başlatılıyor..."
java -Xmx16G -Xms16G -jar server.jar --nogui
