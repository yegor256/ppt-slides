# (The MIT License)
#
# Copyright (c) 2022 Yegor Bugayenko
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the 'Software'), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

.SHELLFLAGS = -e -x -c
.ONESHELL:

VERSION=0.0.0
NAME=ppt-slides

all: $(NAME).pdf test copyright zip

copyright:
	find . -name '*.tex' -o -name '*.sty' -o -name 'Makefile' | xargs -n1 grep -r "(c) $$(date +%Y) "

test: tests/*.tex $(NAME).sty
	if [ -d tests ]; then
		cd tests && make && cd ..
	fi

set-version:
	date=$$(date +%Y/%m/%d)
	sed -i "s|00\.00\.0000|$${date}|" $(NAME).sty
	sed -i "s/0\.0\.0/$(VERSION)/g" $(NAME).sty
	sed -i "s|00\.00\.0000|$${date}|" $(NAME).tex
	sed -i "s/0\.0\.0/$(VERSION)/g" $(NAME).tex
	sed -i "s/0\.0\.0/$(VERSION)/g" build.lua

$(NAME).pdf: $(NAME).tex $(NAME).sty
	latexmk -pdf $<
	texsc $<
	texqc --ignore 'You have requested document class' $<

zip: $(NAME).pdf $(NAME).sty
	rm -rf package
	mkdir package
	cd package
	mkdir $(NAME)
	cd $(NAME)
	cp ../../README.md .
	cp ../../$(NAME).sty .
	cp ../../$(NAME).tex .
	cp -r ../../ppt-templates .
	cp -r ../../ppt-schemes .
	cp ../../socrates.jpg .
	cp ../../.latexmkrc .
	latexmk -pdf $(NAME).tex
	rm .latexmkrc
	rm -rf _minted-* *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.run.xml *.out *.exc *.crumbs
	cat $(NAME).sty $(PARTS) | grep RequirePackage | gsed -e "s/.*{\(.\+\)}.*/hard \1/" | uniq > DEPENDS.txt
	cd ..
	zip -r $(NAME).zip *
	cp $(NAME).zip ../$(NAME)-ctan.zip
	unzip -l $(NAME).zip
	cd ..

clean:
	git clean -dfX
	cd tests && make clean && cd ..
