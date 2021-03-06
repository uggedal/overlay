# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vim-plugin vcs-snapshot

REF="e18d43fb95a296ae3a6e0b691579e39f47302aa9"
MY_PN="vim-${PN}"

DESCRIPTION="vim plugin: fuzzy picker for Neovim and Vim"
HOMEPAGE="https://github.com/srstevenson/vim-picker"
SRC_URI="https://github.com/srstevenson/${MY_PN}/archive/${REF}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"

VIM_PLUGIN_HELPFILES="${PN}.txt"
