# Copyright 2014-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{8,9} )

inherit distutils-r1 vcs-snapshot

REF="8b045552526e83e6d592aaa8d64b115d7cc7bb54"

DESCRIPTION="Python library for interacting with taskwarrior databases"
HOMEPAGE="https://tasklib.readthedocs.io/"
SRC_URI="https://github.com/robgolding/${PN}/archive/${REF}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
	app-misc/task
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/tzlocal[${PYTHON_USEDEP}]"

DOCS=( README.rst LICENSE )
