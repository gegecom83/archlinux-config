# Arch Linux base installation

This is my personal routine to install Arch Linux

- [Linux commands](https://github.com/gegecom83/archlinux-config/blob/main/commands.md)

- [Package Manager](https://github.com/gegecom83/archlinux-config/blob/main/pacman.md)

- [System maintenance](https://github.com/gegecom83/archlinux-config/blob/main/maintenance.md)

## Pre-configuration

```bash
loadkeys fr # Change Keyboard Layout
```

```bash
iwctl
station wlan0 connect your_wifi_name
your_password_wifi
exit
```

```bash
ping -c 4 archlinux.org # Check if I have access to the internet
```

```bash
timedatectl set-ntp true # Enable NTP to synchronize time within the live environment
timedatectl status # Check time status
```

## Prepare the disk

```bash
fdisk -l # Check the hard drives' name to select the one I want to install Arch Linux on
```

### Partition scheme

> EFI partition mounted on /boot --> 1G - FAT32  
> Swap partition --> [8G](https://itsfoss.com/swap-size/) - SWAP  
> Root partition mounted on / --> Left free space - EXT4

### Partition the disk  

```bash
fdisk /dev/nvme0n1 # Partitioning the disk I want to install Arch on
```

> Delete current partitions ---> **o** (This deletes every partitions, use the "d" option instead if you only want to delete specific partitions)  
> Create a GPT partition table (cause I use EFI) ---> **g**
>
> Create a 1G EFI partition ---> **n** ---> **+1G** as last sector  
> Create a 8G Swap partition ---> **n** ---> **+8G** as last sector  
> Create a Root partition with the left space ---> **n**
>
> Change the first partition type to EFI ---> **t** ---> partition 1 ---> type 1  
> Change the second partition type to Linux swap ---> **t** ---> partition 2 ---> type 19  
> Change the third partition type to Linux filesystem ---> **t** ---> partition 3 ---> type 20 (this should already be done by default)
>
> Print the current partition table to review changes ---> **p**  
> Write the table to the disk ---> **w**

### Create the filesystems

```bash
mkfs.fat -F32 /dev/nvme0n1p1 # Create the filesystem for the EFI partition
mkswap /dev/nvme0n1p2 # Create the filesystem for the Swap partition
swapon /dev/nvme0n1p2 # Enable the Swap partition on the system
mkfs.ext4 /dev/nvme0n1p3 # Create the filesystem for the Root partition
```

### Mount the partitions and install the system's base

```bash
mount /dev/nvme0n1p3 /mnt # Mount the Root partition on /mnt to install the system's base on it
mkdir -p /mnt/boot # Create the /boot directory in /mnt
mount /dev/nvme0n1p1 /mnt/boot # Mount the EFI partition on /boot
pacstrap /mnt base linux linux-firmware # Install the system's base on the Root partition
genfstab -U /mnt >> /mnt/etc/fstab # Generate the system's fstab
```

## Configure the system

### Chroot into the system

```bash
arch-chroot /mnt # Chroot in the new installed system's base on the root partition
```

### Configure pacman

```bash
pacman -S vim nano # Install my favorite editor
nano /etc/pacman.conf # Enable "multilib" repository for 32-bit library support, the "color" and "parallel downloads" options in pacman
```

> [...]  
> Color  
> [...]  
> VerbosePkgLists  
> ParallelDownloads = 10   
> [...]  
> [multilib]   
> Include = /etc/pacman.d/mirrorlist   
> [...]

### Language/Region configuration

```bash
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime # Set up the Region/TimeZone
hwclock --systohc # Synchronize the Hardware Clock
nano /etc/locale.gen # Uncomment the locale (for me: en_US.UTF-8 UTF-8)
locale-gen # Generate the locale
nano /etc/locale.conf # Set the LANG variable accordingly in this file (for me: LANG=en_US.UTF-8)
nano /etc/vconsole.conf # Set the Keymap in this file (for me: KEYMAP=fr)
```

### Host configuration

```bash
nano /etc/hostname # Create the hostname file and put the hostname in it
```

> archlinux

```bash
nano /etc/hosts # Edit the hosts file and add lines from the Arch Wiki ---> https://wiki.archlinux.org/index.php/Installation_guide#Network_configuration.
```

> 127.0.0.1        localhost  
> ::1              localhost  
> 127.0.1.1        archlinux.localdomain archlinux

### User configuration

```bash
passwd # Setup a password for the root account (optional) 
useradd -m gegecom83 # Create a "regular" user
passwd gegecom83 # Setup a password for the user
usermod -aG wheel gegecom83 # Add the user to the wheel group (for sudo usage)
```

### Install and configure sudo

```bash
pacman -S sudo # Install sudo
visudo # Uncomment the line that allows the wheel group members to use sudo on any command
```

> [...]  
> %wheel ALL=(ALL) ALL  
> [...]

### Use a more secure umask for the boot partition

This is to avoid warning with `bootctl install` in the next step.

```bash
vim /etc/fstab
```

> [...],fmask=**0077**,dmask=**0077**[...]

```bash
umount /boot
mount /boot
```

### Install and configure systemd-boot

```bash
pacman -S efibootmgr dosfstools mtools # Install packages for EFI boot. Also install "os-prober" if you wish to do a dual boot with another distro/OS
bootctl install
nano /boot/loader/loader.conf
```

> timeout 3  
> default arch.conf   
> console-mode max  
> editor no

```bash
nano /boot/loader/entries/arch.conf
```

> title Arch Linux  
> linux /vmlinuz-linux  
> initrd /initramfs-linux.img  
> options root=UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx rw # Run 'blkid' to get the UID of your root partition

```bash
nano /boot/loader/entries/arch-fallback.conf
```

> title Arch Linux (fallback)  
> linux /vmlinuz-linux  
> initrd /initramfs-linux-fallback.img  
> options root=UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx rw # Run 'blkid' to get the UID of your root partition

```bash
systemctl enable systemd-boot-update.service
```

### Install and enable Network

```bash
pacman -S networkmanager # Install "networkmanager" to manage my network connection
systemctl enable NetworkManager # Autostart NetworkManager at boot
```

### Install and enable Bluetooth support

```bash
pacman -S bluez bluez-utils 
systemctl enable --now bluetooth # Autostart bluetooth at boot
```

## Exit the system and reboot the computer

```bash
exit # Get out of the chroot
umount -l /mnt # Umount the /mnt mounted point
```

```bash
reboot # Reboot the computer to boot into the fresh Arch install
```

## Connect to Wi-Fi (if needed)

```bash
nmcli device wifi connect your_wifi_name password your_password_wifi
```

## Log in with the "regular" user previously created and install additional useful packages

```bash
sudo pacman -S devtools man-db man-pages bash-completion intel-ucode pacman-contrib # Additional useful packages and drivers. Install "amd-ucode" instead of "intel-ucode" if you have an AMD CPU
```

## Enable fstrim (for SSDs only - optional)

If you use SSDs, you can use `fstrim` to discard all unused blocks in the filesystem in order to improve performances.  
You can launch it manually by running `sudo fstrim -av`, but keep in mind that it is not recommended to launch it too frequently. It is commonly approved that running it once a week is a sufficient frequency for most desktop and server systems.

To launch `fstrim` automatically on a weekly basis, enable the associated systemd timer:

```bash
sudo systemctl enable --now fstrim.timer
```

## Enable NTP for automatic time sync

```bash
sudo timedatectl set-ntp true
```

## Check for errors

Check if any systemd services have failed:

```bash
systemctl --failed
```

Look for errors in the log files located in /var/log/, as well as high priority errors from the systemd log:

```bash
journalctl -p 3 -xb
```

## Base installation complete

Link to the installation and configuration procedure for desktop environment on Arch according to my preferences below (if needed):

- [Xfce](https://github.com/gegecom83/archlinux-config/blob/main/xfce.md)

- [GNOME](https://github.com/gegecom83/archlinux-config/blob/main/gnome.md)

- [Plasma](https://github.com/gegecom83/archlinux-config/blob/main/plasma.md)


