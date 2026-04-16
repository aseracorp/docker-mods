# oidc - Docker mod for Home Assistant

This mod adds the necessary *.yaml files and configuration in home assistant for it to work out of the box behind a proxy.

In homeassistant docker arguments, set an environment variable `DOCKER_MODS=aseracorp/docker-mods:homeassistant-oidc`

If adding multiple mods, enter them in an array separated by `|`, such as `DOCKER_MODS=linuxserver/mods:homeassistant-hacs|aseracorp/docker-mods:homeassistant-oidc`