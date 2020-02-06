let mapleader =" "

" Some basics:
set number relativenumber
highlight ColorColumn ctermbg=black guibg=black
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set clipboard+=unnamedplus

" Force the cursor onto a new line after 80 characters:
set textwidth=80

" However, in Git commit messages, let’s make it 72 characters:
autocmd FileType gitcommit set textwidth=72

" Colour the 81st (or 73rd) column so that we don’t type over our limit:
set colorcolumn=+1

" In Git commit messages, also colour the 51st column (for titles):
autocmd FileType gitcommit set colorcolumn+=51

" Turn off search highlighting until next search:
nnoremap <F3> :noh<CR>

" Toggle whitespace view:
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>

" Enable autocompletion:
set wildmode=longest,list

" Disable automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Spell-check:
map <leader>o :setlocal spell! spelllang=en_gb<CR>

" Open splits on bottom and right:
set splitbelow splitright

" Remap split navigation to save a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Check file in shellcheck:
map <leader>s :!clear && shellcheck %<CR>

" Keep cursor in the center:
set scrolloff=5
if !exists('*VCenterCursor')
	augroup VCenterCursor
	au!
	au OptionSet *,*.*
		\ if and( expand("<amatch>")=='scrolloff' ,
		\         exists('#VCenterCursor#WinEnter,WinNew,VimResized') )|
		\   au! VCenterCursor WinEnter,WinNew,VimResized|
		\ endif
	augroup END
	function VCenterCursor()
		if !exists('#VCenterCursor#WinEnter,WinNew,VimResized')
			let s:default_scrolloff=&scrolloff
			let &scrolloff=winheight(win_getid())/2
			au VCenterCursor WinEnter,WinNew,VimResized *,*.*
				\ let &scrolloff=winheight(win_getid())/2
		else
			au! VCenterCursor WinEnter,WinNew,VimResized
			let &scrolloff=s:default_scrolloff
		endif
	endfunction
endif

nnoremap <leader>zz :call VCenterCursor()<CR>

" Automatically delete all trailing whitespace on save:
autocmd BufWritePre * %s/\s\+$//e

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xdefaults,*Xresourses !xrdb %

" Update binds when sxhkdrc is updated:
autocmd BufWritePost *sxhkdrc !pkill -SIGUSR1 sxhkd

" Make calcurse notes' syntax markdown:
autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile $HOME/.local/share/calcurse/notes/* set filetype=markdown
