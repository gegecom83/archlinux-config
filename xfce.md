# Xfce

## Install Xorg and graphical drivers

- For regular computers:

```bash
sudo pacman -S xorg-server mesa
```

- For NVIDIA computers:

_**Warning**: Please ensure your graphics card is supported by modern NVIDIA driver before installing._
_For a list of supported GPUs click here: https://www.nvidia.com/Download/driverResults.aspx/149138/en-us_

Proprietary driver and support for Vulkan are required for proper functionality of games.

To install it, execute the following command:

```bash
sudo pacman -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
```

- For AMD computers:

To install support for Vulkan API  (will be functional only if you have a [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility)) and 32-bit games, execute following command:

```bash
sudo pacman -S --needed lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
```

- For Intel computers:

To install support for Vulkan API  (will be functional only if you have a [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility)) and 32-bit games, execute following command:

```bash
sudo pacman -S --needed lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader
```

_Note for Intel integrated graphics users: Only Skylake and newer Intel CPUs (processors) offer full Vulkan support. Broadwell, Haswell and Ivy Bridge only offer partial support, which will very likely not work with a lot of games properly. Sandy Bridge and older lack any Vulkan support whatsoever._

- For VMware computers:

```bash
sudo pacman -S open-vm-tools
sudo systemctl enable/start vmtoolsd.service
sudo systemctl enable/start vmware-vmblock-fuse.service
sudo pacman -S gtkmm3 # if copy and paste between host and guest does not work properly
```

## Install Xfce

Xfce with a few additional packages for a base system according to my personal preferences.

```bash
sudo pacman -S  xfce4 xfce4-goodies mugshot pavucontrol gvfs xarchiver xdg-user-dirs xdg-utils pipewire pipewire-audio pipewire-pulse pipewire-jack openssh
 ```

### Configure start for Xfce

```bash
sudo pacman -S lightdm-gtk-greeter # a display manager lightweight - low memory usage and high performance
sudo systemctl enable lightdm.service # lightdm will be started at boot
```

## Reboot

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
sudo pacman -S firefox network-manager-applet htop file-roller galculator pragha fwupd fastfetch p7zip unrar gspell xdg-user-dirs-gtk xdg-desktop-portal-gtk lightdm-gtk-greeter-settings alacarte gimp libreoffice-fresh claws-mail blueman
sudo pacman -S gnu-free-fonts noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-droid ttf-opensans ttf-roboto ttf-liberation ttf-dejavu # optional dependencies I need for the above packages
sudo pacman -S ntfs-3g fuse2 fuse2fs fuse3 exfatprogs # tools to manage additional or foreign filesystems such as NTFS or exFAT
sudo pacman -S gstreamer gst-plugins-bad gst-plugins-base gst-plugins-ugly gst-plugin-pipewire gstreamer-vaapi gst-plugins-good gst-libav # plugins for multimedia
sudo pacman -S power-profiles-daemon  # handles power profiles
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
sudo pacman -S papirus-icon-theme qt5ct
```

```bash
yay adwaita-qt5
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

- How to change Firefox min/max/close buttons:
  
By default (?), firefox uses Client Side Decorations. These cannot be managed by the window manager because CSD window decorations are drawn by the application. Fortunately, you can revert firefox to regular titlebars (in Customize, select the "Title Bar" option).
