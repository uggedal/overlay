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
	app-crypt/dehydrated
	app-misc/jq
	sys-apps/moreutils
	www-servers/nginx
"

S="${WORKDIR}"

src_install() {
	insinto /etc/nginx
	doins "${FILESDIR}"/nginx.conf
	doins "${FILESDIR}"/ffdhe4096.pem

	insinto /etc/nginx/conf.d
	doins "${FILESDIR}"/conf.d/default.conf
	doins "${FILESDIR}"/conf.d/ssl.part
	doins "${FILESDIR}"/conf.d/site.conf.j2
	doins "${FILESDIR}"/conf.d/site.passwd.j2

	dosym ../../init.d/nginx \
		"${EPREFIX}/etc/runlevels/default/nginx"

	insinto /etc/dehydrated
	doins "${FILESDIR}"/dehydrated/config.j2
	doins "${FILESDIR}"/dehydrated/domains.txt.j2

	insinto /etc/dehydrated/hooks
	doins "${FILESDIR}"/dehydrated/hooks/cf.sh.j2

	exeinto /etc/cron.daily
	newexe "${FILESDIR}"/dehydrated.cron dehydrated
}
