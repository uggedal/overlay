inherit versionator

MY_P="linux-${PV}"
KV_MAJOR=$(get_version_component_range 1 ${PV})

HOMEPAGE="http://git.uggedal.com/overlay"
SRC_URI="mirror://kernel/linux/kernel/v${KV_MAJOR}.x/${MY_P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"

DEPEND="dev-lang/perl
	sys-devel/bc"

S="${WORKDIR}"/${MY_P}

EXPORT_FUNCTIONS src_configure src_compile src_install pkg_postinst pkg_postrm

K_KERNELBIN_BASE_CONFIG="
	# Base:
	CONFIG_SYSVIPC=y
	CONFIG_MODULES=y
	CONFIG_MODULE_UNLOAD=y
	CONFIG_SMP=y

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
	local _arch=$ARCH
	unset ARCH

	{
		echo "$K_KERNELBIN_BASE_CONFIG" | sed 's/^[[:space:]]*//'
		cat "${FILESDIR}"/config
	} > .config
	yes "" | emake -j1 -s oldconfig
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
	local mkcfg= "${ROOT}"/usr/sbin/grub2-mkconfig
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
