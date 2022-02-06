SHELL := /bin/bash

ABSTRACT_FILES =  myMacros.tex \
	text-settings.tex \
	$(wildcard packages/*.sty) \
	abstract-examples.tex  \
	$(wildcard bst/biblatex-sp-unified/[^.]*)

test_abstract:
	rm -fr test
	mkdir test
	cd test; mkdir text-template
	cp -r --parents $(ABSTRACT_FILES) test/text-template
	cp abstract-template.tex \
		references.bib \
		latexmkrc \
		test
	cd test; \
			latexmk -pdf abstract-template.tex

release_abstract:
	rm -fr temp
	mkdir temp
	cd temp; mkdir text-template
	cp -r --parents $(ABSTRACT_FILES) temp/text-template
	cp abstract-template.tex \
		references.bib \
		latexmkrc \
		temp
	cd temp; zip -r abstract-template.zip *; mv abstract-template.zip ..
	rm -fr temp

#-------------------------------------------------------------------------------

ARTICLE_FILES =  myMacros.tex \
	text-settings.tex \
	scrarticle-settings.tex \
	$(wildcard packages/*.sty) \
	article-examples.tex  \
	$(wildcard bst/biblatex-sp-unified/[^.]*)

test_article:
	rm -fr test
	mkdir test
	cd test; mkdir text-template
	cp -r --parents $(ARTICLE_FILES) test/text-template
	cp article-template.tex \
		references.bib \
		latexmkrc \
		test
	cd test; \
			latexmk -pdf article-template.tex

release_article:
	rm -fr temp
	mkdir temp
	cd temp; mkdir text-template
	cp -r --parents $(ARTICLE_FILES) temp/text-template
	cp article-template.tex \
		references.bib \
		latexmkrc \
		temp
	cd temp; zip -r article-template.zip *; mv article-template.zip ..
	rm -fr temp

#-------------------------------------------------------------------------------

BOOK_FILES =  myMacros.tex \
	text-settings.tex \
	$(wildcard packages/*.sty) \
	book-examples.tex  \
	$(wildcard bst/biblatex-sp-unified/[^.]*)

test_book:
	rm -fr test
	mkdir test
	cd test; mkdir text-template
	cp -r --parents $(BOOK_FILES) test/text-template
	cp book-template.tex \
		references.bib \
		latexmkrc \
		test
	cd test; \
			latexmk -pdf book-template.tex

release_book:
	rm -fr tmp
	mkdir temp
	cd temp; mkdir text-template
	cp -r --parents $(BOOK_FILES) temp/text-template
	cp book-template.tex \
		references.bib \
		latexmkrc \
		temp
	cd temp; zip -r book-template.zip *; mv book-template.zip ..
	rm -fr temp

#-------------------------------------------------------------------------------

release_all: release_abstract release_article release_book

test_all: test_abstract test_article test_book
