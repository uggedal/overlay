# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Deps and config for an interactive environment"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	conf/base

	app-admin/sudo
	app-editors/vim
	app-misc/tmux
	app-shells/bash-completion
	sys-fs/ncdu
"

S="${WORKDIR}"

src_install() {
	doenvd "${FILESDIR}"/99editor

	insinto /etc
	doins "${FILESDIR}"/tmux.local.conf

	dobin "${FILESDIR}"/irc
	dobin "${FILESDIR}"/t

	insinto /etc/sudoers.d
	doins "${FILESDIR}"/sudo-nopasswd
}
