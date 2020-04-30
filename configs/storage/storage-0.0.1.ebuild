EAPI=7

DESCRIPTION="Deps and config for storage environment"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	sys-fs/cryptsetup
	sys-fs/mergerfs
"

S="${WORKDIR}"

src_install() {
	:
}
