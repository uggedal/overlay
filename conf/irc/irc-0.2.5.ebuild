# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd

DESCRIPTION="Deps and config for irc"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	net-irc/weechat-autosort
	net-irc/weechat-colorize-nicks
"

S="${WORKDIR}"

src_install() {
	dosym ../../../../../usr/lib64/weechat/python/autosort.py \
		"${EPREFIX}/var/lib/weechat/python/autoload/autosort.py"
	dosym ../../../../../usr/lib64/weechat/python/colorize_nicks.py \
		"${EPREFIX}/var/lib/weechat/python/autoload/colorize_nicks.py"

}
