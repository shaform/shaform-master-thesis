MAIN=thesis
TMPTHESIS=thesis-tmp
LIBVERSION=thesis-lib
LATEX=xelatex
BIBTEX=bibtex
RM=rm -f
PDF_PWD=oXHPbuh2o7wOHjDSHSIQN

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
	pdftk A=$(MAIN).pdf cat A1 A3-end output $(TMPTHESIS).pdf
	pdftk $(TMPTHESIS).pdf output $(LIBVERSION).pdf owner_pw $(PDF_PWD) allow Printing allow ScreenReaders
	$(RM) watermark.tex $(TMPTHESIS).pdf

files: *.tex chapters/*.tex ntuthesis.cls thesis.bib tables/*.tex

clean:
	$(RM) *.log *.aux *.dvi *.lof *.lot *.toc *.bbl *.blg

clean-pdf: 
	$(RM) $(MAIN).pdf $(LIBVERSION).pdf

clean-all: clean clean-pdf

setup:
	sudo apt-get install texlive texlive-xetex texlive-latex-recommended texlive-latex-extra texlive-bibtex-extra texlive-science pdftk
