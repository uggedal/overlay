EAPI=7

DESCRIPTION="Deps and config for development environment"
SLOT="1"
KEYWORDS="amd64"

S="${WORKDIR}"

RDEPEND="
	configs/interactive
	app-shells/fzy
	dev-vcs/git
	sys-apps/the_silver_searcher
"

src_install() {
	dobin "${FILESDIR}"/f
}
