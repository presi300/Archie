#!/usr/bin/env bash
clear
echo "Welcome to Archie! A simple terminal based installer for Arch linux"
echo "-------------------------------------------------------------------"
echo "Before we begin make sure all your partitions are formatted and mounted"
echo "Press enter to begin"
read pressenter

#TimedatectNTP

timedatectl set-ntp true

#Country

echo ""
echo ""
echo "Enter which country you are in (1st letter should be capital)"
read country

#Reflector

pacman -S reflector --noconfirm
reflector -c $country -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist

#Install Arch Linux

pacstrap /mnt base linux linux-firmware base-devel nano

#Stab!

genfstab -U /mnt >> /mnt/etc/fstab

#Clone Archie2

git clone https://github.com/presi300/ArchieP2 /mnt/Archie2
cp /mnt/Archie2/Archie2.sh /mnt
chmod +rx /mnt/Archie2.sh

#Chroot

arch-chroot /mnt /bin/bash -c ./Archie2.sh

#Proceed to Archie2




