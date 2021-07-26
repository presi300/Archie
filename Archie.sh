#!/usr/bin/env bash
echo "Welcome to Archie! A simple terminal based installer for Arch linux"
echo ""
echo "Before we begin make sure all your partitions are formatted and mounted"
echo ""

#Enter hostname

echo "Now, let's begin by entering a hostname (CANNOT HAVE UPPERCASE LETTERS OR SPECIAL CHARACTERS LIKE #!@ AND OTHERS | RECCOMMENDED: archie)"
read hostname
echo "Before we continue... remember that this script doesn't check if you have entered something wrong... The only way to know that is if the system doesn't boot!! Please follow the instructions CAREFULLY!!"
echo ""
echo ""

#TimedatectNTP

timedatect set-ntp true

#GPT or MBR

echo ""
echo ""
echo "Now select if you have a BIOS or UEFI! Simply type 1 if your pc is older and has a BIOS or 2 if your pc is newer and has UEFI"
echo "1 - BIOS"
echo "2 - UEFI"
read bios

#Install Reflector

pacman -S reflector --noconfirm

#Country

echo ""
echo ""
echo "Enter which country you are in (1st letter should be capital)"
read country

reflector -c $country -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist

#Install Arch Linux

pacstrap /mnt base linux linux-firmware base-devel nano

#Stab!

genfstab -U /mnt >> /mnt/etc/fstab

#Chroot

arch-chroot /mnt

#Yes I set it to this by default...
timedatect set-timezone Europe/Sofia

#Locale gen

echo LANG="en_US.UTF-8" > /etc/locale.conf

#Hostname

echo $hostname > /etc/hostname
touch /etc/hosts
echo 127.0.0.1      localhost \n::1         localhost \n127.0.1.1       $hostname

#Dhcp

pacman -S dhcp
pacman -S dhcpcd
systemctl enable dhcpcd

#Root password

echo ""
echo ""
echo "Ok, now enter the root password"
passwd

#GRUB

if [ $bios -eq 1 ]
then
    echo ""
    echo ""
    echo "You have selected BIOS previously in the instalation. Please enter the name of the disk used for the instalation (like this: /dev/sdx and not /dev/sdx1 where /sdx is your disk ... DISK NOT PARTITION)"
    read bdisk
    pacman -S grub os-prober
    grub-install $bdisk
    grub-mkconfig -o /boot/grub/grub.cfg
elif [ $bios -eq 2 ]
    echo ""
    echo ""
    echo "You have selectec UEFI previously in the instalation. Please enter the name of your EFI boot partition (like this: /dev/sdx1 and not /dev/sdx where /sdx1 is your EFI partition)"
    read efdisk
    pacman -S grub efibootmgr
    mkdir /boot/efi
    mount $efdisk /boot/efi
    grub-install --target=x86_64-efi --bootloader-id=ARCHIE --efi-directory=/boot/efi
    grub-mkconfig -o /boot/grub/grub.cfg




