EAPI=7

DESCRIPTION="Deps and config for all environments"
SLOT="1"
KEYWORDS="amd64"

S="${WORKDIR}"

RDEPEND="
	app-portage/gentoolkit
"

src_install() {
	doenvd "${FILESDIR}"/99local-base
}
