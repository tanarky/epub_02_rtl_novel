.PHONY: build_epub

NAME_EN = rtl_novel
OPTS = \
	--epub-metadata=metadata.xml \
	--epub-stylesheet=styles.css \
	--epub-cover-image=images/title.jpg

FILES = \
	rst/index.rst \
	rst/01_env.rst

OUTPUT_DIR_EPUB = output/epub

build_epub:
	rm -rf $(OUTPUT_DIR_EPUB)
	mkdir -p $(OUTPUT_DIR_EPUB)
	pandoc -t epub3 \
	-M page-progression-direction=rtl \
	-o output/epub/$(NAME_EN).epub \
	$(OPTS) \
	$(FILES)
