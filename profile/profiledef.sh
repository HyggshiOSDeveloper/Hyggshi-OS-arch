#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="hyggshi-os-arch"
iso_label="HYGGSHI_$(date +%Y%m)"
iso_publisher="Hyggshi OS <https://github.com/Hyggshi-OS-project-center>"
iso_application="Hyggshi OS Arch Live/Rescue DVD"
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux' 'uefi.grub')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '19')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/customize_airootfs.sh"]="0:0:755"
)
