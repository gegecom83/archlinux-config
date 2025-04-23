# Sway

## Install graphical drivers

Ensure you have the appropriate driver installed. For example:

- Intel: mesa

- AMD: mesa and xf86-video-amdgpu

- NVIDIA (open-source): mesa, nvidia, and nvidia-drm (with kernel mode setting enabled)

- VMware: mesa open-vm-tools gtkmm3 (enable/start vmtoolsd.service, vmware-vmblock-fuse.service)

## Install Sway

Sway with a few additional packages for a base system according to my personal preferences.

```bash
sudo pacman -S sway brightnessctl foot libpulse mako polkit swaybg swayidle swaylock waybar wmenu xdg-desktop-portal-gtk xdg-desktop-portal-wlr xorg-xwayland 
```

### Auto start Sway when logging on TTY1

```bash
vim ~/.bash_profile
```

> [...]  
> #Autostart Sway  
> ``if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then``  
> > export XDG_CURRENT_DESKTOP=sway  
> > export XDG_SESSION_DESKTOP=sway  
> > export XDG_SESSION_TYPE=wayland  
> > export QT_QPA_PLATFORM=wayland  
> > export SDL_VIDEODRIVER=wayland  
> > export MOZ_ENABLE_WAYLAND=1
> > export GDK_BACKEND=wayland,x11
> > exec sway  
>
> fi

## Reboot (should start Sway automatically after logging)

```bash
reboot
```

## Pacman Mirrorlist
[Pacman Mirrorlist Generator](https://archlinux.org/mirrorlist/)

```bash
sudo nano /etc/pacman.d/mirrorlist
```

```bash
##
## Arch Linux repository mirrorlist
## Generated on 2025-04-13
##

## France
Server = http://mirror.archlinux.ikoula.com/archlinux/$repo/os/$arch
Server = https://elda.asgardius.company/archlinux/$repo/os/$arch
Server = http://mirror.bakertelekom.fr/Arch/$repo/os/$arch
Server = https://mirror.bakertelekom.fr/Arch/$repo/os/$arch
Server = http://fr.mirrors.cicku.me/archlinux/$repo/os/$arch
Server = https://fr.mirrors.cicku.me/archlinux/$repo/os/$arch
Server = http://mirror.cyberbits.eu/archlinux/$repo/os/$arch
Server = https://mirror.cyberbits.eu/archlinux/$repo/os/$arch
Server = http://archlinux.datagr.am/$repo/os/$arch
Server = https://mirrors.eric.ovh/arch/$repo/os/$arch
Server = http://mirrors.gandi.net/archlinux/$repo/os/$arch
Server = https://mirrors.gandi.net/archlinux/$repo/os/$arch
Server = http://archmirror.hogwarts.fr/$repo/os/$arch
Server = https://archmirror.hogwarts.fr/$repo/os/$arch
Server = http://mirror.its-tps.fr/archlinux/$repo/os/$arch
Server = https://mirror.its-tps.fr/archlinux/$repo/os/$arch
Server = http://mirror.jordanrey.me/archlinux/$repo/os/$arch
Server = https://mirror.jordanrey.me/archlinux/$repo/os/$arch
Server = https://mirrors.jtremesay.org/archlinux/$repo/os/$arch
Server = https://arch.juline.tech/$repo/os/$arch
Server = http://mirror.lastmikoi.net/archlinux/$repo/os/$arch
Server = http://archlinux.mailtunnel.eu/$repo/os/$arch
Server = https://archlinux.mailtunnel.eu/$repo/os/$arch
Server = https://f.matthieul.dev/mirror/archlinux/$repo/os/$arch
Server = http://mir.archlinux.fr/$repo/os/$arch
Server = http://mirrors.celianvdb.fr/archlinux/$repo/os/$arch
Server = https://mirrors.celianvdb.fr/archlinux/$repo/os/$arch
Server = http://arch.nimukaito.net/$repo/os/$arch
Server = https://arch.nimukaito.net/$repo/os/$arch
Server = http://mirror.oldsql.cc/archlinux/$repo/os/$arch
Server = https://mirror.oldsql.cc/archlinux/$repo/os/$arch
Server = http://archlinux.mirrors.ovh.net/archlinux/$repo/os/$arch
Server = https://archlinux.mirrors.ovh.net/archlinux/$repo/os/$arch
Server = http://mirror.peeres-telecom.fr/archlinux/$repo/os/$arch
Server = https://mirror.peeres-telecom.fr/archlinux/$repo/os/$arch
Server = http://mirror.rznet.fr/archlinux/$repo/os/$arch
Server = https://mirror.rznet.fr/archlinux/$repo/os/$arch
Server = https://mirror.smayzy.ovh/archlinux/$repo/os/$arch
Server = http://mirror.spaceint.fr/archlinux/$repo/os/$arch
Server = https://mirror.spaceint.fr/archlinux/$repo/os/$arch
Server = http://mirrors.standaloneinstaller.com/archlinux/$repo/os/$arch
Server = https://mirror.sysa.tech/archlinux/$repo/os/$arch
Server = http://arch.syxpi.fr/arch/$repo/os/$arch
Server = https://arch.syxpi.fr/arch/$repo/os/$arch
Server = https://mirror.thekinrar.fr/archlinux/$repo/os/$arch
Server = http://mirror.theo546.fr/archlinux/$repo/os/$arch
Server = https://mirror.theo546.fr/archlinux/$repo/os/$arch
Server = http://mirror.trap.moe/archlinux/$repo/os/$arch
Server = https://mirror.trap.moe/archlinux/$repo/os/$arch
Server = http://ftp.u-strasbg.fr/linux/distributions/archlinux/$repo/os/$arch
Server = https://mirror.wormhole.eu/archlinux/$repo/os/$arch
Server = http://arch.yourlabs.org/$repo/os/$arch
Server = https://arch.yourlabs.org/$repo/os/$arch
```

## Audio Setup

```bash
sudo pacman -S pipewire pipewire-audio pipewire-pulse pipewire-jack wireplumber pavucontrol
sudo systemctl --user enable --now pipewire pipewire-audio pipewire-pulse pipewire-jack wireplumber
```

You can use pavucontrol to adjust audio settings in a GUI.

## Install additional packages

```bash
sudo pacman -S polkit-gnome gnome-keyring firefox thunar thunar-archive-plugin engrampa gvfs p7zip unrar mousepad xfce4-terminal network-manager-applet wl-clipboard wl-clip-persist grim slurp wofi htop fastfetch rofi-wayland flameshot swaync nwg-displays nwg-look nwg-drawer nwg-panel fwupd ristretto blueman qt5-wayland xdg-utils xdg-user-dirs-gtk
sudo pacman -S ntfs-3g fuse2 fuse2fs fuse3 exfatprogs # tools to manage additional or foreign filesystems such as NTFS or exFAT
sudo pacman -S gstreamer gst-plugins-bad gst-plugins-base gst-plugins-ugly gst-plugin-pipewire gstreamer-vaapi gst-plugins-good gst-libav # plugins for multimedia
```

## Basic Configuration

Sway uses a configuration file located at:

~/.config/sway/config

If this file doesn’t exist, Sway will create it by copying the default from /etc/sway/config.

To create your personal config:

```bash
mkdir -p ~/.config/sway
cp /etc/sway/config ~/.config/sway/
```

Open it in your text editor (e.g., nano, vim) and start customizing.

```bash
vim ~/.config/sway/config
```

Set default keymap and terminal in Sway config.

```text
[...]
input type:keyboard {
        xkb_layout "fr"
        xkb_variant "azerty"
        xkb_numlock "enabled"
}
```

Sway supports nearly all i3 keybindings. Example keybindings you might want to modify:

```bash
set $term xfce4-terminal
bindsym  $mod+d exec rofi -show drun -show-icons
bindsym  $mod+m exec thunar
bindsym  $mod+e exec mousepad
bindsym  $mod+b exec firefox
```

To autostart programs, add exec lines at the end of the config:

```bash
exec nm-applet
exec mako
exec waybar
exec wl-clip-persist --clipboard regular
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
exec swaync
```

Use swaybg to set a wallpaper:

```bash
exec swaybg -i ~/Pictures/wallpapers/mountain.jpg -m fill
```

You can configure displays using the output directive in the config file:

```bash
output eDP-1 resolution 1920x1080 position 0,0
output HDMI-A-1 resolution 1920x1080 position 1920,0
```

To identify display names, use:

```bash
swaymsg -t get_outputs
```

For dynamic setup without editing the config file, consider using wdisplays or sway-output-config.

Use swaylock and swayidle for session security:
```bash
exec swayidle -w \
    timeout 300 'swaylock -f -c 000000' \
    timeout 600 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' \
    before-sleep 'swaylock -f -c 000000'
  ```
  
This configuration locks the screen after 5 minutes and turns off the display after 10 minutes.

You can install themes for swaylock or build it with image support (swaylock-effects) from the AUR.

## Manage power profiles (e.g. balanced, power-saver, performance)

```bash
sudo pacman -S power-profiles-daemon
sudo systemctl enable/start power-profiles-daemon.service
```

## AUR Helper (optional)

```bash
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
yay -Y --gendb # generate AUR database
yay -Y --devel --save # track development packages
sed -i 's/"sudoloop": false,/"sudoloop": true,/' ~/.config/yay/config.json  # prevents multiple password prompts
```

## Arch-update (optional)

```bash
yay arch-update
systemctl --user enable --now arch-update-tray.service
systemctl --user enable --now arch-update.timer
```

Style to be used for the systray applet icon. Valid values are the available style / color variants for the icon set
"light" "dark" "blue".

```bash
arch-update --gen-config
```

```bash
nano ~/.config/arch-update/arch-update.conf
```

```bash
TrayIconStyle=light
```

