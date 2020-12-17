" $Id: webapplog.vim,v 1.0 2018/12/6 16:10:00 lko $
" Vim syntax file
" Language:	webapplog log file
" Maintainer:	Lukasz Konopski <konopski@gmail.com>
" Last Change:	$Date: 2018/12/6 16:10:00 $

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword webapplogError	error Error ERROR exception Exception FATAL

syn match	webapplogAppVer	'^\S*\s-\s' nextgroup=webapplogDate skipwhite

syn match	webapplogDate	'\[[0-9][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]\s[0-9][0-9]\:[0-9][0-9]\:[0-9][0-9],[0-9][0-9][0-9]\]' nextgroup=webappthread skipwhite

syn match   webappthread  '\[\S\+\]'  nextgroup=webapplevel skipwhite

syn match	webapplevel	'TRACE'  nextgroup=webappcategory skipwhite
syn match	webapplevel	'INFO'  nextgroup=webappcategory skipwhite
syn match	webapplevel	'DEBUG' nextgroup=webappcategory skipwhite
syn match	webapplevel  'WARN'  nextgroup=webappcategory skipwhite

syn match   webappuser  '\[user:\S*\]'      nextgroup=webappcategory skipwhite
syn match   webappcategory '\w\+:\d\+\s\-\s' 


if !exists("did_webapplog_syntax_inits")
  let did_webapplog_syntax_inits = 1
  hi link webapplogAppVer	Statement
  hi link webapplogDate 	Comment
  hi link webapplogHour 	Comment
  hi link webappthread   Type
  hi link webapplevel 	String
  hi link webappsession  Type
  hi link webappuser     String 
  hi link webappcategory PreProc
  hi link webapplogError 	Error
endif

let b:current_syntax="webapplog"

" syntax clear
