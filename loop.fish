#!/usr/bin/env fish

echo 'Waiting on the world to change...'

inotifywait -m ./markdown/*.md -e modify |
    while read -r directory file action
        if string match -r '.*\.md$' "$file"
            make all
            cp ./output/*.html ../davidthewatson.github.io/docs/cv/.
            cp ./output/*.pdf ../davidthewatson.github.io/docs/cv/.
            cp ./output/*.docx ../davidthewatson.github.io/docs/cv/.
            cp ./output/*.rtf ../davidthewatson.github.io/docs/cv/.
            cp ./output/*.txt ../davidthewatson.github.io/docs/cv/.
        end
    end
