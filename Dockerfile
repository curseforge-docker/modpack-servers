ARG JAVA_VERSION=11

FROM amazoncorretto:$JAVA_VERSION

ENV RAM_MAX=4G
ENV RAM_MIN=1G

RUN mkdir /minecraft \
    && yum install -y unzip curl

WORKDIR /minecraft

ARG MINECRAFT_VERSION
ARG FORGE_VERSION
ARG PACK_NAME
ARG PACK_VERSION
ARG DOWNLOAD_URL

ENV DOWNLOAD_URL=$DOWNLOAD_URL
ENV FORGE_VERSION=$MINECRAFT_VERSION-$FORGE_VERSION
ENV RAM_MAX=4G
ENV RAM_MIN=1G

LABEL MINECRAFT_VERSION=$MINECRAFT_VERSION \
      FORGE_VERSION=$FORGE_VERSION \
      PACK_NAME=$PACK_NAME \
      PACK_VERSION=$PACK_VERSION

COPY entrypoint.sh /minecraft/

RUN echo "Downloading server files from ${DOWNLOAD_URL}" \
    && curl -sSL "${DOWNLOAD_URL}" -o serverfiles.zip \
    && unzip serverfiles.zip \
    && rm serverfiles.zip

RUN echo "Download Forge version ${FORGE_VERSION}" \
    && curl -sSL "http://files.minecraftforge.net/maven/net/minecraftforge/forge/${FORGE_VERSION}/forge-${FORGE_VERSION}-installer.jar" -o forge-installer.jar \
    && java -jar forge-installer.jar --installServer \
    && rm forge-installer.jar forge-installer.jar.log

ENTRYPOINT ["/bin/bash"]
CMD ["entrypoint.sh"]
