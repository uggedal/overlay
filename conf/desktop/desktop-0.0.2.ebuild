# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Deps and config for desktop environment"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	app-shells/fzy
	media-fonts/dejavu
	media-fonts/ibm-plex
	gui-wm/sway
	x11-terms/alacritty
	www-client/firefox-bin
"

src_install() {
	dobin "${FILESDIR}"/alacritty_menu"
}
