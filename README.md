# trustedproxy - Docker mod for Home Assistant

This mod configures Home Assistant to work out of the box behind a reverse proxy
(the Cosmos proxy): it marks the proxy as trusted and enables honoring the
`X-Forwarded-For` header.

It supports both Home Assistant configuration mechanisms:

- **Home Assistant >= 2026.8** (and required from **2027.2**, where YAML support is
  removed): HTTP settings live in the UI-managed `http` config entry, persisted to
  `/config/.storage/http`. The mod writes that store directly so no manual UI step
  is needed after install.
- **Home Assistant < 2026.8**: the mod writes the classic `http:` block into
  `configuration.yaml`.

The proxy list is taken from the `PROXY_HOSTNAME` environment variable. It accepts
either a single IP/CIDR (e.g. `10.0.0.5`) or a Python-style list
(e.g. `['0.0.0.0/0','::/0']`, the format the Cosmos HomeAssistant template sets).

## Usage

In the Home Assistant docker arguments, set an environment variable:

```bash
DOCKER_MODS=aseracorp/docker-mods:homeassistant-trustedproxy-ng
```

If adding multiple mods, enter them in an array separated by `|`:

```bash
DOCKER_MODS=linuxserver/mods:homeassistant-hacs|aseracorp/docker-mods:homeassistant-trustedproxy-ng
```

## Notes

- The mod only writes the `.storage/http` store if it does not exist yet. Once Home
  Assistant has its own HTTP configuration (or after you changed it in the UI), your
  settings are never overwritten.
- `PROXY_HOSTNAME` values are written as CIDR networks. Use network addresses, not
  host addresses, for masked entries (e.g. `192.168.1.0/24`, not `192.168.1.50/24`).
- The old tag `homeassistant-trustedproxy` (legacy) keeps the YAML-only behavior for
  pre-2026.8 setups; use `homeassistant-trustedproxy-ng` for new installs.
