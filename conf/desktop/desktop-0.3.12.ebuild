# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd

DESCRIPTION="Deps and config for desktop environment"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	app-shells/fzy
	dev-lang/rust-bin
	dev-libs/light
	media-fonts/dejavu
	media-fonts/ibm-plex
	media-gfx/imv
	gui-apps/grim
	gui-apps/kanshi
	gui-apps/mako
	gui-apps/poweralertd
	gui-apps/slurp
	gui-apps/waybar
	gui-apps/wl-clipboard
	gui-apps/wlsunset
	gui-wm/sway
	www-client/firefox-bin
	x11-misc/xdg-utils
	x11-libs/libnotify
	x11-terms/alacritty
"

S="${WORKDIR}"

src_install() {
	doenvd "${FILESDIR}"/99local-desktop

	dobin "${FILESDIR}/alacritty_menu"

	systemd_douserunit "${FILESDIR}/sway-session.target"
	systemd_douserunit "${FILESDIR}/swayidle.service"
	systemd_douserunit "${FILESDIR}/kanshi.service"
}

pkg_postinst() {
	env-update || die
}
