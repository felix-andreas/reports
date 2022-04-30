.PHONY: all clean dist web print pdf

REPORT = ${reports}

all: web print pdf

clean:
	rm -rf dist

dist:
	mkdir -p dist
	rsync -avu --delete figures layout/css layout/favicon.svg dist

web: dist
	pandoc $(REPORT).md \
	--output dist/$(REPORT).html \
	--defaults layout/options.yaml \
	--filter pandoc-crossref \
	--citeproc \
	--metadata=name:$(REPORT) \
	--template layout/templates/web.html \
	--css css/ui.css

print: dist
	pandoc $(REPORT).md \
	--output dist/$(REPORT).print.html \
	--defaults layout/options.yaml \
	--filter pandoc-crossref \
	--citeproc \
	--template layout/templates/print.html \
	--css css/interface.css \
	--css css/print.css

pdf: dist print
	google-chrome-stable http://127.0.0.1:8080/$(REPORT).print.html \
	--headless \
	--disable-gpu \
	--print-to-pdf-no-header \
	--no-margins \
	--print-to-pdf=dist/$(REPORT).pdf

.ONESHELL:
deploy:
	url=git@github.com:$$(grep github metadata.yaml | cut -d' ' -f2-).git
	cd dist
	git init
	git add -A
	git commit -m 'deploy'
	# git's default branch name is subject to change, let's make it future-proof
	git branch -M main
	git push -f $$url main:gh-pages
