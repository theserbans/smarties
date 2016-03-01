" Vim syntax file
" Language:	java.util.logging output
" Maintainer:	rt_davies@yahoo.com
" Last Change:	2007 Jun 12

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Case sensitive
syn case 	match

" Custom color defs
hi javalogHeadColor guifg=#ACACFF
hi javalogInfoColor guifg=Green guibg=DarkGray
hi javalogFineColor guifg=#000099 guibg=DarkGray
hi javalogFinerColor guifg=#FF9999 guibg=DarkGray
hi javalogFinestColor guifg=#FFFFCC guibg=DarkGray

" Severe
syntax match javalogLevelSevere /^SEVERE:/
hi link javalogLevelSevere ErrorMsg

" Warning
syntax match javalogLevelWarn /^WARNING:/
hi link javalogLevelWarn WarningMsg

" Info
 syntax match javalogInfo /^INFO:/
 hi link javalogInfo javalogInfoColor

" Fine
syntax match javalogFine /^FINE:/
hi link javalogFine javalogFineColor

" Finer
syntax match javalogFiner /^FINER:/
hi link javalogFiner javalogFinerColor

" Finest
syntax match javalogFinest /^FINEST:/
hi link javalogFinest javalogFinestColor

" Log entry headers
syntax region javalogHeader start=/^Jan / end=/$/
syntax region javalogHeader start=/^Feb / end=/$/
syntax region javalogHeader start=/^Mar / end=/$/
syntax region javalogHeader start=/^Apr / end=/$/
syntax region javalogHeader start=/^May / end=/$/
syntax region javalogHeader start=/^Jun / end=/$/
syntax region javalogHeader start=/^Jul / end=/$/
syntax region javalogHeader start=/^Aug / end=/$/
syntax region javalogHeader start=/^Sep / end=/$/
syntax region javalogHeader start=/^Oct / end=/$/
syntax region javalogHeader start=/^Nov / end=/$/
syntax region javalogHeader start=/^Dec / end=/$/
hi link javalogHeader javalogHeadColor

" Stack traces
"syntax region javaStacktrace start=/^com./ end=/$/
"syntax region javaStacktrace start=/^org./ end=/$/
"syntax region javaStacktrace start=/^net./ end=/$/
"syntax region javaStacktrace start=/^java./ end=/$/
"syntax region javaStacktrace start=/^	at/ end=/$/
"syntax region javaStacktrace start=/^ at / end=/$/
syntax region sfjavaStacktrace start=/^	at com\.epo\./ end=/$/
syntax region sfjavaStacktrace start=/^ at com\.epo\./ end=/$/
syntax region sfjavaStacktrace start=/^	at cpc\.smartflow\./ end=/$/
syntax region sfjavaStacktrace start=/^ at cpc\.smartflow\./ end=/$/
syntax region sfjavaStacktrace start=/Exception in thread "/ end=/$/
"hi link javaStacktrace tablinefill
hi link sfjavaStacktrace cursorline
"hi link sfjavaStacktraceHeader error
"hi link sfjavaStacktrace tablinefill
"hi link javaStacktrace PreProc 

" vim: ts=8 sw=2

" ------------------------------------------------------
" adi
" ------------------------------------------------------

:syn match logDate /^\d\{4}-\d\{2}-\d\{2}/ nextgroup=logTime skipwhite
:syn match logTime /\d\{2}:\d\{2}:\d\{2}/

:syn match javalogInfo / INFO /
:syn match javalogWarning / WARNING /
:syn match javalogWarning / WARN /
:syn match javalogError / ERROR /
:syn match javalogDebug / DEBUG /
:syn match javaclassmethod /\w*\.\w*<\w*:\d*> /
:syn match onmessage /cpc\.smartflow\..*\*ID:.*\*\d\{1}/
:syn match onparked / PARKED\*cpc\.smartflow\..*\*ID:.*\*\d\{1}/
:syn match mqinvoke /ID:.*\*\w*\.\w*.*\*\d\{1}/

hi link logDate Question
hi link logTime Question
hi link javalogInfo Identifier
hi link javalogWarning Todo
hi link javalogError Error
hi link javalogDebug Comment
hi link javaclassmethod Question
hi link onmessage Type
hi link onparked todo
hi link mqinvoke Underlined

let b:current_syntax = "sflog"

" This creates a keyword ERROR and puts it in the highlight group called logError
":syn keyword logError ERROR
" This creates a match on the date and puts in the highlight group called logDate.  The
" nextgroup and skipwhite makes vim look for logTime after the match
":syn match logDate /^\d\{4}-\d\{2}-\d\{2}/ nextgroup=logTime skipwhite
" This creates a match on the time (but only if it follows the date)
":syn match logTime /\d\{2}:\d\{2}:\d\{2},\d\{3}/

" Now make them appear:
" Link just links logError to the colouring for error
"hi link logError Error
" Def means default colour - colourschemes can override
" hi def logDate guibg=yellow guifg=blue
