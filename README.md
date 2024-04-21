Summarize My DWM's dot files (not riced yet):

## Note for my workspace desktop environment
- use symlink to links your configuration in order to keep up to date with the remote repository and synchronized (keep in mind the generated link not deleted automatically when you delete the target, you free to delete those broken symlink by using [find command](https://linuxize.com/post/how-to-remove-symbolic-links-in-linux/#find-and-delete-broken-symbolic-links))
- no need for file-system snapshot, just backup the pacman database list instead.
- untracked software are installed inside /opt directory and symlinked to bin directory
- maintain your custom packages, [Preserve modified packages](https://wiki.archlinux.org/title/Arch_build_system#Preserve_modified_packages)
- generate the package list by the following command:

```shell
pacman -Qeq > pkglist.txt
```

and install those by:

```shell
pacman -S --needed - < comm -12 <(pacman -Slq | sort) <(sort pkglist.txt)
paru -S --needed - < comm -13 <(pacman -Slq | sort) <(sort pkglist.txt)
```

[references](https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#Install_packages_from_a_list)

unset the HISTFILE if you want temporary disable history feature, and export the HISTFILE variable to re-enable it.
try echo the variable to check the value

or just simply use `set` command [as alternative](https://unix.stackexchange.com/questions/10922/temporarily-suspend-bash-history-on-a-given-shell) to easier toggle it.

## Packages

Utility:
- Clipboard terminal interface: xclip
- Screenshot: scrot

File Media:
- File explorer: netrw (installed, default on neovim)
- Image viewer: nsxiv
- Video player: MPV
- Image editor: GIMP
- Mic noise reducer: noisetorch
- Video screen recording: OBS studio

Network-related software:
- network packet analysis: wireshark
- VPN client: openconnect
- SSH client: openssh
- BitTorrent client: qbittorrent
- Surface on the internet: ungoogled chromium browser

Social Media:
- Telegram

Appearance:
- Terminal emulator: st (installed, default on DWM)
- Shell: bash (installed, default)
- Application launcher: dmenu (installed, default on DWM)
- Resource monitor: btop
- Widget: ?

developer tools:
- version control system: git
- code editor: neovim
- IDE: android studio (barely used though)

System:
- Audio server: pipewire and pulse audio
- Notify daemon: dunst
- Bluetooth: bluez
- Audio: pipewire (pactl using this)
- Brightness: brightnessctl
- Network management: networkmanager-iwd (from aur)
- AUR package manager: paru-bin
- xdg-open features the "open file with x program"

Core:
- linux
- linux-firmware
- intel-ucode
- base
- base-devel
- xorg

## For fresh install dwm
Just clone the dwm-git from aur and place it under home dir then run the auto symlink script, and as usual, build and install using makepkg

## References
- [how to suspend](https://askubuntu.com/questions/1792/how-can-i-suspend-hibernate-from-command-line)
- why there's PowerTunnel folder? see [this chat](https://t.me/GNUWeeb/883581)
- useful tips on privacy concern: [how to installing chrome extension without login](https://superuser.com/questions/633706/how-to-install-extensions-in-chrome-without-a-google-account)
- [crxviewer](https://crxviewer.com/)
- [new temporary chrome session](https://t.me/c/1987506309/1603/3351)
- [seputar dwm](https://bandithijo.dev/blog/dwm-window-manager-anti-ribet)

