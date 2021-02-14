#!/bin/bash

if [[ $EULA == 'true' ]]; then
  echo "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula)." > eula.txt
  echo "#$(date +'%a %b %d %H:%M:%S %Z %Y')" >> eula.txt
  echo "eula=true" >> eula.txt
fi

exec java -Xmx"${RAM_MAX}" \
          -Xms"${RAM_MIN}" \
          -XX:+UseG1GC \
          -XX:+ParallelRefProcEnabled \
          -XX:MaxGCPauseMillis=200 \
          -XX:+UnlockExperimentalVMOptions \
          -XX:+DisableExplicitGC \
          -XX:-OmitStackTraceInFastThrow \
          -XX:+AlwaysPreTouch \
          -XX:G1NewSizePercent=30 \
          -XX:G1MaxNewSizePercent=40 \
          -XX:G1HeapRegionSize=8M \
          -XX:G1ReservePercent=20 \
          -XX:G1HeapWastePercent=5 \
          -XX:G1MixedGCCountTarget=8 \
          -XX:InitiatingHeapOccupancyPercent=15 \
          -XX:G1MixedGCLiveThresholdPercent=90 \
          -XX:G1RSetUpdatingPauseTimePercent=5 \
          -XX:SurvivorRatio=32 \
          -XX:MaxTenuringThreshold=1 \
          -Dusing.aikars.flags=true \
          -Daikars.new.flags=true \
          -jar "forge-${FORGE_VERSION}.jar" \
          --nogui \
          --universe ./data \
          --port ${SERVER_PORT:-25565} \
          --world ${WORLD_NAME:-world}
