# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION=""
DESCRIPTION="Deps and config for www servers"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	www-servers/nginx
"

src_install() {
	insinto /etc/nginx
	doins "${FILESDIR}"/nginx.conf
	doins "${FILESDIR}"/ffdhe4096.pem

	insinto /etc/nginx/conf.d
	doins "${FILESDIR}"/default.conf
	doins "${FILESDIR}"/ssl.part
	doins "${FILESDIR}"/site.conf.j2
}
