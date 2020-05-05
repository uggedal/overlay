# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vim-plugin vcs-snapshot

REF="da5a7ac96f517e0fd6f886bc3fbe27156ca1f946"
MY_PN="vim-${PN}"

DESCRIPTION="vim syntax: markdown"
HOMEPAGE="https://github.com/plasticboy/vim-markdown"
SRC_URI="https://github.com/plasticboy/${MY_PN}/archive/${REF}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"

VIM_PLUGIN_HELPFILES="${MY_PN}.txt"

src_prepare() {
	default

	# Remove unwanted files:
	rm -r registry test || die
}
