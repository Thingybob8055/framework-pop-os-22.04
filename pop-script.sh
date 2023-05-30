#!/bin/sh

sudo apt update && sudo apt upgrade -y && echo "options snd-hda-intel model=dell-headset-multi" | sudo tee -a /etc/modprobe.d/alsa-base.conf && echo "blacklist hid_sensor_hub" | sudo tee -a /etc/modprobe.d/framework-als-blacklist.conf && sudo update-initramfs -u && sudo kernelstub -a nvme.noacpi=1 && sudo kernelstub -a i915.enable_psr=1 && sudo apt remove xserver-xorg-video-intel

# ask for y/n confirmation, if yes add resolution to .profile
read -p "Do you want to use X11 and use reduced resultion? (y/n)" answer
case ${answer:0:1} in
    y|Y )
        xrandr --newmode "1692x1128_60.00"  159.25  1692 1808 1984 2272  1128 1131 1141 1170 -hsync +vsync && xrandr --addmode eDP-1 "1692x1128_60.00" && echo "xrandr --newmode "1692x1128_60.00"  159.25  1692 1808 1984 2272  1128 1131 1141 1170 -hsync +vsync" >> ~/.profile && echo "xrandr --addmode eDP-1 "1692x1128_60.00"" >> ~/.profile && echo -e "\e[31m[INFO] Change Display Resolution to 1692x1128 in System Settings\e[0m\n" && echo "export MOZ_USE_XINPUT2=1" >> ~/.profile
    ;;
    * )
        # output red colour hello text
        sudo sed -i '7s/.*/#WaylandEnable=false/' /etc/gdm3/custom.conf && echo "export MOZ_ENABLE_WAYLAND=1" >> ~/.profile &&
        echo -e "\e[31m[INFO] Please use Wayland if you selected no\e[0m"
    ;;
esac

sudo apt install fprintd libpam-fprintd && echo -e "\e[31m[INFO] Please reboot! \nIf you selected not to use X11, select Wayland when at the login prompt, and use fractional scaling at 150% for the best experience\e[0m"
