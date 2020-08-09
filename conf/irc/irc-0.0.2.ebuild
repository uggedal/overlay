# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Deps and config for irc"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	acct-user/weechat
	net-irc/weechat
"

S="${WORKDIR}"

src_install() {
	newinitd "${FILESDIR}"/weechat.initd weechat

	dosym ../../init.d/weechat \
		"${EPREFIX}/etc/runlevels/default/weechat"

	insinto /var/lib/weechat
	newins "${FILESDIR}"/tmux.conf .tmux.conf
}
