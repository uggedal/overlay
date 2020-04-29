EAPI=7

DESCRIPTION="Linux initramfs for Skylake desktop"

SLOT="0"
KEYWORDS="amd64"

DEPEND="sys-fs/mdadm[static]"

S="${WORKDIR}"

src_compile() {
	mkdir -p bin lib dev etc mnt/root proc root sbin sys
	cp -a /dev/{null,console,tty,md0,sda*,sdb*} dev/
	cp -a /sbin/mdadm bin/

	mdadm --detail --scan /dev/md0 > etc/mdadm.conf

	cat <<-EOF >init
	#!/bin/busybox sh

	mount -t proc none /proc
	mount -t sysfs none /sys

	mdadm --assemble --scan

	mount -o ro /dev/md0 /mnt/root
	umount /proc
	umount /sys
	exec switch_root /mnt/root /sbin/init
	EOF

	chmod +x init

	find . -print0 | cpio --null --create --verbose --format=newc |
		gzip --best > initramfs.cpio.gz
}

src_install() {
	insinto /boot
	doins initramfs.cpio.gz
}
