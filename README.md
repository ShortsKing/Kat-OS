# Oexis-OS
an operating system for ARMv7l architechture, or, more specifically, the raspberry pi. for contributers, it is required that you place a comment on every line of code, so that we know what is happening.

## Installing on Micro SD Card
installation is done through 2 steps: Building, and Installing
### Building
In lx_terminal enter the following commands:
```
make
```

### Installing
In lx_terminal enter the following commands:
```
# mount /dev/sda1 /mnt
# cp blink.img /mnt/kernel.img
# umount /mnt
```

## What is Happening When the OS is Run?
1. The BMC2835 SOC (specifically, the VideoCore IV GPU in it) loads the stage 1 boot loader from an on-chip ROM
    The stage 1 loader knows how to talk to the SD card controller and read FAT16/FAT32 file systems. It looks for a file called `bootcode.bin` on the first partition of the SD card, and loads it. `bootcode.bin` is the stage 2 boot loader.
2. The stage 2 loader loads `start.elf` from the SD card's first partition. This is the stage 3 boot loader.
3. The stage 3 loader then reads `config.txt` which acts a bit like a BIOS configuration configures the GPU and ARM processor loads `kernel.img` and releases the ARM processor to begin executing it

## Sources
 * [Programming the BMC2835 SOC](https://www.glennklockwood.com/embedded/bmc2835-gpio.html)
 * [BMC2835 Datasheet](https://datasheets.raspberrypi.org/bcm2835/bcm2835-peripherals.pdf)
 * [Raspberry Pi 0 Specs](https://cdn.sparkfun.com/assets/learn_tutorials/6/7/6/PiZero_1.pdf)

## Assembly Commands Learned:
 * **ldr**  
    `ldr reg, =val` put the number `val` in the register `reg`

 * **mov**  
      `mov reg,#val` moves the number 'val' into the register named 'reg'.
      
 * **lsl**  
      `lsl reg,#val` shifts the binary representation of the number in 'reg' by 'val' places to the left.
 
 * **str**  
    `str reg,[dest,#val]` stores the number in `reg` at the address given by `dest + val`.

 * **____:**  
    `name:` labels the next line `name`

 * **b**  
    `b label` causes the program to be execute line `label`.

 * **sub**
    `sub reg,#val` subtracts the number `val` from the value in `reg`.

 * **add**
    'add reg,#val' adds the number 'val' to the value in 'reg'
