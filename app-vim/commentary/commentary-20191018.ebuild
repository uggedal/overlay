EAPI=7

inherit vim-plugin vcs-snapshot

REF="f8238d70f873969fb41bf6a6b07ca63a4c0b82b1"
MY_PN="vim-${PN}"

DESCRIPTION="vim plugin: comment stuff out"
HOMEPAGE="https://github.com/tpope/vim-commentary"
SRC_URI="https://github.com/tpope/${MY_PN}/archive/${REF}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"

VIM_PLUGIN_HELPFILES="${PN}.txt"