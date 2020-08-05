# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Deps and config for baseic networking"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"
IUSE="wired wireless"
REQUIRED_USE="^^ (wired wireless)"

RDEPEND="
	wired? ( net-misc/dhcpcd )
	wireless? ( net-wireless/iwd )
"

S="${WORKDIR}"

src_install() {
	if use wired; then
		dosym ../../init.d/dhcpcd \
			"${EPREFIX}/etc/runlevels/default/dhcpcd"
	fi

	if use wireless; then
		insinto /etc
		doins "${FILESDIR}"/resolv.conf

		insinto /etc/iwd
		newins "${FILESDIR}"/iwd.conf main.conf

		dosym ../../init.d/iwd \
			"${EPREFIX}/etc/runlevels/default/iwd"
	fi
}
