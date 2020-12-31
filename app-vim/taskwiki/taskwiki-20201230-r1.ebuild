# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9} )

inherit vim-plugin python-single-r1 vcs-snapshot

REF="b280e28ac8076a82d084a0b0be96c4edf6592636"

DESCRIPTION="vim plugin: comment stuff out"
HOMEPAGE="https://github.com/tools-life/taskwiki"
SRC_URI="https://github.com/tools-life/${PN}/archive/${REF}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	app-misc/task
	app-vim/ansiesc
	app-vim/taskwarrior
	app-vim/vimwiki
	$(python_gen_cond_dep 'dev-python/tasklib[${PYTHON_MULTI_USEDEP}]')
	app-editors/vim[python,${PYTHON_SINGLE_USEDEP}]
	${PYTHON_DEPS}"

VIM_PLUGIN_HELPFILES="${PN}.txt"

src_prepare() {
	default

	rm Makefile
}
