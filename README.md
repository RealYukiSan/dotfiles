Summarize My DWM's dot files (not riced yet):

## Note for my workspace desktop environment
generate the package list by the following command:

```shell
pacman -Qeq > pkglist.txt
```

and install those by:

```shell
pacman -S --needed - < comm -12 <(pacman -Slq | sort) <(sort pkglist.txt)
paru -S --needed - < comm -13 <(pacman -Slq | sort) <(sort pkglist.txt)
```

[references](https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#Install_packages_from_a_list)

## Packages

Utility:
- Clipboard: ?
- Screenshot: scrot

File Media:
- Image viewer: nsxiv
- Video player: MPV

Network and social media:
- qbittorrent
- Browser: ungoogled chromium
- Telegram

Appearance:
- File manager: nnn (TUI-based)
- Terminal emulator: st
- Shell: bash
- Application launcher: dmenu
- File/code editor: neovim/nvim
- Widget: ?

System:
- Notify daemon: dunst
- Bluetooth: bluez
- Audio: pipewire (pactl using this)
- Brightness: brightnessctl
- Network connection: networkmanager-iwd (from aur)
- SSH: openssh
- AUR package manager: paru-bin

Core:
- linux
- linux-firmware
- intel-ucode
- base
- base-devel
- git
- xorg

## Additional custom setting

Configuration:
- reddit hosts file

Script and aliases:
- incognito (wip: with tor support) shell script
- screen off

```shell
alias screenoff="xset dpms force suspend", see also (https://askubuntu.com/questions/1792/how-can-i-suspend-hibernate-from-command-line)
```

