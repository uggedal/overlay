# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Power notification daemon"
HOMEPAGE="https://kl.wtf/projects/poweralertd/"

HASH="5d346a8e3a4935a9cfffc7fd45a6e5551e1fa3d4"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~kennylevinsen/${PN}"
else
	SRC_URI="https://git.sr.ht/~kennylevinsen/${PN}/archive/${HASH}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${PN}-${HASH}"
	KEYWORDS="amd64"
fi

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	sys-power/upower
"
BDEPEND="
	${RDEPEND}
	app-text/scdoc
"
