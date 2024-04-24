#!/usr/bin/env fish

echo 'Waiting on the world to change...'

inotifywait -m ./markdown/*.md -e modify |
while read -r directory file action
    if string match -r '.*\.md$' "$file"
        make all
        cp ./output/cv.html ../davidthewatson.github.io/docs/cv/.
        cp ./output/cv.pdf ../davidthewatson.github.io/docs/cv/.
        cp ./output/cv.docx ../davidthewatson.github.io/docs/cv/.
        cp ./output/cv.rtf ../davidthewatson.github.io/docs/cv/.
        cp ./output/cv.txt ../davidthewatson.github.io/docs/cv/.
    end
end
