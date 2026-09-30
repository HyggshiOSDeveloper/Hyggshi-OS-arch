# Hyggshi OS — Arch Edition

Arch-based live + installer ISO built with [archiso](https://wiki.archlinux.org/title/Archiso).

- **Desktop:** XFCE + LightDM
- **Live session:** autologin as `liveuser` (password `liveuser`, passwordless sudo)
- **Installer:** [Calamares](https://calamares.io) — "Install Hyggshi OS" icon on the desktop, or `sudo calamares`
- **Networking:** NetworkManager (systemd-networkd / iwd / sshd are disabled in the live image)

## Build

The CI workflow (`.github/workflows/build.yml`) builds the ISO. To build locally on Arch:

```bash
# Calamares comes from Chaotic-AUR — add it to the build host first
# (see https://aur.chaotic.cx/docs), then:
sudo pacman -S archiso
sudo mkarchiso -v -w work/ -o out/ profile/
```

## Layout

| Path | Purpose |
|---|---|
| `profile/packages.x86_64` | Packages in the ISO |
| `profile/pacman.conf` | Build-time repos (core, extra, chaotic-aur) |
| `profile/airootfs/etc/calamares/` | Calamares settings, modules, branding |
| `profile/airootfs/usr/local/bin/hyggshi-live-setup` | Creates `liveuser` at live boot |
| `profile/airootfs/usr/local/bin/hyggshi-post-install` | Strips live-ISO leftovers from the installed system |
