if exists("b:did_indent")
	finish
endif

let b:did_indent = 1

setlocal indentexpr=GetNagiosIndent(v:lnum)

setlocal indentkeys&
setlocal indentkeys=o,O,{,},*<Return>,!^F

if exists("*GetNagiosIndent")
	finish
endif

function! GetNagiosIndent(lnum)
	let lnum = prevnonblank(a:lnum - 1)

	"Line 0 always goes at column 0
	if lnum == 0
		return 0
	endif

	let this_line = getline(a:lnum)
	let prev_line = getline(lnum)

	let line_indent = indent(lnum)

	let delta = 0

	"Update the delta based on opening or closing sections
	if this_line =~ '^.*}'
		let delta = 0 - &shiftwidth
	elseif prev_line =~ '^.*{'
		let delta = &shiftwidth
	endif

	let line_indent = line_indent + delta

	return line_indent
endfunction
