EAPI=7

inherit vim-plugin vcs-snapshot

REF="14d208b1fa5f4308383e3ce429d57c84423029f9"
MY_PN="vim-${PN}"

DESCRIPTION="vim plugin: buffer list that lives in the tabline"
HOMEPAGE="http://vimwiki.github.io"
SRC_URI="https://github.com/ap/${MY_PN}/archive/${REF}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

VIM_PLUGIN_HELPFILES="${PN}.txt"
