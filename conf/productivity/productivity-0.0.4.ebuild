# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Deps and config for productivity environment"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	conf/dev
	app-vim/taskwiki
"

S="${WORKDIR}"

src_install() {
	insinto /etc/vim/vim.local.d
	doins "${FILESDIR}"/productivity.vim

	dobin "${FILESDIR}"/vimwiki-diary-template

	insinto /etc/bash/bashrc.d
	doins "${FILESDIR}"/productivity.sh
}
