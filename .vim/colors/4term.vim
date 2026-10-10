" colors/4term.vim - Minimal 6-color scheme aligned with .Xresources
" Uses terminal ANSI colors

set background=light
let g:colors_name = '4term'

" Reset all highlight groups to NONE (incl. links)
for g in split(execute('hi'), "\n")
  let group = matchstr(g, '\S\+')
  if !empty(group) && group =~? '^[a-zA-Z0-9_]\+$'
    execute 'hi ' . group . ' NONE'
  endif
endfor

" Syntax
hi Comment     ctermfg=7
hi Error       ctermfg=1
hi Todo        cterm=bold

" Editor UI
hi! link ErrorMsg Error
hi LineNr      ctermfg=7
hi NonText     ctermfg=7
hi SpecialKey  ctermfg=7
hi VertSplit   cterm=reverse

" Status line
hi StatusLine   cterm=bold ctermbg=0
hi StatusLineNC ctermbg=0
hi! link StatusLineTerm     StatusLine
hi! link StatusLineTermNC   StatusLineNC

" Menu
hi Pmenu        ctermbg=0
hi PmenuSel     cterm=reverse

" Cursor & selection
hi Visual       ctermbg=0 ctermfg=7
hi Folded       ctermbg=0

" Search
hi Search       cterm=reverse
hi! link IncSearch    Search

" Spell
hi! link SpellBad     Error
hi! link SpellCap     Error
hi! link SpellLocal   Error
hi! link SpellRare    Error

" Diff mode
hi DiffDelete   ctermfg=1
hi DiffAdd      ctermfg=2
hi! link DiffChange   DiffAdd
hi! link DiffText     DiffAdd

