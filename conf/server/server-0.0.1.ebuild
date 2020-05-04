EAPI=7

DESCRIPTION="Deps and config for servers"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	net-misc/openssh
"

S="${WORKDIR}"


src_install() {
	dosym /etc/init.d/sshd \
		"${EPREFIX}/etc/runlevels/default/sshd"
}
