" prevents duplicate rules from loading
if exists("b:current_syntax")
    finish
endif

syntax match cffComment     "\v#.*$"
hi cffComment               ctermfg=Yellow guifg=#FFFF00

syntax match cffSeparator   "\v;;"
hi cffSeparator             ctermfg=Red guifg=#FF0000

syntax match cffEquals      "\v:" nextgroup=cffValue
hi cffEquals                ctermfg=White guifg=#FFFFFF

syntax match cffValue       ".*" contained
hi cffValue                 ctermfg=Green guifg=#00FF00

syntax match cffKeyword     "\v^\S.*" contains=ALLBUT,cffValue
hi cffKeyword               ctermfg=Red guifg=#FF0000

syntax region cffObject     start=/\v\+/ end=/\v,@=|$/
hi cffObject                ctermfg=Green guifg=#00FF00

syntax region cffCategory   start=/\[/ skip=/\v\\\[|\\\]/ end=/\]/
hi cffCategory              ctermfg=Blue guifg=#0000FF

syntax region cffList       start=/{/ skip=/\\{\|\\}/ end=/}/ contains=cffObject keepend
hi cffList                  ctermfg=Magenta guifg=#FF00FF

let b:current_syntax = "cff"
