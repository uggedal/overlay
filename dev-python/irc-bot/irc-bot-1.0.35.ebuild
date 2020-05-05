# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="irc_bot"
MY_P="${MY_PN}-${PV}"

PYTHON_COMPAT=( python3_{7,8} )
inherit distutils-r1

DESCRIPTION="Small library to create an IRC bot"
HOMEPAGE="https://github.com/cvium/irc_bot"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]
"

S="${WORKDIR}/${MY_P}"
