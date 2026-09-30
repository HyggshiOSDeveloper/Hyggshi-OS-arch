# Hyggshi OS — Arch Edition

Arch-based live + installer ISO built with [archiso](https://wiki.archlinux.org/title/Archiso).

- **Desktop:** KDE Plasma + SDDM
- **Live session:** autologin as `liveuser` (password `liveuser`, passwordless sudo)
- **Installer:** [Calamares](https://calamares.io) — "Install Hyggshi OS" icon on the desktop, or `sudo calamares`
- **Networking:** NetworkManager (systemd-networkd / iwd / sshd are disabled in the live image)

## Build

The CI workflow (`.github/workflows/build.yml`) builds the ISO. To build locally on Arch:

```bash
sudo pacman -S archiso base-devel git

# Calamares is built from the AUR into a local repo (same as CI):
git clone https://github.com/archlinux/aur.git --branch calamares --single-branch calamares-aur
(cd calamares-aur && makepkg -s)
sudo mkdir -p /opt/localrepo && sudo cp calamares-aur/*.pkg.tar.zst /opt/localrepo/
sudo repo-add /opt/localrepo/hyggshi-local.db.tar.gz /opt/localrepo/*.pkg.tar.zst

sudo mkarchiso -v -w work/ -o out/ profile/
```

## Layout

| Path | Purpose |
|---|---|
| `profile/packages.x86_64` | Packages in the ISO |
| `profile/pacman.conf` | Build-time repos (core, extra, local Calamares repo) |
| `profile/airootfs/etc/calamares/` | Calamares settings, modules, branding |
| `profile/airootfs/usr/local/bin/hyggshi-live-setup` | Creates `liveuser` at live boot |
| `profile/airootfs/usr/local/bin/hyggshi-post-install` | Strips live-ISO leftovers from the installed system |
