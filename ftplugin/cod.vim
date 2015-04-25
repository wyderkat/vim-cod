" Vim filetype plugin
" Language:    COD (CSS-On-Diet)
" Author:      Tomasz Wyderka <wyderkat@cofoh.com>
" URL:	       http://cssondiet.com

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal iskeyword+=-
"setlocal commentstring=//\ %s
"setlocal define=^\\s*\\%(@mixin\\\|=\\)
"setlocal includeexpr=substitute(v:fname,'\\%(.*/\\\|^\\)\\zs','_','')
"setlocal omnifunc=csscomplete#CompleteCSS
setlocal suffixesadd=.cod
"setlocal comments=s1:/*,mb:*,ex:*/
"
"let &l:include = '^\s*@import\s\+\%(url(\)\=["'']\='

