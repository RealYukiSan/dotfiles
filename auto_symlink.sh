#!/bin/bash

absolute_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# need to fix the script first.
# chmod +x $absolute_path/download_list/download.sh
chmod -v +x $absolute_path/screenshot.sh
chmod -v +x $absolute_path/screenshot_select.sh

# ln -vsdf $absolute_path/PowerTunnel where?
ln -vsdf $absolute_path/nvim ~/.config/nvim
ln -vsf $absolute_path/.bashrc ~/.bashrc
ln -vsf $absolute_path/.inputrc ~/.inputrc
ln -vsf $absolute_path/.Xresources ~/.Xresources
ln -vsf $absolute_path/.xinitrc ~/.xinitrc
sudo ln -vsf $absolute_path/hosts /etc/hosts
# sudo ln -vsdf $absolute_path/download_list/download.sh /usr/local/bin/download.sh
sudo ln -vsf $absolute_path/screenshot.sh /usr/local/bin/screenshot.sh
sudo ln -vsf $absolute_path/screenshot_select.sh /usr/local/bin/screenshot_select.sh

