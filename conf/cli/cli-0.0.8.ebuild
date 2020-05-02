EAPI=7

DESCRIPTION="Deps and config for an interactive environment"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	conf/base

	app-admin/sudo
	app-editors/vim
	app-misc/tmux
	app-shells/bash-completion
	sys-fs/ncdu
"

S="${WORKDIR}"

src_install() {
	doenvd "${FILESDIR}"/99editor

	insinto /etc
	doins "${FILESDIR}"/tmux.local.conf
	dobin "${FILESDIR}"/t

	insinto /etc/sudoers.d
	doins "${FILESDIR}"/sudo-nopasswd
}
