EAPI=6

inherit vim-plugin vcs-snapshot

REF="d9a75fe730921426eff7311cd1390ec628ede9d5"
MY_PN="vim-${PN}"

DESCRIPTION="vim plugin: buffer list that lives in the tabline"
HOMEPAGE="https://github.com/ap/vim-buftabline"
SRC_URI="https://github.com/ap/${MY_PN}/archive/${REF}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

VIM_PLUGIN_HELPFILES="${PN}.txt"
