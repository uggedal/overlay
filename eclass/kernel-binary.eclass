MY_P="linux-${PV}"
KV_MAJOR=$(ver_cut 1 ${PV})

HOMEPAGE="http://git.uggedal.com/overlay"
SRC_URI="mirror://kernel/linux/kernel/v${KV_MAJOR}.x/${MY_P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"

DEPEND="dev-lang/perl
	sys-devel/bc
	virtual/libelf"

S="${WORKDIR}"/${MY_P}

EXPORT_FUNCTIONS src_configure src_compile src_install pkg_postinst pkg_postrm

K_KERNELBIN_BASE_CONFIG="
	# Base:
	CONFIG_SYSVIPC=y
	CONFIG_MODULES=y
	CONFIG_MODULE_UNLOAD=y
	CONFIG_SMP=y

	# Devices:
	CONFIG_PCI=y

	# Block:
	CONFIG_BLK_DEV_SD=y
	CONFIG_ATA=y

	# Net:
	CONFIG_NET=y
	CONFIG_PACKET=y
	CONFIG_UNIX=y
	CONFIG_INET=y
	CONFIG_NETDEVICES=y
	CONFIG_INPUT_EVDEV=y

	# Fs:
	CONFIG_EXT4_FS=y
	CONFIG_EXT4_FS_POSIX_ACL=y
	CONFIG_EXT4_FS_SECURITY=y
	CONFIG_TMPFS=y
	CONFIG_TMPFS_POSIX_ACL=y
	CONFIG_DEVTMPFS=y
	CONFIG_PROC_FS=y

	# Namespaces:
	CONFIG_CGROUPS=y
	CONFIG_NAMESPACES=y
	CONFIG_IPC_NS=y
	CONFIG_NET_NS=y
"

kernel-binary_src_configure() {
	local c errors
	local _arch=$ARCH
	unset ARCH

	{
		echo "$K_KERNELBIN_BASE_CONFIG" | sed 's/^[[:space:]]*//'
		cat "${FILESDIR}"/config
	} > base_config
	cp base_config .config
	yes "" | emake -j1 -s oldconfig

	# Check that all wanted config options were used:
	for c in $(grep '^CONFIG_.*=[ym]$' base_config); do
		if ! grep -q "^$c\$" .config; then
			ewarn "Missing config: $c"
			errors=yes
		fi
	done

	# Check that all unwanted config options were unset:
	for c in $(grep '^CONFIG_.*=n$' base_config); do
		if ! grep -q "^# ${c%=*} is not set\$" .config; then
			ewarn "Unwanted config: $c"
			errors=yes
		fi
	done

	if [ "$errors" = yes ]; then
		die "Aborted due to errors config options"
	fi

	ARCH=$_arch
}

kernel-binary_src_compile() {
	local _arch=$ARCH
	unset ARCH

	emake

	ARCH=$_arch
}

kernel-binary_src_install() {
	dodir /boot
	emake modules_install install \
		INSTALL_MOD_PATH="${ED}" \
		INSTALL_PATH="${ED}"/boot
}

kernel-binary_grub2_mkconfig() {
	local mkcfg="${ROOT}"usr/sbin/grub2-mkconfig
	if [ -x "${mkcfg}" ]; then
		"${mkcfg}" -o /boot/grub/grub.cfg
	else
		ewarn "Unable to find ${mkcfg}"
	fi
}

kernel-binary_pkg_postinst() {
	kernel-binary_grub2_mkconfig
}

kernel-binary_pkg_postrm() {
	kernel-binary_grub2_mkconfig
}
