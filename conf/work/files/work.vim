" vimwiki
let wiki_2 = {}
let wiki_2.path = '~/src/work/'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'
let wiki_2.index = 'README'
let g:vimwiki_list = add(g:vimwiki_list, wiki_2)

augroup vimwikitemplate
	autocmd!
	autocmd BufNewFile ~/src/work/diary/*.md :silent 0r !vimwiki-work-diary-template '%'
augroup END

" taskwiki
let g:taskwiki_extra_warriors={'W': {'data_location': '~/.task_work/',
			\ 'taskrc_location': '~/.taskrc_work'} }
