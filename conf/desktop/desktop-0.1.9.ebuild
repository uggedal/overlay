# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Deps and config for desktop environment"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"
IUSE="vncserver vncclient"

RDEPEND="
	app-shells/fzy
	media-fonts/dejavu
	media-fonts/ibm-plex
	media-gfx/imv
	gui-apps/grim
	gui-apps/slurp
	gui-apps/waybar
	gui-apps/wl-clipboard
	gui-wm/sway
	x11-misc/xdg-utils
	dev-lang/rust-bin
	x11-terms/alacritty
	www-client/luakit
	www-client/qutebrowser
	www-client/firefox-bin
	vncserver? ( gui-apps/wayvnc )
	vncclient? ( gui-apps/wlvncc )
"

S="${WORKDIR}"

src_install() {
	doenvd "${FILESDIR}"/99local-desktop

	dobin "${FILESDIR}/alacritty_menu"

	if use vncclient; then
		dobin "${FILESDIR}/vnc"
	fi
}

pkg_postinst() {
	env-update || die
}
