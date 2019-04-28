EAPI=7

inherit vim-plugin

DESCRIPTION="vim plugin: a personal wiki for vim"
HOMEPAGE="http://vimwiki.github.io"
SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

VIM_PLUGIN_HELPFILES="${PN}.txt"

src_prepare() {
	default
	rm *.md doc/*.png || die
}
