#LC_ALL=en_US.utf8

.PHONY: main clean FORCE

main: poster.pdf

poster.pdf: FORCE
	latexmk -pdflatex='lualatex -interaction nonstopmode' -pdf beamer-graphic.tex

clean:
	latexmk -pdf -C
