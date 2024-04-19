build-kernel: clean compile-boot compile-kernel link-kernel check-multiboot

clean: 
	@rm -rf bin
	@mkdir bin

compile-boot:
	${HOME}/opt/cross/bin/i686-elf-as src/boot.s -o bin/boot.o
	@echo "Boot Compiled"

compile-kernel:
	${HOME}/opt/cross/bin/i686-elf-gcc -c src/kernel.c -o bin/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
	@echo "Kernel Compiled"

link-kernel:
	${HOME}/opt/cross/bin/i686-elf-gcc -T src/linker.ld -o bin/myos.bin -ffreestanding -O2 -nostdlib bin/boot.o bin/kernel.o -lgcc
	@echo "Kernel Linked"

check-multiboot:
	@grub-file --is-x86-multiboot bin/myos.bin
	@echo "Multiboot Ok"

run-kernel:
	@qemu-system-i386 -kernel bin/myos.bin
