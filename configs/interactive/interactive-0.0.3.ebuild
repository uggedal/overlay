EAPI=7

DESCRIPTION="Deps and config for an interactive environment"
SLOT="1"
KEYWORDS="amd64"

S="${WORKDIR}"

RDEPEND="
	configs/base
	app-editors/vim
	app-misc/tmux
	app-shells/bash-completion
"

src_install() {
	insinto /etc
	doins "${FILESDIR}"/tmux.local.conf

	exeinto /usr/local/bin
	doexe "${FILESDIR}"/t
}
