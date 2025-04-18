# Plasma by KDE

## Install graphical drivers

- For NVIDIA computers:

```bash
sudo pacman -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
```

- For AMD computers:

```bash
sudo pacman -S --needed mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
```

- For Intel computers:

```bash
sudo pacman -S --needed mesa lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader
```

- For VMware computers:

```bash
sudo pacman -S mesa open-vm-tools
sudo systemctl enable/start vmtoolsd.service
sudo systemctl enable/start vmware-vmblock-fuse.service
sudo pacman -S gtkmm3 # if copy and paste between host and guest does not work properly
```

## Install Plasma

Plasma with a few additional packages for a base system according to my personal preferences.

```bash
sudo pacman -S plasma-meta konsole dolphin ark xdg-utils pipewire pipewire-audio pipewire-pulse pipewire-jack openssh
 ```

## Configure start Plasma

```bash
sudo systemctl enable sddm.service
```

Reboot (should start Plasma automatically after logging)

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

## Install additional packages (optional)

```bash
sudo pacman -S  firefox kate krita kmail libreoffice-fresh fastfetch okular elisa p7zip unrar fwupd 
sudo pacman -S gnu-free-fonts noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-droid ttf-opensans ttf-roboto ttf-liberation ttf-dejavu # optional dependencies I need for the above packages
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

## Custom appearance (optional)

```bash
sudo pacman -S qt5-declarative breeze-gtk kde-gtk-config
```

- How to change Firefox min/max/close buttons:
  
By default (?), firefox uses Client Side Decorations. These cannot be managed by the window manager because CSD window decorations are drawn by the application. Fortunately, you can revert firefox to regular titlebars (in Customize, select the "Title Bar" option).
