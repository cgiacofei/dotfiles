autocmd BufRead *\(diary/*\)\@<! :VimwikiTOC
autocmd BufWritePost * :VimwikiRebuildTags
autocmd BufWritePost index.md :VimwikiGenerateTags

augroup vimwiki
au! BufRead */vimwiki/index.md  !git pull;git update
au! BufWritePost */vimwiki/*  !git add <afile>;git commit -m "Wiki Commit.";git push
augroup END
