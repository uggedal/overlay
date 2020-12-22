# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8} )
DISTUTILS_USE_SETUPTOOLS=no
inherit distutils-r1

DESCRIPTION="Loads cookies from your browser into a cookiejar object"
HOMEPAGE="https://github.com/borisbabic/browser_cookie3"
SRC_URI="https://github.com/borisbabic/browser_cookie3/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="dev-python/lz4[${PYTHON_USEDEP}]"

PATCHES=( "${FILESDIR}/slim-deps.patch" )
