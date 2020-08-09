# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

ACCT_USER_ID=971
ACCT_USER_GROUPS=( weechat )
ACCT_USER_HOME="/var/lib/weechat"

acct-user_add_deps
