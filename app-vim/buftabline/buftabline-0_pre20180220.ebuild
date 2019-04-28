EAPI=7

inherit vim-plugin

REF="14d208b1fa5f4308383e3ce429d57c84423029f9"
SRC_URI="https://github.com/ap/vim-${PN}/archive/${REF}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64"
S="${WORKDIR}/${P}"

DESCRIPTION="vim plugin: buffer list that lives in the tabline"
HOMEPAGE="http://vimwiki.github.io"
LICENSE="MIT"

VIM_PLUGIN_HELPFILES="${PN}.txt"
