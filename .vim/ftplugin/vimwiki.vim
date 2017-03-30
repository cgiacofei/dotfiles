autocmd BufRead *\(diary/*\)\@<! :VimwikiTOC
autocmd BufWritePost * :VimwikiRebuildTags
autocmd BufWritePost index.md :VimwikiGenerateTags
