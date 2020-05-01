EAPI=7

DESCRIPTION="Deps and config for all environments"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	app-admin/ps_mem
	app-portage/gentoolkit
	sys-process/htop
"

S="${WORKDIR}"


src_install() {
	doenvd "${FILESDIR}"/99local-base

	insinto /etc/bash/bashrc.d
	doins "${FILESDIR}"/local.sh

	insinto /etc
	doins "${FILESDIR}"/input.local.rc
}
