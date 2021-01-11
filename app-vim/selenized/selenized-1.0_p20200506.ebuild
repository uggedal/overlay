# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vim-plugin vcs-snapshot

REF="e93e0d9fb47c7485f18fa16f9bdb70c2ee7fb5db"

DESCRIPTION="vim colorscheme fine-tuned for readability"
HOMEPAGE="https://github.com/jan-warchol/selenized"
SRC_URI="https://github.com/jan-warchol/${PN}/archive/${REF}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

S="${WORKDIR}/${P}/editors/vim"

src_prepare() {
	default

	# Remove unwanted files:
	rm *.colortemplate || die
}
