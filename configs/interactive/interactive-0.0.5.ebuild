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
	sys-fs/ncdu
"

src_install() {
	insinto /etc
	doins "${FILESDIR}"/tmux.local.conf

	dobin "${FILESDIR}"/t
}
