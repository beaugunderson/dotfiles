" Vim plugin that prompts to edit SCSS files instead of CSS files

" Last Change:  1/26/2012
" Maintainer:   Beau Gunderson <beau@beaugunderson.com>
" License:      MIT

if exists("g:loaded_scss_instead")
	finish
endif

let g:loaded_scss_instead = 1

function! scss_instead#EditScss()
	" The current file
	let file = expand("%")

	" The current file's basename plus .scss
	let scss = expand("%:r") . ".scss"

	" If the file exists
	if filereadable(scss)
		" Prompt the user and store the user's choice (1-indexed) in a variable
		let choice = confirm("Do you want to edit " . scss . " instead?", "&Yes\n&No", 1, "Question")

		" If the user picked [Y]es
		if choice == 1
			" Set file to the escaped scss filename
			let file = fnameescape(scss)
		endif
	endif

	" e[dit] the file
	exe "e" file

	" Execute the autocommands for the file
	exe "doautocmd BufReadPost" file
endfunction

" Execute EditScss() whenever a *.css file is read
:au BufReadCmd *.css call scss_instead#EditScss()
