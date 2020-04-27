EAPI=7

inherit vim-plugin vcs-snapshot

REF="b59d179defbc9fd6e6f426569f8430592e1a6a1b"
MY_PN="vim-jinja2-syntax"

DESCRIPTION="vim syntax: jinja2"
HOMEPAGE="https://github.com/Glench/vim-jinja2-syntax"
SRC_URI="https://github.com/Glench/${MY_PN}/archive/${REF}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"
