EAPI=7

DESCRIPTION="Deps and config for development environment"
SLOT="1"
KEYWORDS="amd64"

S="${WORKDIR}"

RDEPEND="
	configs/interactive
	app-shells/fzy
	app-vim/vimwiki
	dev-vcs/git
	sys-apps/the_silver_searcher
"

src_install() {
	doenvd "${FILESDIR}"/99local-dev

	insinto /etc
	doins "${FILESDIR}"/gitconfig
	insinto /etc/vim
	doins "${FILESDIR}"/vim.local.rc

	dobin "${FILESDIR}"/f
}
