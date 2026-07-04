VERSION=$(shell jq -r .version package.json)
DATE=$(shell date +%F)

all: index.html

clean:
	rm -f index.html

index.html: demo/index.md demo/template.html Makefile
	pandoc --toc --toc-depth=2 -s --number-sections --number-offset=0 --css src/reset.css --css src/index.css -Vversion=v$(VERSION) -Vdate=$(DATE) -i $< -o $@ --template=demo/template.html

dev: clean all
	@concurrently -n serve,watch \
		"browser-sync start --server $(TARGET_DIR) --port 8000 --no-open --files './**/*'" \
		"watchexec -w src -w demo -e css,html,js,md,yaml,lua make"

.PHONY: all clean dev

