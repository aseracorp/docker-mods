# trustedproxy - Docker mod for Home Assistant

This mod adds the necessary *.yaml files and configuration in home assistant for it to work out of the box behind a proxy.

In homeassistant docker arguments, set an environment variable `DOCKER_MODS=aseracorp/docker-mods:homeassistant-trustedproxy-legacy`

If adding multiple mods, enter them in an array separated by `|`, such as `DOCKER_MODS=linuxserver/mods:homeassistant-hacs|aseracorp/docker-mods:homeassistant-trustedproxy-legacy`

> **Legacy mod.** This is the YAML-based version for Home Assistant < 2026.8.
> New installs should use the default tag `homeassistant-trustedproxy`, which
> supports the `.storage/http` configuration of HA >= 2026.8 and falls back to
> YAML for older versions.
