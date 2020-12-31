# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Deps and config for development environment"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	conf/cli
	app-shells/fzy
	app-vim/buftabline
	app-vim/commentary
	app-vim/easydir
	app-vim/eunuch
	app-vim/lastplace
	app-vim/picker
	app-vim/selenized
	dev-vcs/git
	sys-apps/the_silver_searcher
"

S="${WORKDIR}"

src_install() {
	doenvd "${FILESDIR}"/99local-dev

	insinto /etc
	doins "${FILESDIR}"/gitconfig
	insinto /etc/vim
	doins "${FILESDIR}"/vim.local.rc

	dobin "${FILESDIR}"/f
}
