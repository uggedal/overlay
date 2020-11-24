# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Deps and config for storage environment"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	app-admin/hddtemp
	sys-apps/hdparm
	sys-apps/smartmontools
	sys-fs/cryptsetup
	sys-fs/mergerfs

	sys-fs/zfs
"

S="${WORKDIR}"

src_install() {
	insinto /etc
	doins "${FILESDIR}"/smartd.conf

	dosym ../../../../lib/systemd/system/smartd.service \
		"${EPREFIX}/etc/systemd/system/multi-user.target.wants/smartd.service"
}
