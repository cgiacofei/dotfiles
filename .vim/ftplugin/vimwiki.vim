"autocmd BufRead *\(diary/*\)\@<! :VimwikiTOC
"autocmd BufWritePre * :VimwikiRebuildTags
"autocmd BufWritePre index.md :VimwikiGenerateTags

augroup vimwiki
au! BufRead */vimwiki/index.md :Silent git pull
au! BufWritePre * :VimwikiRebuildTags
au! BufWritePre index.md call BuildIndex()
au! BufWritePost */vimwiki/*  !git add <afile>;git commit -m "Wiki Commit.";git push
augroup END

command! -nargs=1 Silent
\   execute 'silent !' . <q-args>
\ | execute 'redraw!'

function! BuildIndex()
    VimwikiTOC
    VimwikiGenerateTags
endfunction
