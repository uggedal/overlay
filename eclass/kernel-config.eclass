HOMEPAGE="https://github.com/uggedal/overlay"

LICENSE="GPL-2"
SLOT="0"

DEPEND="dev-lang/perl
	sys-devel/bc
	virtual/libelf"

S="${WORKDIR}"

EXPORT_FUNCTIONS src_configure src_install pkg_postinst

K_KERNELCFG_BASE_CONFIG="
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

kernel-config_src_configure() {
	{
		echo "$K_KERNELCFG_BASE_CONFIG" | sed 's/^[[:space:]]*//'
		cat "${FILESDIR}"/config
	} > base_config
}

kernel-config_src_install() {
	insinto /etc/kernels
	newins base_config "${P}"
}

kernel-config_pkg_postinst() {
	local c errors
	local cfg="${EROOT}/etc/kernels/${P}"
	local kern="${EROOT}/usr/src/linux"
	local _arch=$ARCH
	unset ARCH

	cd "${kern}" || die "No kernel source in ${kern}"

	cp -f .config config_orig
	einfo "Backed up original config"

	cp "${cfg}" .config
	yes "" | emake -j1 -s oldconfig || die "Unable to make oldconfig"
	einfo "Made oldconfig"

	# Check that all wanted config options were used:
	for c in $(grep '^CONFIG_.*=[ym]$' "${cfg}"); do
		if ! grep -q "^$c\$" .config; then
			ewarn "Missing config: $c"
			errors=yes
		fi
	done
	einfo "Checked wanted options"

	# Check that all unwanted config options were unset:
	for c in $(grep '^CONFIG_.*=n$' /etc/kernels/"${cfg}"); do
		if ! grep -q "^# ${c%=*} is not set\$" .config; then
			ewarn "Unwanted config: $c"
			errors=yes
		fi
	done
	einfo "Checked unwanted options"

	cp -f config_orig .config
	einfo "Restored original config"

	if [ "$errors" = yes ]; then
		die "Aborted due to errors config options"
	fi

	einfo "Config passed sanity checks"

	ARCH=$_arch
}
