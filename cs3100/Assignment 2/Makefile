all:
	python test.py

clean:
	rm -rf *~ *.pyc

readme:
	pandoc -s README.markdown -o README.tex
	pdflatex README.tex > /dev/null
	rm *.aux *.log *~ *.out *.tex -rf
