# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Deps and config for work environment"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	conf/productivity
	dev-python/pip
	dev-vcs/git-crypt
	net-dns/ldns-utils
"

S="${WORKDIR}"

src_install() {
	insinto /etc/vim/vim.local.d
	doins "${FILESDIR}"/work.vim

	insinto /etc/bash/bashrc.d
	doins "${FILESDIR}"/work.sh

	dobin "${FILESDIR}"/vimwiki-work-diary-template
}
