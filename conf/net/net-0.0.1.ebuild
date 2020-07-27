# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Deps and config for baseic networking"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	net-misc/dhcpcd
"

src_install() {
	dosym ../../init.d/dhcpcd \
		"${EPREFIX}/etc/runlevels/default/dhcpcd"
}
