RAMA=edicion

pdf:
	/home/felix/arch-linux/ISO.sh
	xelatex 00\ arch-linux.tex
	xelatex 00\ arch-linux.tex
	rm -f *.aux *.log *.nav *.out *.snm *.toc
	git add .

push: 
	git push origin ${RAMA}
	git push forgejo ${RAMA}
