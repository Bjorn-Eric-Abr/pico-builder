sass_bin := "sass --load-path=node_modules/@picocss/pico/scss/ --quiet-deps --quiet "

clean:
    rm -r dist || true

build: clean
    npx {{ sass_bin }} src:dist

watch: clean
    npx {{ sass_bin }} --watch src:dist

build-compressed: clean
    npx {{ sass_bin }} --style=compressed src:dist

rename:
    #!/usr/bin/env fish
    for file in dist/styles*
        mv $file (string replace "styles" "pico" $file)
    end
