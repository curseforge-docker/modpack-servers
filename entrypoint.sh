#!/bin/bash

java -Xmx"${RAM_MAX}" -Xms"${RAM_MIN}" -jar "forge-${FORGE_VERSION}.jar" nogui
