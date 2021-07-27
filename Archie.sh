#!/usr/bin/env bash
clear
echo "Welcome to Archie! A simple terminal based installer for Arch linux"
echo ""
echo "Before we begin make sure all your partitions are formatted and mounted"
echo ""
echo "Press enter to begin"
read pressenter

#TimedatectNTP

timedatectl set-ntp true

#Continent

echo ""
echo ""
echo "Enter which continent you are currently in (1st letter should be capital)"
read continent

#Country

echo ""
echo ""
echo "Enter which country you are in (1st letter should be capital)"
read country

#City
echo ""
echo ""
echo "Enter which city you are in [Or a larger city in your area] (1st letter should be capital)"
echo "For cities with more than one word in their name shound have an underscore between the names (EXAMPLE: New_York)"
read city

#Timezone

timedatect set-timezone $continent/$city

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




