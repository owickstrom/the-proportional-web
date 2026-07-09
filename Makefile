VERSION=$(shell jq -r .version package.json)
DATE=$(shell date +%F)

all: index.html index.css

clean:
	rm -f index.html

index.html: src/demo/index.md Makefile index.css index.min.css
	pandoc \
		--toc --toc-depth=2 \
		-s \
		--number-sections --number-offset=0 \
		--css index.css \
		--css src/demo/demo.css \
		-M document-css=false \
		-V 'header-includes=<script src="index.js"></script>' \
		--template=src/demo/template.html \
 		-Vversion=v$(VERSION) -Vdate=$(DATE) \
		-i $< \
		| html-minifier --collapse-whitespace > $@

index.css: src/index.css src/reset.css
	echo "/* By Oskar Wickström\nLicensed under the MIT License (https://github.com/owickstrom/the-proportional-web/blob/main/LICENSE.md)\n*/" > $@
	esbuild --bundle $< >> $@

index.min.css: src/index.css src/reset.css
	echo "/* By Oskar Wickström\nLicensed under the MIT License (https://github.com/owickstrom/the-proportional-web/blob/main/LICENSE.md)\n*/" > $@
	esbuild --bundle --minify $< >> $@


dev: clean all
	@concurrently -n serve,watch \
		"browser-sync start --server $(TARGET_DIR) --port 8000 --no-open --files './**/*'" \
		"watchexec -w src -w src -e css,html,js,md,yaml,lua make"

.PHONY: all clean dev

