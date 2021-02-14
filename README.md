# Minecraft Modpack Docker Images

![Docker Image CI](https://github.com/curseforge-docker/modpack-servers/workflows/Docker%20Image%20CI/badge.svg?branch=master)
  
This repository contains ready-to-use docker images for some of the most popular Minecraft Modpacks, such as _All the Mods 6_, _RLCraft_ and _SkyFactory 4_.

## Usage

To simply use the latest version of a modpack (e.g. `all-the-mods-6`), run
```console
docker run -d --name minecraft-server -p 25565:25565 -e EULA=true curseforge/all-the-mods-6
```
where the standard minecraft port (25565) is being used.

To get a list of all available Modpacks, see [List of available modpacks](#list-of-available-modpacks).

If you want to run multiple servers, or just change the port, you can change the port mapping by running
```console
docker run -p 25566:25565 ...
```
This will serve your Minecraft server on port `25566` since the `-p` syntax is `host-port`:`container-port`.

All container images are hosted on Docker Hub as well as in the Github Container Registry.  
Docker Hub
```console
docker pull curseforge/all-the-mods-6
```
Github Container Registry
```console
docker pull ghcr.io/curseforge-docker/all-the-mods-6
```

When deploying multiple servers, it is recommended to give them namens, in order to manage them more easily, such as
```console
docker run --name my-minecraft-server ...
```

With named containers it is easy to show the logs, start, stop or restart the container:
```console
docker logs -f my-minecraft-server

docker start my-minecraft-server

docker stop my-minecraft-server

docker restart my-minecraft-server
```

_It is important to always add `-e EULA=true` id the docker commands as Mojang/Microsoft requires EULA acceptance._
## List of available modpacks
| Modpack                                                                             | Versions                                                                                     |
| ----------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| [RLCraft](https://www.curseforge.com/minecraft/modpacks/rlcraft)                    | [1.4.1](https://github.com/orgs/curseforge-docker/packages/container/package/all-the-mods-6) |
| [All the Mods 6](https://www.curseforge.com/minecraft/modpacks/all-the-mods-6)      | -                                                                                            |
| [SkyFactory 4](https://www.curseforge.com/minecraft/modpacks/skyfactory-4)          | -                                                                                            |
