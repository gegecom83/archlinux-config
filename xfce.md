# Xfce

## Install Xorg and graphical drivers

- For regular computers:

```bash
sudo pacman -S xorg-server mesa # install nvidia instead of mesa if you have an Nvidia GPU.
```

- For VMware computers:

```bash
sudo pacman -S open-vm-tools
sudo systemctl enable/start vmtoolsd.service
sudo systemctl enable/start vmware-vmblock-fuse.service
sudo pacman -S gtkmm3 # if copy and paste between host and guest does not work properly.
```

## Install Xfce

Xfce with a few additional packages for a base system according to my personal preferences.

```bash
sudo pacman -S  xfce4 xfce4-goodies pavucontrol gvfs xarchiver xdg-user-dirs xdg-utils polkit-gnome jack2 pipewire pipewire-audio pipewire-pulse openssh
 ```

### Configure start for Xfce

```bash
sudo pacman -S lightdm-gtk-greeter # a display manager lightweight - low memory usage and high performance.
sudo systemctl enable lightdm.service # LightDM will be started at boot.
```

## Reboot

```bash
reboot
```
## Install additional packages

```bash
sudo pacman -S firefox btop file-roller galculator fwupd fastfetch power-profiles-daemon p7zip unrar gspell xdg-desktop-portal-gtk
sudo pacman -S --asdeps gnome-keyring gnu-free-fonts ttf-dejavu ttf-liberation ttf-nerd-fonts-symbols noto-fonts-emoji adobe-source-code-pro-fonts # Optional dependencies I need for the above packages
sudo pacman -S ntfs-3g fuse2 fuse2fs fuse3 exfatprogs
```

## AUR Helper

```bash
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
yay -Y --gendb # generate AUR database
yay -Y --devel --save # track development packages
sed -i 's/"sudoloop": false,/"sudoloop": true,/' ~/.config/yay/config.json  # prevents multiple password prompts
```

## Arch-update

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
