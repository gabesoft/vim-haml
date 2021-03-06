" Vim filetype plugin
" Language:	SCSS
" Maintainer:	Tim Pope <vimNOSPAM@tpope.org>
" Last Change:	2010 Jul 26

if exists("b:did_ftplugin")
  finish
endif

runtime! ftplugin/sass.vim
setlocal comments=s1:/*,mb:*,ex:*/,://

command! -buffer HamlSortProps call haml#sortProps()

" vim:set sw=2:
