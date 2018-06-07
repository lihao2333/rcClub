set nu
set autoindent
set tabstop=4
colorscheme ron
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
