" cwmidnight.vim
highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "cwmidnight"
set background=dark

highlight Normal        ctermfg=231 ctermbg=NONE
highlight LineNr        ctermfg=245
highlight CursorLineNr  ctermfg=245
highlight NonText       ctermfg=245   " ~ on empty lines
highlight Comment       ctermfg=245
highlight Folded        ctermfg=245
highlight FoldColumn    ctermfg=245
highlight SignColumn    ctermfg=245
highlight ColorColumn   ctermfg=245

highlight String        ctermfg=87 "231
highlight Character     ctermfg=87

highlight Number        ctermfg=167
highlight Float         ctermfg=167
highlight Boolean       ctermfg=167
highlight Constant      ctermfg=167

highlight Type          ctermfg=221
highlight StorageClass  ctermfg=221
highlight Structure     ctermfg=221
highlight Typedef       ctermfg=221

highlight Identifier    ctermfg=215
highlight Function      ctermfg=215

highlight Operator      ctermfg=117
highlight Delimiter     ctermfg=117

highlight Keyword       ctermfg=215
highlight Statement     ctermfg=215
highlight Conditional   ctermfg=215
highlight Repeat        ctermfg=215
highlight Exception     ctermfg=215
highlight Label         ctermfg=215 "186

highlight PreProc       ctermfg=124
highlight Include       ctermfg=124
highlight Define        ctermfg=124
highlight Macro         ctermfg=124
highlight PreCondit     ctermfg=124

highlight Special       ctermfg=181
highlight SpecialChar   ctermfg=181
highlight Tag           ctermfg=181
highlight SpecialComment ctermfg=245

highlight Visual        ctermfg=NONE ctermbg=237
highlight Search        ctermfg=NONE ctermbg=238
highlight IncSearch     ctermfg=NONE ctermbg=239

highlight ErrorMsg      ctermfg=167
highlight WarningMsg    ctermfg=173
highlight Todo          ctermfg=173

highlight DiffAdd       ctermfg=114
highlight DiffChange    ctermfg=180
highlight DiffDelete    ctermfg=167
highlight DiffText      ctermfg=117

