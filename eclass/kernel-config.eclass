HOMEPAGE="https://github.com/uggedal/overlay"

LICENSE="GPL-2"
SLOT="0"

S="${WORKDIR}"

EXPORT_FUNCTIONS src_configure src_install

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

	# Multilib:
	CONFIG_IA32_EMULATION=y

	# Stats (htop)
	CONFIG_TASKSTATS=y
	CONFIG_TASK_XACCT=y
	CONFIG_TASK_IO_ACCOUNTING=y

	# Systemd
	CONFIG_AUTOFS_FS=y
	CONFIG_CRYPTO_HMAC=y
	CONFIG_BPF_SYSCALL=y
	CONFIG_CHECKPOINT_RESTORE=y

	# Cgroups:
	CONFIG_CGROUPS=y
	CONFIG_CGROUP_SCHED=y
	CONFIG_FAIR_GROUP_SCHED=y
	CONFIG_CFS_BANDWIDTH=y
	CONFIG_CGROUP_BPF=y

	# Namespaces:
	CONFIG_NAMESPACES=y
	CONFIG_IPC_NS=y
	CONFIG_NET_NS=y
	CONFIG_USER_NS=y
"

kernel-config_src_configure() {
	{
		echo "$K_KERNELCFG_BASE_CONFIG" | sed 's/^[[:space:]]*//'
		cat "${FILESDIR}"/config
	} > base_config
}

kernel-config_src_install() {
	insinto /etc/portage/savedconfig/sys-kernel
	newins base_config gentoo-kernel
}
