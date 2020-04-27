EAPI=7

DESCRIPTION="Deps and config for development environment"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	configs/interactive
	app-shells/fzy
	app-vim/black
	app-vim/buftabline
	app-vim/commentary
	app-vim/easydir
	app-vim/eunuch
	app-vim/jinja
	app-vim/lastplace
	app-vim/markdown
	app-vim/picker
	app-vim/colors-github
	dev-vcs/git
	sys-apps/the_silver_searcher
"

S="${WORKDIR}"

src_install() {
	doenvd "${FILESDIR}"/99local-dev

	insinto /etc
	doins "${FILESDIR}"/gitconfig
	insinto /etc/vim
	doins "${FILESDIR}"/vim.local.rc

	dobin "${FILESDIR}"/f
}
