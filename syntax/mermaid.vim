if exists('b:current_syntax')
  let s:current_syntax = b:current_syntax
  unlet b:current_syntax
endif

syntax match mmdOperator /\v\-+\>+(\-|\+)?/ nextgroup=mmdLabel
syntax match mmdSeparator /\v:/ nextgroup=mmdMessage

syntax match mmdLabel    /\v\w+/ nextgroup=mmdOperator,mmdSeparator
syntax match mmdMessage  /\v[^\n]*\n/ nextgroup=mmdStartOfLine
syntax match mmdStartOfLine  /\v^\s*/ nextgroup=mmdLabel,mmdNote,mmdParticipant,mmdTitle

syntax match mmdGraph /graph$/ nextgroup=mmdStartOfLine
syntax match mmdSequenceDiagram /sequenceDiagram$/ nextgroup=mmdStartOfLine
syntax match mmdTitle    /\s*\ctitle/ nextgroup=mmdMessage
syntax match mmdParticipant /\s*\c\(participant\|actor\) / nextgroup=mmdLabel
syntax match mmdNote     /\s*\cnote left of / nextgroup=mmdLabel
syntax match mmdNote     /\s*\cnote right of / nextgroup=mmdLabel
syntax match mmdNote     /\s*\cnote over / nextgroup=mmdLabel
syntax match mmdComment /\s*%%.*$/ nextgroup=mmdStartOfLine

highlight link mmdKeyword Keyword
highlight link mmdTitle Keyword
highlight link mmdSequenceDiagram Keyword
highlight link mmdParticipant Keyword
highlight link mmdNote Keyword

highlight link mmdLabel Function
highlight link mmdOperator Label
highlight link mmdSeparator Keyword
highlight link mmdMessage String
highlight link mmdComment Comment

if exists('s:current_syntax')
  let b:current_syntax = s:current_syntax
else
  let b:current_syntax = 'mermaid'
endif
