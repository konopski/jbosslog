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

syn match	webapplogDate	'^[0-9][0-9]\:[0-9][0-9]\:[0-9][0-9]\.[0-9][0-9][0-9]'  nextgroup=webapplevel skipwhite

syn match	webapplevel	'INFO'  nextgroup=webappsession skipwhite
syn match	webapplevel	'DEBUG' nextgroup=webappsession skipwhite
syn match	webapplevel  'WARN'  nextgroup=webappsession skipwhite

syn match   webappsession '\[session:\w*\]' nextgroup=webappthread skipwhite
syn match   webappthread  '\[thread:\w\+\]'  nextgroup=webappuser skipwhite
syn match   webappuser  '\[user:\S*\]'      nextgroup=webappcategory skipwhite
syn match   webappcategory '\S\+\.\w\+\s:\s\d\+' 


if !exists("did_webapplog_syntax_inits")
  let did_webapplog_syntax_inits = 1
  hi link webapplogDate 	Comment
  hi link webapplevel 	String
  hi link webappsession  Type
  hi link webappthread   Type
  hi link webappuser     String 
  hi link webappcategory PreProc
  hi link webapplogError 	Error
endif

let b:current_syntax="webapplog"

" syntax clear
