function mdcat --description 'Sane cat for Markdown files'
    pandoc -f markdown -t plain
end
