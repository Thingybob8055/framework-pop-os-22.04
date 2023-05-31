# Pop!_OS 22.04 - Framework 12th Gen Laptop

This repo is just to provide a quick guide/script to set up Pop!_OS 22.04 on the Framework Laptop, this is for the 12th gen motherboard.
This may work on 13th Gen too, but I don't have once, hence cannot test it.

I have posted this as Framework has taken down the Pop!_OS guide and there may still be Linux users who will prefer to use Pop!_OS on their laptops.

Feel free to read through the script and run each command individually if you need to.

But if anyone notices an issue please raise an issue post, maybe it can be useful for others as well.

The script does the following:

- Update and upgrade via `apt`.
- Brightness keys fix.
- Power saving for SSD for better suspend battery life.
- Change from PSR2 (default) to PSR1 to fix potential flickering issue.
- Remove the deprecated `xserver-xorg-video-intel` driver.
- Asks if you want to use X11 with reduced resolution:
    - If **yes** it will add resolution 1692x1128 (a resolution used on some surface laptops for 100% scale), this will allow to comfortably use 100% scaling which works well on X11 (fractional scaling causes bad screen tearing), albeit at a reduced resolution. This is my preferred way of using Pop!_OS (as I personally found Pop!_OS to be a better overall experience on X11), as It's not too bad on the reduced resolution, but understandable if this is not a preferred option.
        - Change to this resolution in system settings.
    - If **no**, it will make modifications to the file in `/etc/gdm3/custom.conf` to enable Wayland. Log out and back in or reboot.
        - Select Wayland in the GDM login screen. 
- Install fingerprint drivers.
    - **Note:** You can set fingerprint in System Settings after this and will work fine with logging in and out. To use this in terminal for sudo commands, please see the last section.

## To use:

Run the following one by one:

```sh
git clone https://github.com/Thingybob8055/framework-pop-os-22.04.git

cd  framework-pop-os-22.04

chmod +x pop-script.sh

./pop-script
```

Enter `sudo` password where necessary.

**Note:** Please reboot after the script finishes.

## Enabling fingerprint for sudo

![](/images/pam.png)

- In terminal, run `sudo pam-auth-update`
- Up and Down arrow to select
- Space to check `Fingerprint Authentication`
- Tab to select `Ok` and then space again to exit