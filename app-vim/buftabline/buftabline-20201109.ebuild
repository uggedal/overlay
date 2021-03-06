# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vim-plugin vcs-snapshot

REF="635150f43fb430876d15dbae1a7b6363cadfea35"
MY_PN="vim-${PN}"

DESCRIPTION="vim plugin: buffer list that lives in the tabline"
HOMEPAGE="https://github.com/ap/vim-buftabline"
SRC_URI="https://github.com/ap/${MY_PN}/archive/${REF}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

VIM_PLUGIN_HELPFILES="${PN}.txt"
