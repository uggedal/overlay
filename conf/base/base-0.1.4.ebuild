# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Deps and config for all environments"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	app-admin/logrotate
"

S="${WORKDIR}"

src_install() {
	doins "${FILESDIR}"/logrotate.conf

	dosym ../../../../lib/systemd/system/systemd-timesyncd.service \
		"${EPREFIX}/etc/systemd/system/multi-user.target.wants/systemd-timesyncd.service"

	dosym ../../../../lib/systemd/system/logrotate.timer \
		"${EPREFIX}/etc/systemd/system/timers.target.wants/logrotate.timer"
}
