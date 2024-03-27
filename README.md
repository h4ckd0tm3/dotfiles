### Step 1: disable System Integrity Protection

1. Turn off your device
2. **Intel [(apple docs)](https://support.apple.com/en-gb/guide/mac-help/mchl338cf9a8/12.0/mac/12.0):**  
Hold down <kbd>command ⌘</kbd><kbd>R</kbd> while booting your device.  
 
   **Apple Silicon [(apple docs)](https://support.apple.com/en-gb/guide/mac-help/mchl82829c17/12.0/mac/12.0):**  
Press and hold the power button on your Mac until “Loading startup options” appears.  
Click Options, then click Continue.
3. In the menu bar, choose `Utilities`, then `Terminal`
4.
```bash
#
# APPLE SILICON
#

# If you're on Apple Silicon macOS 13.x.x
# Requires Filesystem Protections, Debugging Restrictions and NVRAM Protection to be disabled
# (printed warning can be safely ignored)
csrutil enable --without fs --without debug --without nvram

#
# INTEL
#

# If you're on Intel macOS 13.x.x, 12.x.x, or 11.x.x
# Requires Filesystem Protections and Debugging Restrictions to be disabled (workaround because --without debug does not work)
# (printed warning can be safely ignored)
csrutil disable --with kext --with dtrace --with nvram --with basesystem
```

5. Reboot
6. For Apple Silicon; enable non-Apple-signed arm64e binaries `sudo nvram boot-args=-arm64e_preview_abi`
7. Reboot
8. You can verify that System Integrity Protection is turned off by running `csrutil status`, which returns `System Integrity Protection status: disabled.` if it is turned off (it may show `unknown` for newer versions of macOS when disabling SIP partially).
   
### Step 2:


### Usefull Links
https://macos-defaults.com/