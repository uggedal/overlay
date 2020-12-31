# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vim-plugin vcs-snapshot

REF="cf7b5edce8d516a8b8c36f251f1af861a5f097b3"
MY_PN="${PN}.vim"

DESCRIPTION="vim plugin: comment stuff out"
HOMEPAGE="https://github.com/xarthurx/taskwarrior.vim"
SRC_URI="https://github.com/xarthurx/${MY_PN}/archive/${REF}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

VIM_PLUGIN_HELPFILES="vim-tw.txt"
