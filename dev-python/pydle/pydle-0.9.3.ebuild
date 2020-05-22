# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8} )
inherit distutils-r1

DESCRIPTION="IRCv3-compliant Python 3 IRC library"
HOMEPAGE="https://github.com/Shizmob/pydle"
SRC_URI="https://github.com/Shizmob/pydle/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
