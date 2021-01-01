""
"" Productivity
""

" vimwiki
let g:vimwiki_global_ext = 0
let wiki_1 = {}
let wiki_1.path = '~/src/notes/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'
let wiki_1.index = 'README'

let g:vimwiki_list = [wiki_1]
let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:vimwiki_markdown_link_ext = 1

augroup vimwikitemplate
	autocmd!
	autocmd BufNewFile ~/src/notes/diary/*.md :silent 0r !vimwiki-diary-template '%'
augroup END

" taskwiki
let g:taskwiki_extra_warriors={'W': {'data_location': '~/.task_work/',
			\ 'taskrc_location': '~/.taskrc_work'} }
