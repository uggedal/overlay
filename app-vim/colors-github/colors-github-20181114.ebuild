EAPI=7

inherit vim-plugin vcs-snapshot

REF="acb712c76bb73c20eb3d7e625a48b5ff59f150d0"
MY_PN="vim-${PN}"

DESCRIPTION="vim colorscheme based on Github's syntax highlighting"
HOMEPAGE="https://github.com/cormacrelf/vim-colors-github"
SRC_URI="https://github.com/cormacrelf/${MY_PN}/archive/${REF}.tar.gz -> ${P}.tar.gz"

LICENSE="vim"
SLOT="0"
KEYWORDS="amd64"

VIM_PLUGIN_HELPFILES="github_colors.txt"

src_prepare() {
	default

	# Remove unwanted files:
	rm -r shots || die
}
