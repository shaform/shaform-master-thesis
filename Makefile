MAIN=thesis
LIBVERSION=thesis-lib
LATEX=xelatex
BIBTEX=bibtex
RM=rm -f
PDF_PWD=r02922036

.SUFFIXES: .tex

all: $(MAIN).pdf

$(MAIN).pdf: files
	cp without-watermark.tex watermark.tex
	$(LATEX) $(MAIN)
	$(BIBTEX) $(MAIN)
	$(LATEX) $(MAIN)
	$(LATEX) $(MAIN)
	$(RM) watermark.tex

ntulib: files
	cp with-watermark.tex watermark.tex
	$(LATEX) $(MAIN)
	$(BIBTEX) $(MAIN)
	$(LATEX) $(MAIN)
	$(LATEX) $(MAIN)
	pdftk $(MAIN).pdf output $(LIBVERSION).pdf owner_pw $(PDF_PWD) allow Printing allow ScreenReaders
	$(RM) watermark.tex $(MAIN).pdf

files: *.tex chapters/*.tex ntuthesis.cls thesis.bib images/* tables/*.tex

clean:
	$(RM) *.log *.aux *.dvi *.lof *.lot *.toc *.bbl *.blg

clean-pdf: 
	$(RM) $(MAIN).pdf $(LIBVERSION).pdf

clean-all: clean clean-pdf

setup:
	sudo apt-get install texlive texlive-xetex texlive-latex-recommended texlive-latex-extra texlive-bibtex-extra texlive-science pdftk
