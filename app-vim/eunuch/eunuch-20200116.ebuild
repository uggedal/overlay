EAPI=7

inherit vim-plugin vcs-snapshot

REF="33e875b31c8b811a0a47908884a5e2339106bbe8"
MY_PN="vim-${PN}"

DESCRIPTION="vim plugin: helpers for UNIX"
HOMEPAGE="https://github.com/tpope/vim-eunuch"
SRC_URI="https://github.com/tpope/${MY_PN}/archive/${REF}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"

VIM_PLUGIN_HELPFILES="${PN}.txt"
