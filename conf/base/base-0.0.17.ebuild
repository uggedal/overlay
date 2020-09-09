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
	app-admin/needrestart
	app-admin/ps_mem
	app-portage/gentoolkit
	app-portage/smart-live-rebuild
	net-misc/chrony
	sys-process/cronie
	sys-process/htop
"

S="${WORKDIR}"

src_install() {
	doenvd "${FILESDIR}"/99local-base

	insinto /etc/bash/bashrc.d
	doins "${FILESDIR}"/local.sh

	insinto /etc
	doins "${FILESDIR}"/input.local.rc
	doins "${FILESDIR}"/logrotate.conf
	doins "${FILESDIR}"/locale.gen

	doenvd "${FILESDIR}"/02locale

	insinto /etc/sysctl.d
	newins "${FILESDIR}/sysctl.conf" local.conf

	dosym ../../init.d/cronie \
		"${EPREFIX}/etc/runlevels/default/cronie"
	dosym ../../init.d/chronyd \
		"${EPREFIX}/etc/runlevels/default/chronyd"
}

pkg_postinst() {
	locale-gen || die
	env-update || die
}