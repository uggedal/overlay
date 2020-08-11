# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Weechat nick colorization inside message text"
HOMEPAGE="https://github.com/weechat/scripts"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/weechat/scripts.git"
else
	COMMIT="bc8a9051800779a036ba11689a277cd5f03657b2"
	SRC_URI="https://github.com/weechat/scripts/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64"
	S="${WORKDIR}/scripts-${COMMIT}"
fi

LICENSE="GPL-3+"
SLOT="0"

RDEPEND="
	net-irc/weechat[python,scripts]
"

src_install() {
	insinto /usr/lib64/weechat/python
	doins  python/colorize_nicks.py
}
