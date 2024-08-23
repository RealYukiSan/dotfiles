#!/bin/sh
scrot --select --line mode=edge - | xclip -selection clipboard -target image/png
