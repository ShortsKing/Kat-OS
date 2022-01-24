## Kat-OS
![Version][Screen04] ![USB][NoUSB]<br>
an operating system for the katos-katos. for contributers, it is required that you place a comment on every line of code, so that we know what is happening.

## Building
building is done in the linux terminal with the following commands:
`as -o <asmFilename>.o <asmFilename>.s`  
for every ASM file.  
ex: `as -o main.o main.s`  
then, we link the all the object files with the following command:
`ld -o <progname> <objectFile1>.o <objectFile2>.o <etc.>.o`
ex: `ld -o Kat-OS main.o screen.o background.o  division.o`
That should produce a linux executable ready to be run with `./progName`, ex. `./Kat-OS`. once the executable is ready, put it on top of the linux kernel and run. (Not sure how to do the last step? We arent either. Email oexisinc@gmail.com if you know!)

## What is Happening When the OS is Run?
1. The BMC2835 SOC (specifically, the VideoCore IV GPU in it) loads the stage 1 boot loader from an on-chip ROM
    The stage 1 loader knows how to talk to the SD card controller and read FAT16/FAT32 file systems. It looks for a file called `bootcode.bin` on the first partition of the SD card, and loads it. `bootcode.bin` is the stage 2 boot loader.
2. The stage 2 loader loads `start.elf` from the SD card's first partition. This is the stage 3 boot loader.
3. The stage 3 loader then reads `config.txt` which acts a bit like a BIOS configuration configures the GPU and ARM processor loads `kernel.img` and releases the ARM processor to begin executing it

## Sources
 * [Programming the BMC2835 SOC](https://www.glennklockwood.com/embedded/bmc2835-gpio.html)
 * [BCM2835 Datasheet](https://datasheets.raspberrypi.org/bcm2835/bcm2835-peripherals.pdf)
   * Page 65 - EMMC Memory Management
   * Page 89 - GPIO
   * Page 109 - Interrupts
   * Pages 172 and 196 - Timer
   * Page 200 - USB
 * [Raspberry Pi 0 Specs](https://cdn.sparkfun.com/assets/learn_tutorials/6/7/6/PiZero_1.pdf)
 * [Baking Pi - Operating Systems Development](https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/downloads.html)
 * [ARM reference](https://www.keil.com/support/man/docs/armasm/armasm_dom1361289850039.htm)
 * [./ raspberry-pi-os](https://s-matyukevich.github.io/raspberry-pi-os/docs/lesson01/rpi-os.html)
 * [Linux from Scratch](https://www.linuxfromscratch.org/lfs/read.html)
 * [RPi Assembly Language (Book)](https://www.brucesmith.info/rosal.html)

## Next Steps:
 * Figure out how to do division without division
 * make screen library (low res)
 * figure out how to put the program on top of linux kernel

### Kat-OS
##### For the Katos-Katos
[OK01]: https://img.shields.io/badge/Version-OK01-blue
[OK02]: https://img.shields.io/badge/Version-OK02-blue
[OK03]: https://img.shields.io/badge/Version-OK03-blue
[OK04]: https://img.shields.io/badge/Version-OK04-blue
[OK05]: https://img.shields.io/badge/Version-OK05-blue
[Screen01]: https://img.shields.io/badge/Version-Screen01-blue
[Screen02]: https://img.shields.io/badge/Version-Screen02-blue
[Screen03]: https://img.shields.io/badge/Version-Screen03-blue
[Screen04]: https://img.shields.io/badge/Version-Screen04-blue
[Input01]: https://img.shields.io/badge/Version-Input01-blue
[Input02]: https://img.shields.io/badge/Version-Input02-blue

[NoUSB]: https://img.shields.io/badge/USB-No-brightgreen
[USB]: https://img.shields.io/badge/USB-Yes-brightgreen
