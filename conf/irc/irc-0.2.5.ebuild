# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd

DESCRIPTION="Deps and config for irc"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	acct-user/weechat
	net-irc/weechat
	net-irc/weechat-autosort
	net-irc/weechat-colorize-nicks
	www-apps/glowing-bear
"

S="${WORKDIR}"

src_install() {
	systemd_dounit "${FILESDIR}"/weechat.service
	dosym ../../../../lib/systemd/system/weechat.service \
		"${EPREFIX}/etc/systemd/system/multi-user.target.wants/weechat.service"

	dosym ../../../../../usr/lib64/weechat/python/autosort.py \
		"${EPREFIX}/var/lib/weechat/python/autoload/autosort.py"
	dosym ../../../../../usr/lib64/weechat/python/colorize_nicks.py \
		"${EPREFIX}/var/lib/weechat/python/autoload/colorize_nicks.py"

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

	_w_set irc.look.highlight_channel '(?-i)$nick:,(?-i)$nick '
	_w_set irc.look.server_buffer independent

	_w_set irc.server_default.msg_part ''
	_w_set irc.server_default.msg_quit ''

	if ! _w_has 'irc_smart = on;*;irc_smart_filter;*' weechat; then
		_w_run '/filter add irc_smart * irc_smart_filter *'
		_w_run '/save'
	fi

	_w_set spell.check.enabled on
	_w_set spell.check.default_dict en

	_w_set logger.look.backlog 0
	_w_set logger.file.mask '$plugin.$name.log'
	_w_set logger.mask.irc '$server-$channel-%Y-%m.log'
	_w_set logger.level.irc 1

	if ! _w_has 'unix.weechat = "%h/relay_socket"' relay; then
		_w_run '/relay add unix.weechat %h/relay_socket'
		_w_run '/save'
	fi

	# Colors:
	_w_set weechat.color.separator darkgray
	_w_set weechat.color.chat_time 245
	_w_set weechat.color.chat_highlight red
	_w_set weechat.color.chat_highlight_bg 229
	_w_set weechat.color.chat_nick_colors \
		'001,002,003,004,005,006,019,040,093,196,220'

	_w_set buflist.format.buffer \
		'${format_number}${indent}${format_nick_prefix}${color_hotlist}${format_name}${if:${buffer.hotlist.1|count}? ${color:245}${buffer.hotlist.1|count}}'
	_w_set buflist.format.buffer_current \
		'${color:,229}${format_number}${indent}${color:default}${format_name}'
	_w_set buflist.format.number '${color:245}${number}${if:${number_displayed}?.: }'
	_w_set buflist.format.hotlist_highlight '${color:magenta}'
	_w_set buflist.format.hotlist_low '${color:default}'
	_w_set buflist.format.hotlist_message '${color:brown}'
	_w_set buflist.format.hotlist_none '${color:default}'
	_w_set buflist.format.hotlist_private '${color:blue}'
}
