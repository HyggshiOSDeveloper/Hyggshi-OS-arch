#!/usr/bin/env bash
set -e -u

systemctl enable lightdm.service
systemctl enable NetworkManager.service

# Auto-login user "liveuser" cho live session (tùy chọn)
mkdir -p /etc/lightdm/lightdm.conf.d
cat > /etc/lightdm/lightdm.conf.d/50-autologin.conf <<EOF
[Seat:*]
autologin-user=liveuser
autologin-user-timeout=0
EOF
