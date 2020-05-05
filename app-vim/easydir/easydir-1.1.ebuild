# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vim-plugin vcs-snapshot

MY_PN="vim-${PN}"

DESCRIPTION="vim plugin: create parent dirs when saving files"
HOMEPAGE="https://github.com/duggiefresh/vim-easydir"
SRC_URI="https://github.com/duggiefresh/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"

VIM_PLUGIN_HELPFILES="${PN}.txt"

src_prepare() {
	default

	# Remove unwanted files:
	rm doc/.gitignore || die
}
