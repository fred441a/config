echo "deb http://deb.debian.org/debian bookworm main
deb http://deb.debian.org/debian bookworm-updates main
deb http://security.debian.org/debian-security bookworm-security main
deb http://ftp.debian.org/debian bookworm-backports main" > /etc/apt/sources.list;
apt update
apt upgrade
apt install i3-wm alacritty picom arandr nitrogen polybar rofi maim xclip xdotool
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - &&\
apt-get install -y nodejs
nitrogen
