#!/usr/bin/env bash
clear
echo "Welcome to Archie! A simple terminal based installer for Arch linux"
echo "-------------------------------------------------------------------"
echo "Before we begin make sure all your partitions are formatted and mounted"
echo "Press enter to begin"
read pressenter

#Disclaimer

clear
echo ""
echo "IMPORTANT!"
echo "-------------------------------------------------------------------"
echo "The installer does not check what you have entered."
echo "Make sure to follow all instructions carefully."
echo "If the script errors out or you mistype something"
echo "format your root partition by doing |mkfs.ext4 /dev/sdx1|"
echo "[Where /dev/sdx1 is your root partition]"
echo "and type |bash Archie.sh|"
echo "-------------------------------------------------------------------"
echo "Press enter to continue..."
read er
pacman -S vi --noconfirm

#Partition

clear
echo "Let's begin by partitioning our disks."
echo "-------------------------------------------------------------------"
echo "If you don't know what to do here, "
echo "Type 1 to view the partitioning help..."
echo "Press enter to continue without viewing the help file..."
read help
if [ $help -eq 1 ]
then
    vi PARTHELP.txt
    echo "Press enter to enter the partition tool"
    read ex
fi
cfdisk

#TimedatectNTP

timedatectl set-ntp true

#Country

clear
echo ""
echo ""
echo "Enter which country you are in (1st letter should be capital)"
read country

#Reflector

pacman -S reflector --noconfirm
reflector -c $country -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist

#Install Arch Linux

clear
echo "Select a kernel type"
echo "[If unsure, chose option 1]"
echo "-------------------------------------------------------------------"
echo "1 - Linux"
echo "2 - Linux-lts"
read gr
if [ $gr -eq 1 ]
then
    pacstrap /mnt base linux linux-firmware base-devel nano
elif [ $gr -eq 2 ]
then
    pacstrap /mnt base linux-lts linux-firmware base-devel nano
fi

#Stab!

genfstab -U /mnt >> /mnt/etc/fstab

#Clone Archie2

git clone https://github.com/presi300/ArchieP2 /mnt/Archie2
cp /mnt/Archie2/Archie2.sh /mnt
chmod +rx /mnt/Archie2.sh

#Chroot

arch-chroot /mnt /bin/bash -c ./Archie2.sh

#Proceed to Archie2






