# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Weechat autosort plugin"
HOMEPAGE="https://github.com/de-vri-es/weechat-autosort"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/de-vri-es/weechat-autosort.git"
else
	SRC_URI="https://github.com/de-vri-es/weechat-autosort/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64"
fi

LICENSE="GPL-3+"
SLOT="0"

RDEPEND="
	net-irc/weechat[python]
"

src_install() {
	insinto /usr/lib64/weechat/python
	doins autosort.py
}
