" $Id: jbosslog.vim,v 1.1 2002/09/17 16:10:00 rhiestan Exp $
" Vim syntax file
" Language:	jbosslog log file
" Maintainer:	Bob Hiestand <bob@hiestandfamily.org>
" Last Change:	$Date: 2002/09/17 16:10:00 $
" Remark: Add some color to log files produced by sysklogd.

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match       jbossclass      /at\s.*/        nextgroup=jbosslogger skipwhite
syn match jbosslogError  /.*ERROR .*/  nextgroup=jbosslogErrorProjekt skipwhite
syn match jbosslogError  /.*Exception.*/  nextgroup=jbosslogErrorProjekt skipwhite
syn match jbosslogError  /.*Error .*/  nextgroup=jbosslogErrorProjekt skipwhite
syn match jbosslogErrorProjekt      /at com.projekt.*/
syn match       jbosslevel      /level=[^ ]*/   nextgroup=jbossclass skipwhite
syn keyword     jbosslogger     INFO
syn match       jbosslogDate    /^[0-9,:]*[^\s]/        nextgroup=jbosslevel skipwhite
syn match       jbossaddress    /\[.*\]/         nextgroup=jbosslogError skipwhite

if !exists("did_jbosslog_syntax_inits")
  let did_jbosslog_syntax_inits = 1
  hi link jbosslogDate  Comment
  hi link jbosslogger   Type
  hi link jbossaddress  Constant
  hi link jbosslogError Error
  hi link jbosslogErrorProjekt Comment
  hi link jbosslevel    String
  hi link jbossclass    String
endif


hi Error term=bold ctermfg=Yellow ctermbg=DarkRed guifg=#80a0ff gui=bold
hi ErrorMsg term=bold ctermfg=Yellow  guifg=#80a0ff gui=bold
hi jbosslogErrorProjekt term=bold ctermfg=Yellow  guifg=#80a0ff gui=bold
hi jbossaddress term=bold ctermfg=DarkCyan  guifg=#80a0ff gui=bold
hi jbossclass term=bold ctermfg=LightMagenta  guifg=#80a0ff gui=bold
hi Comment term=bold ctermfg=LightBlue  guifg=#80a0ff gui=bold

let b:current_syntax="jbosslog"
