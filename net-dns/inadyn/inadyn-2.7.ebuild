# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Dynamic DNS client with SSL/TLS support"
HOMEPAGE="https://troglobit.com/projects/inadyn/"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/troglobit/inadyn.git"
else
	SRC_URI="https://github.com/troglobit/inadyn/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="
	dev-libs/confuse
	dev-libs/openssl
"
RDEPEND="
	${DEPEND}
	acct-user/inadyn
"
BDEPEND="virtual/pkgconfig"

PATCHES=(
	"${FILESDIR}/systemd-user.patch"
)

src_prepare() {
	default

	eautoreconf
}

src_configure() {
	econf --enable-openssl
}
