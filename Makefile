all:
	zig build
	mkdir -p isodir/boot/grub
	cp zig-out/bin/kernel.elf isodir/boot/kernel.elf
	cp grub.cfg isodir/boot/grub/grub.cfg
	grub-mkrescue -o kernel.iso isodir

run:
	qemu-system-x86_64 -cdrom kernel.iso

clean:
	rm -rf isodir zig-out kernel.iso .zig-cache
