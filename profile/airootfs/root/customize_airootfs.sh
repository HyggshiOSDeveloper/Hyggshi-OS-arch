#!/usr/bin/env bash
set -e -u

# Tạo tài khoản liveuser
useradd -m -G wheel,storage,power,network,video,audio -s /bin/bash liveuser
echo "liveuser:liveuser" | chpasswd

# Cho phép sudo không cần mật khẩu
mkdir -p /etc/sudoers.d
echo "liveuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/liveuser
chmod 440 /etc/sudoers.d/liveuser

# Enable các service cần thiết
systemctl enable NetworkManager.service
systemctl enable lightdm.service

# Cấu hình autologin cho LightDM
mkdir -p /etc/lightdm/lightdm.conf.d
cat > /etc/lightdm/lightdm.conf.d/50-autologin.conf <<EOF
[Seat:*]
autologin-user=liveuser
autologin-user-timeout=0
autologin-session=xfce
EOF
