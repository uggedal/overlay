# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Web frontend for Weechat"
HOMEPAGE="https://github.com/glowing-bear/glowing-bear"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/glowing-bear/glowing-bear.git"
else
	COMMIT="788855d2e391f8de7a1ac6bf2cc04b7550b92bf5"
	SRC_URI="https://github.com/glowing-bear/glowing-bear/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64"
	S="${WORKDIR}/${PN}-${COMMIT}"
fi

LICENSE="GPL-3+"
SLOT="0"

src_install() {
	insinto /var/lib/glowingbear/
	doins -r *
}
