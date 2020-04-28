# Put rootfs out of git repo:
ROOTFS=$(realpath $DIR/../../rootfs)
DISTDIR=$DIR/distfiles
PKGDIR=$DIR/packages

MIRROR=mirror.mdfnet.se/gentoo


[ "$(id -u)" = 0 ] || exec sudo $0 "$@"

_mnt() {
	local typ=$1
	local dir=$2
	shift 2

	grep -q $ROOTFS/$dir /proc/mounts ||
		mount $typ $ROOTFS/$dir "$@"
}

mnt() {
	local d

	_mnt proc proc -t proc -o nosuid,noexec,nodev
	_mnt sys sys -t sysfs -o nosuid,noexec,nodev
	_mnt efivars sys/firmware/efi/efivars -t efivarfs -o nosuid,noexec,nodev
	_mnt udev dev -t devtmpfs -o mode=0755,nosuid
	_mnt devpts dev/pts -t devpts -o mode=0620,gid=5,nosuid,noexec
	_mnt shm dev/shm -t tmpfs -o mode=1777,nosuid,nodev
	_mnt /run run --bind
	_mnt tmp tmp -t tmpfs -o mode=1777,strictatime,nodev,nosuid

	mkdir -p $ROOTFS/usr/local/portage
	_mnt $(readlink -f $DIR/..) usr/local/portage --bind
}

_umnt() {
	umount $ROOTFS/$1
}

umnt() {
	_umnt usr/local/portage

	_umnt tmp
	_umnt run
	_umnt dev/shm
	_umnt dev/pts
	_umnt dev
	_umnt sys/firmware/efi/efivars
	_umnt sys
	_umnt proc
}

conf() {
	mkdir -p $ROOTFS/etc/portage/repos.conf
	cat <<-EOF >$ROOTFS/etc/portage/repos.conf/uggedal.conf
	[uggedal]
	location = /usr/local/portage
	masters = gentoo
	auto-sync = no
	EOF

	cat <<-EOF >$ROOTFS/etc/portage/make.conf
	USE=""
	MAKEOPTS="--jobs=4 --load-average=4.0"
	EMERGE_DEFAULT_OPTS="--jobs=4 --load-average=4.0"
	FEATURES="buildpkg"

	GENTOO_MIRRORS="https://$MIRROR/"

	DISTDIR="/usr/local/portage/build/distfiles"
	PKGDIR="/usr/local/portage/build/packages"

	LC_MESSAGES=C
	EOF

	# Unable to use */* atom in profile packages.use:
	cat <<-EOF >$ROOTFS/etc/portage/package.use/python
	*/* PYTHON_TARGETS: -python2_7 -python3_6 python3_7
	*/* PYTHON_SINGLE_TARGET: -* python3_7

	# Autonake test depend on python 2.7:
	sys-devel/automake -test
	EOF

	rm -f $ROOTFS/etc/portage/make.profile
	ln -s ../../usr/local/portage/profiles/amd64 \
		$ROOTFS/etc/portage/make.profile

	cp /etc/resolv.conf $ROOTFS/etc/

	cp $DIR/world $ROOTFS/var/lib/portage/world

	rm -rf $ROOTFS/etc/portage/savedconfig
	cp -r $DIR/savedconfig $ROOTFS/etc/portage

	local locale='en_US.UTF-8 UTF-8'

	if ! grep -q "^$locale\$" $ROOTFS/etc/locale.gen; then
		echo "$locale" >> $ROOTFS/etc/locale.gen
		chroot $ROOTFS locale-gen
	fi
}


trap umnt INT TERM EXIT
