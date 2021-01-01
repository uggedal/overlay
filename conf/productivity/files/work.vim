" vimwiki
augroup vimwikitemplate
	autocmd!
	autocmd BufNewFile ~/src/work/diary/*.md :silent 0r !vimwiki-work-diary-template '%'
augroup END

" taskwiki
let g:taskwiki_extra_warriors={'W': {'data_location': '~/.task_work/',
			\ 'taskrc_location': '~/.taskrc_work'} }
