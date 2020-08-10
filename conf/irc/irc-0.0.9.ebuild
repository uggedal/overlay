# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Deps and config for irc"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	acct-user/weechat
	net-irc/weechat
"

S="${WORKDIR}"

src_install() {
	newinitd "${FILESDIR}"/weechat.initd weechat

	dosym ../../init.d/weechat \
		"${EPREFIX}/etc/runlevels/default/weechat"

	dobin "${FILESDIR}"/weechat-conf
	insinto /var/lib/weechat
	newins "${FILESDIR}"/tmux.conf .tmux.conf
}

_w_has() {
	weechat-conf has "$@"
}

_w_set() {
	weechat-conf set "$@"
}

_w_run() {
	weechat-conf run "$@"
}

pkg_postinst() {
	_w_set weechat.look.buffer_time_format '%H:%M'
	_w_set weechat.look.prefix_suffix ''
	_w_set weechat.look.prefix_align none
	_w_set weechat.look.align_end_of_lines prefix

	_w_set weechat.bar.title.hidden on
	_w_set weechat.bar.status.hidden on
	_w_set weechat.bar.nicklist.hidden on
	_w_set weechat.bar.input.items \
		'>,[input_search],[input_paste],[scroll],input_text'
	_w_set weechat.bar.buflist.items buflist
	_w_set weechat.bar.buflist.separator on
	_w_set buflist.format.number '${number}${if:${number_displayed}? :}'

	_w_set irc.look.highlight_channel '(?-i)$nick:,(?-i)$nick '
	_w_set irc.look.server_buffer independent

	_w_set irc.server_default.msg_part ''
	_w_set irc.server_default.msg_quit ''

	if ! _w_has 'irc_smart = on;*;irc_smart_filter;*' weechat; then
		_w_run '/filter add irc_smart * irc_smart_filter *'
		_w_run '/save'
	fi

	_w_set logger.look.backlog 0
	_w_set logger.file.mask '$plugin.$name.log'
	_w_set logger.mask.irc '$server-$channel-%Y-%m.log'
	_w_set logger.level.irc 1

	if ! _w_has 'unix.weechat = %h/relay_socket' relay; then
		_w_run '/relay add unix.weechat %h/relay_socket'
		_w_run '/save'
	fi
}