"base{
	set nu
	set autoindent
	set tabstop=4
	set softtabstop=4
	colorscheme ron
"}
"switch window{
	nnoremap <C-J> <C-W><C-J>
	nnoremap <C-K> <C-W><C-K>
	nnoremap <C-L> <C-W><C-L>
	nnoremap <C-H> <C-w>p<C-d><C-w>p
"}
" scroll next window{
	execute "set <M-u>=\eu"
	execute "set <M-d>=\ed"
	nnoremap <M-d>  <C-w>p<C-d><C-w>p
	nnoremap <M-u>  <C-w>p<C-u><C-w>p
"}
"-----------quickly run-------------------
    map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
           " exec "!g++ % -o %<"
		    exec "!make"
"			exec "!msp_down %"
"            exec "! ./%<"
        elseif &filetype == 'cpp'
"            exec "!g++ % -o %<"
            exec "!cpl %"
            exec "! ./a.out"
        elseif &filetype == 'java'
            exec "!javac %"
    "        exec "!time java %<"
        elseif &filetype == 'sh'
            :! bash %
        elseif &filetype == 'python'
            exec "! py3 %"
        elseif &filetype == 'html'
            exec "!firefox % &"
        elseif &filetype == 'go'
            exec "! go run %"
        elseif &filetype == 'lua'
            exec "! th %"
        elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
        endif
    endfunc
"--------------html_pretty----------------
"prettify{
	execute "set <M-p>=\ep"
	map <M-p> : call Html_Prettify()<CR>
	function! Html_Prettify()
		if &ft != 'html'
			echo "not a html file"
			return
		endif
		silent! exec "s/<[^>]*>/\r&\r/g"
		silent! exec "g/^$/d"
		exec "normal ggVG="
	endfunc
"}

"folding{
	set foldmethod=indent
	set foldlevel=99
	nnoremap <space> za
"}
"Encode{
	set encoding=utf-8      "文件查看的编码, 如果文件是gbk, 转utf-8
    set fileencoding=utf-8  "文件写入的编码
    set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 "探测文件的编码, 影响fileencoding
"}
