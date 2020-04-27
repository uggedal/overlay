EAPI=7

inherit vim-plugin vcs-snapshot

MY_PN="vim-${PN}"

DESCRIPTION="vim plugin: reopen files at last edit posiion"
HOMEPAGE="https://github.com/farmergreg/vim-lastplace"
SRC_URI="https://github.com/farmergreg/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"

VIM_PLUGIN_HELPFILES="${MY_PN}.txt"
