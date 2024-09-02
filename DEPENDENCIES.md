# Dependencies
I use arch, (btw) so all packages mentioned are either an arch package or an
AUR package. Those might differ based on your distribution.

## Tooling
Tools needed to clone and install all configurations.
```sh
pacman -S git stow
```

## Hyprland
The Hyprland wm itself and other ui tools like waybar or app launcher (rofi).
```sh
pacman -S hyprland xdg-desktop-portal-hyprland rofi rofi-calc waybar konsole hyprpaper dunst hyprlock
```

## Other
Other tools required for everything to work smoothly (utils).
```sh
pacman -S wl-clipboard cliphist network-manager-applet kdeconnect kwallet5 grim slurp nvim
```

## Themes
QT or GTK themes, cursor themes and other tooling.
```sh
pacman -S breeze breeze-gtk qt6ct bibata-cursor-theme-bin papirus-icon-theme
```

## Fonts
Last but not least all the necessary fonts, so that icons etc. work.
```sh
pacman -S ttf-roboto ttf-jetbrains-mono-nerd ttf-twemoji ttf-font-awesome otf-ipafont
```
