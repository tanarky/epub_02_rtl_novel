.PHONY: build_epub

NAME_EN = rtl_novel
FONT_PATH = fonts/ipaexm.ttf
OPTS = \
	--epub-metadata=metadata.xml \
	-F ./bin/handleRuby \
	--epub-embed-font=$(FONT_PATH) \
	--epub-stylesheet=styles.css \
	--epub-cover-image=images/title.jpg

FILES = \
	md/01_unread.md \
	md/02.md \
	md/03.md \
	md/04.md \
	md/05.md

OUTPUT_DIR_EPUB = output/epub

build_epub:
	rm -rf $(OUTPUT_DIR_EPUB)
	mkdir -p $(OUTPUT_DIR_EPUB)
	pandoc -t epub3 \
	-M page-progression-direction=rtl \
	-o output/epub/$(NAME_EN).epub \
	$(OPTS) \
	$(FILES)
