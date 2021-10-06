# Minecraft Modpack Docker Images

![Build and Publish](https://github.com/curseforge-docker/modpack-servers/workflows/Build%20and%20Publish/badge.svg)
  
This repository contains ready-to-use docker images for some of the most popular Minecraft Modpacks, such as _All the Mods 6_, _RLCraft_ and _SkyFactory 4_.

## Usage

To simply use the latest version of a modpack (e.g. `all-the-mods-6`), run
```console
docker run -d --name minecraft-server -p 25565:25565 -e EULA=true curseforge/all-the-mods-6
```
To get a list of all available Modpacks, see [List of available modpacks](#list-of-available-modpacks).

> _It is important to always add `-e EULA=true` id the docker commands as Mojang/Microsoft requires EULA acceptance._

If you want others to join you or this image runs on a server, you need to open the port 25565 (TCP) on your firewall.

To know more regarding the usage of docker, head over to the [Docker CLI reference](https://docs.docker.com/engine/reference/commandline/docker/)

### Resource allocation and limiting

Running Forge modpack servers requires way too much resources (RAM, CPU etc).
**This will be a problem** if your host machine has limited (or outdated) CPU or RAM.

Please read the information below before changing any of the resource limits or allocation configurations.

#### Java Heap space allocation

Running the Minecraft Java Edition server, requires the server to be run through a JAVA VM on the hosting machine.
Currently we default to using a minimum allocation of `1G` and a maximum of `4G` RAM.

The default values can be overridden by using the `-e` (aka. `--env`) flag to set the environment
variables `RAM_MIN` and `RAM_MAX` to the appropriate limits for your server.

**Please note!** We do not recommend going any lower than the default values for any modpack!

#### Docker resource limits

As a part of docker, you can configure the "Runtime constraints on resources", this is well documented in the Docker documentation here:
https://docs.docker.com/engine/reference/run/#runtime-constraints-on-resources

### Docker Compose

```
# docker-compose.yml
version: "3.7"
services:
  atm6:
    image: curseforge/all-the-mods-6
    environment:
      - EULA=true
    volumes:
      - /var/lib/minecraft-atm6/world:/minecraft/world
      - /var/lib/minecraft-atm6/backups:/minecraft/backups
    ports:
      - 25565:25565
    restart: unless-stopped
```

### Volumes

In order to persist your data (e.g. in case of a modpack update), you need to mount docker volumes.  
__It is strongly recommended to do so, otherwise you wight loose your data, like the world and server settings!__

```console
docker run \
  -v /var/lib/minecraft-atm6/world:/minecraft/world \
  -v /var/lib/minecraft-atm6/backups:/minecraft/backups \
  ...
```

You can add other files like the `server.properties`, the `ops.json` and the `whitelist.json` as well.

### Image hosting

All container images are hosted on Docker Hub as well as in the Github Container Registry.  
Docker Hub
```console
docker pull curseforge/all-the-mods-6:1.4.1
```
Github Container Registry
```console
docker pull ghcr.io/curseforge-docker/all-the-mods-6:1.4.1
```
## List of available modpacks
| Modpack                                                                             | GitHub                                                                                       | Docker Hub
| ----------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
| [RLCraft](https://www.curseforge.com/minecraft/modpacks/rlcraft)                    | -                                                                                            | [2.8.2](https://hub.docker.com/layers/curseforge/rlcraft/2.8.2/images/sha256-fa373662ba8f731509f50e6a3e29cc9340f7f3cf2e3fa5337c9e6277ca1fab57?context=explore)
| [All the Mods 6](https://www.curseforge.com/minecraft/modpacks/all-the-mods-6)      | [1.4.1](https://github.com/orgs/curseforge-docker/packages/container/all-the-mods-6/1142098) | [1.5.0](https://hub.docker.com/layers/curseforge/all-the-mods-6/1.5.0/images/sha256-4f8cad9873af452757d6f07203b7af6e951ce60bd6a59e4c0f5572aba962d8e3?context=explore) [1.4.1](https://hub.docker.com/layers/curseforge/all-the-mods-6/1.4.1/images/sha256-cd5d74dfb422fadec278fc45074603634879c97b7a9ab8e3474cf3939a027b21?context=explore)
| [SkyFactory 4](https://www.curseforge.com/minecraft/modpacks/skyfactory-4)          | -                                                                                            | [4.2.2](https://hub.docker.com/layers/curseforge/skyfactory-4/4.2.2/images/sha256-713c867f5b4b8ca50fe8a567f6dee85a943b7fcae32efe9d0bb3c1042e38c87f?context=explore)

_Currently we do not have a `latest` tag for the docker containers, you will therefore always need to specify the server version you need._

## Contribution

Please feel free to create pull requests and write about your issues here on GitHub. Constuctive Feedback is always a nice reward for our work. Though, if you are having trouble using docker or something is wrong with the modpack, please either read the docker documentation or refer to the modpack author(s).

## The credit goes to ...

... whoever works on building the modpacks!

We only make them more available for users who want to host their own servers.
