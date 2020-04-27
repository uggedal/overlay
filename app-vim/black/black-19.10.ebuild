EAPI=7

inherit vim-plugin vcs-snapshot

MY_PV="${PV}b0"

DESCRIPTION="vim plugin: uncomprimising Python code formatter"
HOMEPAGE="https://github.com/psf/black"
SRC_URI="https://github.com/psf/${PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"

src_prepare() {
	default

	# Remove all directories except plugin/:
	rm -r blib2to3 docs profiling tests || die
}
