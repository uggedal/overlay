# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION=""
DESCRIPTION="Deps and config for backup"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	app-backup/restic
	sys-apps/moreutils
"

S="${WORKDIR}"

src_install() {
	insinto /usr/share/backup
	doins "${FILESDIR}"/restic-backup.j2
	doins "${FILESDIR}"/restic-backup-cron.j2

	keepdir /var/log/backup
	keepdir /var/backups/cache
	fperms 750 /var/backups/cache

	insinto /etc/logrotate.d
	doins "${FILESDIR}/backup.logrotate backup
}
