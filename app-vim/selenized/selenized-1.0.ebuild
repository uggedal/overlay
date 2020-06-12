# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vim-plugin

DESCRIPTION="vim colorscheme fine-tuned for readability"
HOMEPAGE="https://github.com/jan-warchol/selenized"
SRC_URI="https://github.com/jan-warchol/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

S="${WORKDIR}/${P}/editors/vim"

src_prepare() {
	default

	# Remove unwanted files:
	rm *.colortemplate || die
}
