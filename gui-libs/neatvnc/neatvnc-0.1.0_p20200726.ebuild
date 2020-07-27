# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="liberally licensed VNC server library with a clean interface"

HOMEPAGE="https://github.com/any1/neatvnc/"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/any1/neatvnc.git"
else
	COMMIT="6ad4aba374153d36c99ea5073b747697774f4e3e"
	SRC_URI="https://github.com/any1/neatvnc/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${PN}-${COMMIT}"
fi

LICENSE="ISC"
SLOT="0"
IUSE="examples ssl jpeg tracing"

DEPEND="
	x11-libs/pixman
	x11-libs/libdrm
	dev-libs/aml
	sys-libs/zlib
	ssl? ( net-libs/gnutls )
	jpeg? ( media-libs/libjpeg-turbo )
	tracing? ( dev-util/systemtap )
"
RDEPEND="${DEPEND}"

src_configure() {
	local emesonargs=(
		$(meson_use examples)
		$(meson_feature jpeg tight-encoding)
		$(meson_feature ssl tls)
		$(meson_use tracing systemtap)
	)
	meson_src_configure
}
