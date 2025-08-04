# i3-wm

## Install Xorg and graphical drivers

- For NVIDIA computers:

```bash
sudo pacman -S xorg-server nvidia-dkms nvidia-utils nvidia-settings vulkan-icd-loader
```

- For AMD computers:

```bash
sudo pacman -S xorg-server mesa vulkan-radeon vulkan-icd-loader
```

- For Intel computers:

```bash
sudo pacman -S xorg-server mesa vulkan-intel vulkan-icd-loader
```

- For VMware computers:

```bash
sudo pacman -S xorg-server mesa open-vm-tools
sudo systemctl enable/start vmtoolsd.service
sudo systemctl enable/start vmware-vmblock-fuse.service
sudo pacman -S gtkmm3 # if copy and paste between host and guest does not work properly
```

## Install i3-wm

 i3-wm with a few additional packages for a base system according to my personal preferences.

```bash
sudo pacman -S 7zip alacritty awesome-terminal-fonts brightnessctl cava dex dmenu dunst fastfetch feh firefox galculator gnome-keyring gvfs gvfs-afc gvfs-mtp gvfs-nfs gvfs-smb htop i3-wm i3blocks i3lock i3status mpd mousepad network-manager-applet numlockx otf-font-awesome openssh picom pipewire-pulse playerctl polkit-gnome ranger rmpc rofi scrot thunar thunar-archive-plugin thunar-volman tumbler unzip xarchiver xdg-user-dirs xorg-xinit xorg-xrandr xss-lock zip
 ```

## Configure startx for i3

Using startx

```bash
cp /etc/X11/xinit/xinitrc ~/.xinitrc
nano ~/.xinitrc # Delete the 5 last lines and add the following ones instead
```

```bash
[...]  
# start i3
export XDG_SESSION_TYPE=X11
exec i3
```

```bash
nano ~/.bash_profile
```

```bash
[...]  
# autostart i3  
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
exec startx
fi
```

## Reboot (should start i3 automatically after logging)

```bash
sudo reboot
```

## Pacman Mirrorlist
[Pacman Mirrorlist Generator](https://archlinux.org/mirrorlist/)

```bash
sudo nano /etc/pacman.d/mirrorlist
```

## Install additional packages (optional)

```bash
sudo pacman -S ntfs-3g fuse2 fuse2fs fuse3 exfatprogs # tools to manage additional or foreign filesystems such as NTFS or exFAT
sudo pacman -S gstreamer gst-plugins-bad gst-plugins-base gst-plugins-ugly gst-plugin-pipewire gstreamer-vaapi gst-plugins-good gst-libav # plugins for multimedia
```

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

## Custom appearance (optional)

```bash
sudo pacman -S qt5ct nwg-look
```

- qt5ct:

```bash
nano ~/.profile
```

```bash
export QT_QPA_PLATFORMTHEME="qt5ct"
```

```bash
nano ~/.bash_profile
```

```bash
[[ -f ~/.profile ]] && . ~/.profile
```
