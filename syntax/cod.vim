" Vim syntax file
" Language:        COD (CSS-On-Diet)
" Maintainer:	   Tomasz Wyderka <wyderkat@cofoh.com>
" URL:		   http://cssondiet.com
"
" TODO: line continuation "\\$"
"
if exists("b:current_syntax")
  finish
endif

runtime! syntax/css.vim
runtime! after/syntax/css.vim
" load files from vim-css3-syntax plugin (https://github.com/hail2u/vim-css3-syntax)
runtime! after/syntax/css/*.vim

syn case ignore

syn keyword  codMnemonics containedin=cssDefinition contained col wid hei bac bai bap ba- bas bar bal bao dis con fos fow fof fot fo- fov pos pa- pal pat pab par ma- mal mat mab mar flo top lih fl- flf fld flw flg fls flb ord als ali alc juc b-- bb- bbc bbl bbr bbs bbw bcp bco bi- bio bir bil bis biw bl- blc bls blw bra br- brc brs brw bsp bst bt- btc btl btr bts btw bwi lef tea ted tet tes tei teo ter zin vea ov- ovx ovy opa cle les cur rig ouc ou- ous ouo ouw bot li- lit lii lio bos boz zoo maw miw mih mah fil whs vis wos wob wow an- ann and ant any ani anr anf anp tf- tfo tfs ti- tiy tid tip tit ts- tsy tsd tsp tst

syn keyword  codValues containedin=cssDefinition,cssAttrRegion contained ab al au ba bb bh bl bo bt ca cb ce co da db de do ea ei eo fi fl fs fe hi ib if ih ii il io is it le lg li lo mi nm no nr nw pb po re rg ri ro rx ry sa sb sc so st ta to tr un up vi wh wr
syn match    codValues containedin=cssDefinition,cssAttrRegion contained "!i"
syn match    codValues containedin=cssDefinition,cssAttrRegion contained "%%"

"syn keyword codUnits p e r i c m x containedin=cssValueLength
syn match    cssValueLength contains=cssUnitDecorators contained "[-+]\=\d\+\(\.\d*\)\=\(%\|p\|e\|i\|i\|c\|m\|x\|mm\|cm\|in\|pt\|pc\|em\|ex\|px\|rem\|dpi\|dppx\|dpcm\)"

syn match    codColor contains=cssUnitDecorators contained containedin=cssMediaBlock,cssFunction,cssDefinition,cssAttrRegion "#[0-9A-Fa-f]\{8\}\>"

syn match    codDefine nextgroup=codDefinesBlock skipwhite skipnl "@cod-defines\?\>"
syn region   codDefinesBlock contains=codDefineDeclaration contained transparent fold keepend matchgroup=cssBraces start="{" end="}" skip="{.\{-}}"
syn region   codDefineDeclaration contains=codDefineName,codDefineValue contained transparent oneline start="\S" end="\S"
syn match    codDefineValue contained contains=codDefineArgument ".*"
syn match    codDefineName contained nextgroup=codDefineValue skipwhite "[-0-9A-Za-z_]\+" 
syn match    codDefineArgument contained "_ARG\d\+_" 

syn match    codMedia nextgroup=codMediaBlock skipwhite skipnl "@cod-medias\?\>"
syn region   codMediaBlock contains=codMediaDeclaration contained transparent fold keepend matchgroup=cssBraces start="{" end="}" 
syn region   codMediaDeclaration contains=codMediaBreakpointName,codMediaBreakpointValue contained transparent oneline start="\S" end="\S"
syn match    codMediaBreakpointValue contained contains=cssMediaQuery ".*"
syn match    codMediaBreakpointName contained nextgroup=codMediaBreakpointValue skipwhite "[-0-9A-Za-z_]\+" 
syn match    codMediaBreakpointUsage contained containedin=cssDefinition,cssAttrRegion "@[-0-9A-Za-z_]\+" 

syn match    codInclude containedin=ALL nextgroup=codIncludeBlock skipwhite skipnl "@cod-includes\?\>"
syn region   codIncludeBlock contains=codIncludeQuotedFilename,codIncludeFilename contained transparent fold keepend matchgroup=cssBraces start="{" end="}" 
syn region   codIncludeFilename contained oneline start="\S" end="\S\s*$"
syn region   codIncludeFilename contained oneline matchgroup=codIncludeQuotes start=/"/ end=/"/


syn region   codCComment contains=@Spell,codCComment containedin=ALLBUT,cssURL,cssStringQQ,cssStringQ fold start="/\*" end="\*/" 
syn match    codComment contains=@Spell containedin=ALLBUT,cssURL,codCComment,cssStringQQ,cssStringQ "//.*$"

hi def link  codCComment            Comment
hi def link  codComment             Comment
hi def link  codMnemonics           Type
hi def link  codValues              Constant
hi def link  codColor               Constant
hi def link  codInclude             Statement
hi def link  codIncludeFilename     PreProc
hi def link  codIncludeQuotes       Special
hi def link  codDefine              Statement
hi def link  codDefineName          Constant
hi def link  codDefineArgument      Special
hi def link  codMedia               Statement
hi def link  codMediaBreakpointName Constant
hi def link  codMediaBreakpointUsage Function

let b:current_syntax = "cod"

