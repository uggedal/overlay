# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Deps and config for baseic networking"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"
IUSE="wired wireless"
REQUIRED_USE="^^ ( wired wireless )"

RDEPEND="
	wireless? ( net-wireless/iwd )
"

S="${WORKDIR}"

src_install() {
	if use wired; then
		insinto /etc/systemd/network
		doins "${FILESDIR}/wired.network"
	fi

	dosym ../../../../lib/systemd/system/systemd-networkd.service \
		"${EPREFIX}/etc/systemd/system/multi-user.target.wants/systemd-networkd.service"

	dosym ../run/systemd/resolve/stub-resolv.conf \
		"${EPREFIX}/etc/resolv.conf"
	dosym ../../../../lib/systemd/system/systemd-resolved.service \
		"${EPREFIX}/etc/systemd/system/multi-user.target.wants/systemd-resolved.service"
}
