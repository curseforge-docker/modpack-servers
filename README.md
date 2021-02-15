# Minecraft Modpack Docker Images

![Build and Publish](https://github.com/curseforge-docker/modpack-servers/workflows/Build%20and%20Publish/badge.svg)
  
This repository contains ready-to-use docker images for some of the most popular Minecraft Modpacks, such as _All the Mods 6_, _RLCraft_ and _SkyFactory 4_.

## Usage

To simply use the latest version of a modpack (e.g. `all-the-mods-6`), run
```console
docker run -d --name minecraft-server -p 25565:25565 -e EULA=true curseforge/all-the-mods-6
```
To get a list of all available Modpacks, see [List of available modpacks](#list-of-available-modpacks).

If you want others to join you or this image runs on a server, you need to open the port 25565 (TCP) on your firewall.

All container images are hosted on Docker Hub as well as in the Github Container Registry.  
Docker Hub
```console
docker pull curseforge/all-the-mods-6
```
Github Container Registry
```console
docker pull ghcr.io/curseforge-docker/all-the-mods-6
```

If you want to know more regarding docker usage, head over to the [Docker cli reference](https://docs.docker.com/engine/reference/commandline/docker/)

_It is important to always add `-e EULA=true` id the docker commands as Mojang/Microsoft requires EULA acceptance._
## List of available modpacks
| Modpack                                                                             | GitHub                                                                                       | Docker Hub
| ----------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
| [RLCraft](https://www.curseforge.com/minecraft/modpacks/rlcraft)                    | -                                                                                            | [2.8.2](https://hub.docker.com/layers/curseforge/rlcraft/2.8.2/images/sha256-fa373662ba8f731509f50e6a3e29cc9340f7f3cf2e3fa5337c9e6277ca1fab57?context=explore)
| [All the Mods 6](https://www.curseforge.com/minecraft/modpacks/all-the-mods-6)      | [1.4.1](https://github.com/orgs/curseforge-docker/packages/container/all-the-mods-6/1142098) | [1.4.1](https://hub.docker.com/layers/curseforge/all-the-mods-6/1.4.1/images/sha256-cd5d74dfb422fadec278fc45074603634879c97b7a9ab8e3474cf3939a027b21?context=explore) [1.5.0](https://hub.docker.com/layers/curseforge/all-the-mods-6/1.5.0/images/sha256-4f8cad9873af452757d6f07203b7af6e951ce60bd6a59e4c0f5572aba962d8e3?context=explore)
| [SkyFactory 4](https://www.curseforge.com/minecraft/modpacks/skyfactory-4)          | -                                                                                            | [4.2.2](https://hub.docker.com/layers/curseforge/skyfactory-4/4.2.2/images/sha256-713c867f5b4b8ca50fe8a567f6dee85a943b7fcae32efe9d0bb3c1042e38c87f?context=explore)
