# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Wayland native VNC client"
HOMEPAGE="https://github.com/any1/wlvncc"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/any1/wlvncc.git"
else
	COMMIT="67bd3331e50826a0bf1eb12c7e82b09f2129273e"
	SRC_URI="https://github.com/any1/wlvncc/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${PN}-${COMMIT}"
fi

LICENSE="ISC"
SLOT="0"

RDEPEND="
	dev-libs/aml
	dev-libs/wayland
	net-libs/libvncserver
	x11-libs/libxkbcommon
	x11-libs/pixman
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/pkgconfig
	dev-libs/wayland-protocols
"