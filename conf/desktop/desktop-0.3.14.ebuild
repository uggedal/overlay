# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd

DESCRIPTION="Deps and config for desktop environment"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"
IUSE="laptop"

RDEPEND="
	media-fonts/dejavu
	x11-misc/xdg-utils
	x11-libs/libnotify
	laptop? (
		dev-libs/light
		gui-apps/kanshi
	)
"

S="${WORKDIR}"

src_install() {
	doenvd "${FILESDIR}"/99local-desktop
}

pkg_postinst() {
	env-update || die
}
