EAPI=7
inherit vim-plugin

SRC_URI="https://github.com/vimwiki/vimwiki/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64"
S="${WORKDIR}/${P}"

DESCRIPTION="vim plugin: a personal wiki for vim"
HOMEPAGE="http://vimwiki.github.io"
LICENSE="MIT"

VIM_PLUGIN_HELPFILES="${PN}.txt"

RDEPEND="dev-vcs/git"

src_prepare() {
	default
	rm *.md || die
}
