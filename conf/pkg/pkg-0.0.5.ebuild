# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Deps and config for packaging"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	app-portage/eix
	dev-util/pkgcheck
	dev-util/shellcheck-bin
"

S="${WORKDIR}"

src_install() {
	dobin "${FILESDIR}"/eincr
}
