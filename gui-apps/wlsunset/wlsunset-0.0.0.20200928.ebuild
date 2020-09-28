# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Day/night gamma adjustments for wayland"
HOMEPAGE="https://git.sr.ht/~kennylevinsen/wlsunset"

HASH="0128fb535fc56bb4cb4aaba1758a047708805ff6"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~kennylevinsen/${PN}"
else
	SRC_URI="https://git.sr.ht/~kennylevinsen/${PN}/archive/${HASH}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${PN}-${HASH}"
	KEYWORDS="amd64"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	dev-libs/wayland
"
BDEPEND="
	${RDEPEND}
	dev-libs/wayland-protocols
"
