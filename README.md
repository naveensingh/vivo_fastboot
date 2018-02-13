# vivo_fastboot
Modified fastboot sources to unlock vivo phones
How to use :-

Lock vivo bootloader   :  fastboot bbk lock_vivo 

Unlock vivo bootloader :  fastboot bbk unlock_vivo

This binary can be compiled using any toolchain (on linux only) or using the official method by downloading whole AOSP source.
If you want to compile for windows, you robably have to use the whole AOSP source.

How to compile :-

Suggested toolchain : http://downloads.yoctoproject.org/releases/yocto/yocto-1.5/toolchain/

Depending on your host machine select either x86_64 or i686 on the page, and then choose the file appropriate for your target hardware. If you are on a 64bit computer then download poky-eglibc-x86_64-core-image-sato-x86_64-toolchain-1.5.sh, since we want to run  fastboot on an x86_64 architecture later on.

Assuming it was downloaded into Downloads, execute the script

   chmod a+x ~/Downloads/poky-eglibc-x86_64-core-image-sato-x86_64-toolchain-1.5.sh ~/Downloads/poky-eglibc-x86_64-core-image-sato-x86_64-toolchain-1.5.sh

You will be asked where you want to install the toolchain (default location is /opt/poky).

Now clone the following aosp sources using git from android.googlesource.com (android-4.4_r**)

platform/system/core, platform/system/extras, /platform/external/libselinux, /platform/external/zlib, /platform/external/openssl. 

Now navigate to platform/system/core/ directory 

type git clone https://github.com/NaveenStark/vivo_fastboot.git fastboot

Now the vivo_fastboot source will be downloaded in fastboot directory with a custom makefile for our toolchain.

Now type make within fastboot directory to compile the fastboot binary.

if you get compile error, it's most likely due to toolchain, edit makefile to point to your toolchain.
If you want to add support for more commands, just search "vivo_bsp" in fastboot.c, & replace it with your desired commmand.
