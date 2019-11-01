syntax match potionOperator "^\v\@((intent|response|select|read|faq)\s|backoff|confirm|assert)"
highlight link potionOperator Operator

syntax match continue "^\v\@(continue)"
highlight link continue PreProc

syntax match potionComment "\v(^|[^\\])#.*$"
highlight link potionComment Comment

syntax match potionString "^\v[^\@#][^   ]*"
highlight link potionString String
